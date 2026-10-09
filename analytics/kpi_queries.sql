-- Illustrative SQL. Adapt timestamp syntax to your database.
-- Metric definitions should be reviewed before production use.

-- 1. Case count by status
SELECT status, COUNT(*) AS case_count
FROM shelf_gap_cases
GROUP BY status
ORDER BY case_count DESC;

-- 2. Open and overdue actions (requires a consistent current-time expression)
SELECT COUNT(*) AS overdue_open_cases
FROM shelf_gap_cases
WHERE status NOT IN ('resolved_verified', 'closed_unresolved')
  AND action_due_at IS NOT NULL
  AND action_due_at < CURRENT_TIMESTAMP;

-- 3. Verified resolutions
SELECT
  COUNT(*) AS verified_resolved_cases
FROM shelf_gap_cases
WHERE status = 'resolved_verified'
  AND follow_up_at IS NOT NULL
  AND follow_up_outcome = 'resolved';

-- 4. Cause categories should be reported with separate confirmed and provisional counts.
SELECT
  COALESCE(confirmed_cause, 'not_confirmed') AS confirmed_cause_category,
  COALESCE(provisional_cause, 'not_recorded') AS provisional_cause_category,
  COUNT(*) AS case_count
FROM shelf_gap_cases
GROUP BY confirmed_cause, provisional_cause
ORDER BY case_count DESC;

-- Note: time-to-resolution and repeat-gap rates require explicit treatment of
-- unresolved cases, observation windows, duplicate cases, and data completeness.
-- Do not interpret association as causation.

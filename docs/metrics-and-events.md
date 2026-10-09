# Metrics and Event Definitions

## North-star candidate

**Verified shelf-gap resolution rate:** percentage of eligible cases that receive a documented corrective action and a follow-up verification indicating the issue is resolved within a defined observation window.

This is a candidate metric, not yet validated as the best north-star measure.

## Operational metrics

### Time to triage
Time between case creation and first documented triage. Report median and distribution, not only average.

### Time to verified resolution
Time between case creation and follow-up verification of resolution. Report unresolved cases separately to avoid survivorship bias.

### Initial-check completion rate
Cases with all required applicable initial checks completed divided by cases eligible for those checks.

### Verified closure rate
Cases closed as resolved with a follow-up outcome and timestamp divided by all cases closed as resolved.

### Repeat-gap rate
Resolved SKU-location cases followed by another gap for the same SKU-location within the defined period divided by resolved cases with a complete follow-up window.

### Cause confirmation rate
Investigated cases with a cause marked confirmed and supporting evidence divided by investigated cases. A higher rate is not automatically better if users are overconfident; audit evidence quality.

### Overdue action rate
Open cases with a past-due action divided by all open cases with a due date.

## Event names for analytics
- case_created
- physical_check_saved
- data_check_saved
- recommendation_viewed
- cause_marked_provisional
- cause_marked_confirmed
- action_assigned
- action_completed
- follow_up_recorded
- case_resolved_verified
- case_escalated
- case_closed_unresolved

Only log data needed for product improvement. Avoid collecting unnecessary personal information.

## Guardrails
- User time per case.
- Abandonment rate.
- Cases with missing evidence.
- Cases incorrectly marked resolved in audit.
- Duplicate cases.
- User reports of workflow burden.
- Percentage of cases with no actionable next step.

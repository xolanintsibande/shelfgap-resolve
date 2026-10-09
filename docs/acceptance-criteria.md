# Acceptance Criteria

## Create case
- Given a user opens the new-case form, when they enter required fields and submit, then a unique case ID is created and the case appears in the case list.
- Required fields are validated with readable messages.
- Unknown or unavailable fields are not silently converted to zero or false.
- Created timestamp is stored consistently.

## Physical checks
- User can choose: found on shelf, found in back room, found elsewhere in store, not found, or unknown.
- Shelf status and store stock status are stored separately.
- A back-room finding must not automatically be labelled as confirmed root cause.

## Data checks
- User can record system stock as positive, zero, negative/invalid, or unknown where applicable.
- User can record order and delivery details as available, unavailable, or not checked.
- Missing data is displayed as unknown/not supplied, not as a factual zero.

## Suggested next checks
- Every recommendation includes a reason.
- Recommendations are rules-based and inspectable.
- The app never states that a cause is confirmed solely because a pattern matches.
- If evidence conflicts or is missing, the app recommends additional validation or escalation.

## Cause classification
- Provisional cause and confirmed cause are separate fields.
- A confirmed cause requires evidence notes and a validation step.
- User can leave cause as unknown.
- No category assigns blame to a person by default.

## Action and status
- User can assign an action, owner role, due date and status.
- Valid status transitions are documented.
- Overdue status is derived from due date and open status.
- A case cannot be marked Resolved (verified) without a follow-up outcome and timestamp.

## Dashboard
- KPI cards show their definitions or have a link to definitions.
- Dashboard values match the underlying case records.
- Empty data does not produce misleading NaN/Infinity values.
- Sample-data mode is visibly labelled.
- Metrics with insufficient data show “Not enough data” rather than a fabricated rate.

## Privacy and security
- No live retailer credentials or confidential records are included.
- Inputs are validated.
- Errors do not expose secrets or stack traces to end users.

# UX Specification

## Design goals
- Mobile-first: usable on a phone during store work.
- Fast: capture an initial case in a short sequence.
- Clear: simple language, not analytics jargon.
- Trustworthy: distinguish observations, data, hypotheses and confirmed causes.
- Accessible: labels, keyboard access, contrast, focus states and meaningful validation messages.

## Screen 1: Dashboard
Show:
- Total cases in selected period.
- Open cases.
- Overdue actions.
- Verified resolution rate.
- Median time to verified resolution.
- Repeat-gap rate only if sufficient follow-up data exists.
- Recent cases table/list.
- Visible banner: “Demo uses fictional sample data” when applicable.

Each KPI must have an info explanation or linked definition.

## Screen 2: New case
Fields:
- SKU.
- Product name.
- Store/location.
- Observation date/time.
- Shelf status.
- Expected bay and observed bay.
- Notes.
- Submit button.

Required fields should be minimal. Additional checks occur in the case workflow.

## Screen 3: Case detail / investigation
Sections:
1. Case summary.
2. Physical checks.
3. Available data checks.
4. Suggested next checks with reasons.
5. Provisional cause.
6. Evidence notes.
7. Action assignment.
8. Status history.
9. Follow-up verification.

## Screen 4: Action and verification
Capture action, owner role, due date, completion status, follow-up result and verification notes.

Prevent “resolved verified” unless follow-up result and timestamp are present.

## Screen 5: Cases list
Search and filters by status, SKU, store, cause and date. Include clear empty states.

## Copy principles
Prefer “What did you check?” over “Complete root-cause analysis”.
Prefer “Not checked” or “Unavailable” over blank ambiguous fields.
Prefer “Possible cause” over “Cause” until validated.

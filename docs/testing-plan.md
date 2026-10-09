# Testing Plan

## Unit tests
- Case ID generation is unique.
- Required fields are validated.
- Null values are not converted to zero.
- Each root-cause rule returns only a suggested check, not a confirmed cause.
- KPI calculations use documented denominators.
- Time-to-resolution excludes unresolved cases from resolved-time summaries.
- Verified closure requires follow-up result and timestamp.
- Repeat-gap rate respects the defined time window.

## Workflow tests
1. Create case with valid data.
2. Attempt to create a case with missing required fields.
3. Record product found in back room and inspect suggested checks.
4. Record system stock positive but physical stock not found.
5. Record conflicting data and ensure cause remains unknown.
6. Assign action and update status.
7. Attempt to resolve without follow-up; app should block it.
8. Add follow-up and verify resolution.
9. Confirm dashboard updates.
10. Filter/search for a case.
11. Load sample data and confirm fictional-data banner is visible.

## Usability tests
Ask a participant to complete the case flow without coaching. Observe:
- Where they hesitate.
- Which terms they do not understand.
- Whether the suggested next checks make sense.
- Whether data entry takes too long.
- Whether they know how to leave an uncertain cause unconfirmed.

Do not collect confidential retailer information during portfolio tests.

## Release checklist
- All P0 acceptance criteria pass.
- No secrets committed.
- Sample data is labelled fictional.
- README setup instructions work on a clean environment.
- Screenshots show only demo data.
- Limitations and non-goals are documented.

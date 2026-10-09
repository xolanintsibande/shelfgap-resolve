# Architecture Proposal

## Principle

Choose the simplest stack that produces a reliable, testable MVP. Do not add infrastructure before requirements justify it.

## Suggested implementation options

### Option A: Single full-stack web application
- React/Next.js or another familiar web framework.
- TypeScript.
- SQLite for a local demo, or a managed PostgreSQL database if deployment requires it.
- Server-side validation.
- Unit and end-to-end tests.
- Responsive component library with accessible controls.

### Option B: Rapid prototype
- Streamlit or a similarly lightweight framework.
- SQLite/CSV seed data.
- Focus on validating the investigation workflow and metric definitions.

Pick one stack and document why. Do not combine alternatives into a complicated hybrid.

## Logical components
- Case management.
- Physical/data check capture.
- Recommendation rules engine.
- Action tracking.
- Follow-up verification.
- Metrics service.
- Dashboard and case search.

## Data entities
- Case.
- CheckRecord.
- Recommendation.
- Action.
- FollowUp.
- AuditEvent.

## Data integrity
- Use unique case IDs.
- Store timestamps consistently.
- Preserve unknown as null or explicit unknown enum.
- Keep provisional and confirmed causes separate.
- Use transactions where a status update and follow-up record must remain consistent.
- Avoid storing unnecessary personal data.

## Security
- No secrets in source control.
- Use environment variables for credentials.
- Use synthetic seed data by default.
- Add authentication only if the deployment context requires it; never imply that a public demo is safe for confidential records.

# Product Requirements Document (PRD)

## 1. Document status

Draft for MVP build. Requirements are proposals and should be refined after user discovery.

## 2. Goal

Build a usable prototype that supports the lifecycle of a shelf-gap case from report to follow-up verification.

## 3. Non-goals

- Predicting sales loss.
- Proving causal impact on revenue.
- Automatically changing inventory or orders.
- Replacing a retailer's official inventory or task-management system.
- Diagnosing theft or employee fault.
- Integrating with live commercial systems.

## 4. Functional requirements

### FR-01: Create case
A user can create a case with a unique case ID, SKU, product description, store/location, observation timestamp, shelf status, reporter role, and free-text notes.

### FR-02: Record physical checks
A user can record whether the product was found on the shelf, in the back room, elsewhere in store, or not found. Unknown is an allowed answer.

### FR-03: Record data checks
A user can record system stock status, last sales activity, order date, expected delivery date, delivery/received quantity, and planogram/bay check where available. Every check can be marked unavailable or not checked.

### FR-04: Evidence and confidence
The user can add evidence notes and select a provisional cause category. The app clearly labels provisional causes as unconfirmed. A confirmed cause requires a supporting note or evidence reference and a completed validation step.

### FR-05: Next-step guidance
The app uses transparent rules to suggest one or more checks. It must state why a check is suggested and must not automatically assert a cause.

### FR-06: Assign action
A user can record an action, owner/role, due date, priority and status.

### FR-07: Case status
Supported statuses: New, Triage in progress, Action assigned, Awaiting follow-up, Resolved (verified), Escalated, Closed (unresolved/insufficient evidence).

### FR-08: Follow-up verification
A case cannot be marked Resolved (verified) unless a follow-up outcome and verification timestamp are recorded. The user can close a case as unresolved with a reason.

### FR-09: Search and filter
Users can search/filter by case ID, SKU, location, status, provisional/confirmed cause, priority and date range.

### FR-10: Dashboard
Display cases opened, unresolved cases, overdue actions, verified resolution rate, median time to resolution, repeat-gap rate where enough data exists, and cause confirmation rate. Show denominators and data limitations.

### FR-11: Audit history
Record key case changes with timestamp and action summary. Do not store secrets or unnecessary personal data.

### FR-12: Synthetic seed data
The app can load clearly labelled fictional sample cases for demonstration.

## 5. Non-functional requirements

- Responsive mobile-first interface.
- Accessible labels, keyboard navigation and visible focus states.
- Clear loading, empty, validation and error states.
- No secret keys in client-side code.
- Input validation on client and server where applicable.
- Reasonable performance for a small demo dataset.
- Clear distinction between sample and user-entered records.
- Privacy-by-design; collect only data needed for the workflow.

## 6. MVP user journey

Dashboard → New shelf-gap case → Physical checks → Record data checks → Review suggested next checks → Assign action → Update status → Follow-up verification → Case detail / dashboard.

## 7. Prioritisation

P0 = must have for first usable MVP.
P1 = useful if time permits.
P2 = later.

| Feature | Priority | Rationale |
|---|---|---|
| Create/view/edit case | P0 | Core workflow |
| Physical and data check form | P0 | Captures investigation evidence |
| Rule-based next-check guidance | P0 | Product's core hypothesis |
| Action assignment/status | P0 | Moves from observation to action |
| Follow-up verification | P0 | Avoids false closure |
| Basic dashboard | P0 | Demonstrates operational reporting |
| Search/filter | P1 | Useful once cases accumulate |
| CSV export | P1 | Enables portfolio analysis |
| Role-based permissions | P2 | Not needed for local demo unless easy |
| Live integrations / AI / image recognition | Out of scope | High complexity and unvalidated need |

## 8. Definition of done

The MVP is done when a user can create a case, record checks, receive transparent suggested next checks, assign an action, update status, record follow-up verification, and see the case reflected accurately in the dashboard. Core flows have tests and the README documents setup, data model and limitations.

# MASTER PROMPT: Build ShelfGap Resolve MVP

Copy the complete prompt below into your coding assistant or app-building environment. If the tool has limited context, provide the repository files first, then the prompt.

---

## ROLE

Act as a senior product manager, UX designer, full-stack engineer, data analyst and QA lead. Build a small, coherent, working MVP for **ShelfGap Resolve**, a proposed FMCG retail shelf-gap investigation and resolution tool.

Do not only provide a plan, mockup, screenshots or code snippets. Implement a functioning application in the available workspace. If the environment cannot execute or deploy code, provide the complete source files and exact run instructions.

## PRODUCT CONTEXT

A shelf gap is an observation, not a confirmed root cause. A product may be absent from its expected shelf position because:
- It is in the back room or another location.
- Replenishment has not happened.
- System stock does not match physical stock.
- Ordering, delivery or receiving records need investigation.
- Product placement or expected bay information is incorrect.
- Evidence is incomplete or conflicting.

These are possible explanations, not claims about which cause is most common.

The product should guide a user through physical and data checks, record evidence, suggest next checks using transparent rules, assign corrective action, and verify the outcome.

## IMPORTANT TRUTH AND SCOPE RULES

1. This is a product concept and portfolio MVP, not an existing commercial product.
2. Do not claim it is deployed, used by a retailer, or proven to improve availability.
3. Use only synthetic seed data. Label it clearly in the UI.
4. Never invent business metrics, user research findings, customer quotes or pilot results.
5. Never treat a rule match as a confirmed root cause.
6. Provide “Unknown”, “Not checked” and “Unavailable” states.
7. Do not infer theft, employee fault or supplier fault from a stock discrepancy.
8. Do not integrate with live retailer systems or request credentials.
9. Do not add AI, computer vision or predictive features to the first MVP.
10. Do not use real retailer logos, confidential screenshots, customer data or employer data.

## PRIMARY USER

A store associate or replenishment team member who observes a shelf gap and needs to record the situation and know what to check next.

## SECONDARY USERS

- Store supervisor who monitors case ownership, action and escalation.
- Retail operations analyst who reviews recurring issues and resolution measures.

These are design assumptions, not validated personas.

## PRODUCT GOAL

Allow a user to complete this flow:
1. Create a shelf-gap case.
2. Record physical checks.
3. Record available stock/order/delivery/placement information.
4. See transparent suggested next checks with reasons.
5. Keep possible causes separate from confirmed causes.
6. Assign an action and owner role.
7. Update the case status.
8. Record a follow-up verification.
9. Review the case in a simple dashboard.

## STACK SELECTION

First inspect the existing workspace and repository files. If a working app already exists, preserve its conventions and extend it.

If starting from scratch, choose one stack suitable for a beginner-friendly, portfolio-ready MVP. Preferred default:
- Next.js with TypeScript for UI and application logic.
- A simple database layer appropriate to the environment. SQLite is acceptable for a local demo; use an existing managed database only if already configured.
- A clean responsive UI using accessible components.
- Unit tests for the business rules and KPI calculations.

If this stack cannot run in the environment, choose the simplest working alternative and explain why. Do not use multiple frameworks unnecessarily. Do not create a frontend that depends on a backend that does not exist.

## REQUIRED SCREENS

### 1. Dashboard
Show:
- Total cases.
- Open cases.
- Overdue actions.
- Verified resolution rate.
- Median time to verified resolution, if supported by sufficient data.
- Repeat-gap rate only if enough follow-up data exists.
- Recent cases.
- A visible “Demo data is fictional” banner when sample data is loaded.

Every KPI must have a readable definition. If the dataset is insufficient, show “Not enough data” rather than a fabricated value.

### 2. Cases list
Show case ID, SKU, product, store, observed time, status, provisional/confirmed cause, action owner role and due date. Include search and filters by status, SKU, store and cause if feasible.

### 3. New case form
Capture:
- SKU (required).
- Product name (required).
- Store/location (required).
- Observation date/time (required).
- Shelf status: empty, partly stocked, misplaced, unknown.
- Expected bay and observed bay (optional).
- Notes (optional).

Generate a unique case ID. Validate inputs and show clear error messages.

### 4. Case detail and investigation
Show:
- Case summary.
- Physical check fields: on shelf, back room, elsewhere in store, not found, unknown.
- System stock quantity with null/unknown distinct from zero.
- Last sale information where available.
- Order date, expected delivery date, delivered quantity and received quantity where available.
- Expected and observed bay.
- Evidence notes.
- Suggested next checks and reasons.
- Provisional cause category.
- Confirmed cause category, only after evidence and validation.
- Action, owner role, due date and status history.
- Follow-up verification.

### 5. Action and follow-up
Allow users to record an action, owner role, due date, action status and follow-up outcome:
- resolved
- not resolved
- inconclusive

A case cannot be marked “Resolved (verified)” without a follow-up timestamp, outcome “resolved”, and supporting resolution note. If it is not resolved, allow the user to reopen, escalate or close as unresolved with a reason.

## TRANSPARENT RULE-BASED GUIDANCE

Implement a small, separate, tested rules module. The app should display a section called “Suggested next checks”, not “AI diagnosis”.

Rules:
- If product is found in the back room: suggest checking replenishment, shelf capacity and expected bay.
- If product is found elsewhere: suggest verifying location and expected bay/planogram.
- If system stock is positive but physical stock is not found: suggest reconciling recent sales, receiving, transfers, returns and adjustments.
- If no physical stock and system stock is zero or lower: suggest reviewing order and delivery history if available.
- If order and received quantities differ or an expected delivery date has passed: suggest checking delivery documents, partial delivery and receiving records.
- If evidence is missing or conflicting: suggest collecting missing evidence or escalating.

Every suggestion must state:
- What observed field triggered it.
- Why the check is relevant.
- What evidence could confirm or reject the possibility.
- “This is a suggested check, not a confirmed cause.”

Never mark a cause confirmed automatically. The user must explicitly confirm a cause and add supporting evidence. Allow cause to remain unknown.

## DATA MODEL

Use a well-structured model for:
- Case.
- Case event/audit history.
- Checks or investigation evidence if appropriate.
- Action and follow-up fields.

Required case fields:
case_id, sku, product_name, store_id, bay_expected, bay_observed, observed_at, created_at, shelf_status, physical_stock_status, system_stock_qty, last_sale_at, order_date, expected_delivery_date, delivered_qty, received_qty, provisional_cause, confirmed_cause, evidence_notes, next_action, owner_role, action_due_at, status, follow_up_at, follow_up_outcome, resolution_notes.

Use null for unknown numeric/date values. Do not silently convert missing data to zero. Store timestamps consistently. Validate enums and numeric inputs.

## KPI DEFINITIONS

Implement these carefully and display definitions in the UI:

- Total cases: number of unique cases in the selected dataset/period.
- Open cases: cases not in resolved_verified or closed_unresolved.
- Overdue actions: open cases with a due date earlier than the current time.
- Verified resolution rate: eligible closed cases with status resolved_verified, a follow-up timestamp and outcome resolved, divided by the explicitly documented denominator. If a denominator cannot be justified from available data, show the count and explain the limitation instead of inventing a rate.
- Time to verified resolution: difference between created_at and follow_up_at for verified resolved cases only. Show median where supported. Do not treat unresolved cases as resolved.
- Repeat-gap rate: same SKU and store/bay recurring within a defined window, only if case history and follow-up window support calculation. If sample data is insufficient, show “Not enough data”.
- Cause confirmation rate: cases with confirmed cause and supporting evidence divided by investigated cases. Explain that a high rate does not automatically mean better performance.

Do not claim that a KPI proves the product caused an outcome.

## DESIGN DIRECTION

Create a polished but practical retail-operations interface:
- Mobile-first and responsive.
- Professional, uncluttered, high-contrast visual hierarchy.
- Use restrained retail/operations styling.
- Clear status labels.
- Simple icons only when they aid understanding.
- Avoid decorative charts that do not answer a question.
- Include accessible form labels, keyboard focus and readable validation.
- Use realistic but fictional examples.
- Do not use generic marketing landing-page fluff. Prioritise the working workflow.

## SEED DATA

Create 8–15 fictional sample cases that represent a mix of:
- Product in back room.
- Product in wrong bay.
- System stock positive but product not found physically.
- No stock with missing delivery evidence.
- Order/received quantity discrepancy.
- Unknown/incomplete evidence.
- Verified resolution.
- Overdue action.

Use obviously fictional store IDs and SKU values. Add a persistent visible sample-data banner. Include enough data to demonstrate filters and dashboard states without presenting sample patterns as industry statistics.

## TESTS

Write tests for:
- Required-field validation.
- Unknown vs zero handling.
- Rule-based suggestions.
- Cause not automatically confirmed.
- Verified resolution requires follow-up.
- KPI denominator and edge cases.
- Unresolved cases excluded from resolved-time calculations.
- Dashboard values matching underlying cases.

Also test a complete workflow:
create case → record checks → view suggestions → assign action → update status → add follow-up → verify resolution → dashboard updates.

## REQUIRED DELIVERABLES

Implement the application and provide:
1. Working source code.
2. Database schema or data model.
3. Synthetic seed data.
4. Business-rule module.
5. Tests.
6. `.env.example` if environment variables are needed.
7. README with prerequisites, installation, run, test and build commands.
8. `docs/` product brief, PRD, data dictionary, rule logic, KPI definitions, testing plan, limitations and validation plan.
9. Screenshots or a short walkthrough only if the environment can generate them from the actual running app.
10. A clear list of what is implemented, what remains incomplete and any known limitations.

## WORKING METHOD

1. Inspect the current workspace and files.
2. Summarise the intended architecture briefly.
3. Implement the end-to-end core workflow first.
4. Run the app and tests if the environment supports it.
5. Fix errors rather than merely reporting them.
6. Check mobile responsiveness and empty/error states.
7. Verify all displayed metrics against sample records.
8. Update the README with exact commands that work in this environment.
9. Do not claim a command passed unless you actually ran it successfully.
10. If blocked by missing tools or credentials, use a local synthetic-data implementation and explain the limitation.

## DEFINITION OF DONE

The MVP is complete only when:
- A user can create and view a case.
- Physical and data checks can be recorded.
- Suggested checks have transparent reasons.
- Provisional and confirmed causes are separate.
- Actions can be assigned and tracked.
- Verified resolution requires follow-up evidence.
- Dashboard values match case records.
- Synthetic data is clearly labelled.
- Core tests pass, or any unrun tests are explicitly disclosed.
- README setup instructions are accurate.
- No unsupported claims of deployment, adoption, or business impact appear.

Start by inspecting the workspace, then implement the smallest complete working version. Do not stop after producing a plan.

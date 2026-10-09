# Root-Cause Guidance Logic

## Purpose

Provide transparent next-check recommendations. The logic is a guide for investigation, not an automated diagnosis.

## Rules

### Rule A: Product found in back room
**Signal:** physical_stock_status = back_room  
**Suggest:** check replenishment responsibility, shelf capacity, expected bay and recent replenishment task if available.  
**Do not conclude:** replenishment delay is confirmed without checking the process and evidence.

### Rule B: Product found elsewhere in store
**Signal:** physical_stock_status = elsewhere_in_store  
**Suggest:** verify location, planogram/bay information and whether the product is intentionally stored elsewhere.  
**Do not conclude:** planogram non-compliance until the expected location is verified.

### Rule C: System shows stock, physical count finds none
**Signal:** system_stock_qty > 0 AND physical_stock_status = not_found  
**Suggest:** reconcile recent sales, receiving, transfers, returns, adjustments and count timing.  
**Do not conclude:** theft, shrinkage or staff error.

### Rule D: No physical stock and low/zero system stock
**Signal:** physical_stock_status = not_found AND system_stock_qty is 0 or less  
**Suggest:** review order history, expected delivery, delivered quantity and supplier/store replenishment process where available.  
**Do not conclude:** supplier failure without evidence.

### Rule E: Order/delivery mismatch
**Signal:** order and received/delivered quantities differ, or expected delivery has passed  
**Suggest:** inspect delivery documents, receiving records, partial deliveries and timing.  
**Do not conclude:** delivery error until records are reconciled.

### Rule F: Conflicting or missing evidence
**Signal:** key fields unknown, unavailable, or conflicting  
**Suggest:** request missing checks or escalate to the appropriate role.  
**Do not force a cause category.**

## UI copy

Use: “Suggested next check”, “Possible explanation”, “Evidence recorded”, “Cause not yet confirmed”.

Avoid: “Root cause detected”, “The system knows why”, “Confirmed” without explicit evidence and validation.

## Explainability requirement

Each suggested next check must include:
- Triggering observations/data.
- Why the check is relevant.
- What evidence could support or reject the hypothesis.
- Reminder that the cause remains unconfirmed.

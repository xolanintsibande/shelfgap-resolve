# Data Dictionary

## Case fields

| Field | Type | Required | Meaning |
|---|---|---:|---|
| case_id | string/UUID | Yes | Unique case identifier |
| sku | string | Yes | Product/SKU identifier; use fictional values in demo |
| product_name | string | Yes | Product description |
| store_id | string | Yes | Fictional store/location identifier |
| bay_expected | string | No | Expected shelf bay/location |
| bay_observed | string | No | Observed location |
| observed_at | datetime | Yes | Time the gap was observed |
| created_at | datetime | Yes | Case creation time |
| shelf_status | enum | Yes | Empty, partly stocked, product misplaced, unknown |
| physical_stock_status | enum | Yes | Shelf, back room, elsewhere, not found, unknown |
| system_stock_qty | integer/null | No | Recorded quantity; null means unknown, not zero |
| last_sale_at | datetime/null | No | Most recent recorded sale, if available |
| order_date | date/null | No | Order date, if available |
| expected_delivery_date | date/null | No | Expected delivery date |
| delivered_qty | integer/null | No | Quantity recorded as delivered |
| received_qty | integer/null | No | Quantity physically/administratively received |
| provisional_cause | enum/null | No | Hypothesis, not confirmed |
| confirmed_cause | enum/null | No | Cause validated with evidence |
| evidence_notes | text | No | Concise evidence and source description |
| next_action | text/null | No | Corrective or investigative action |
| owner_role | enum/null | No | Role responsible, not a real person's name in demo |
| action_due_at | datetime/null | No | Due date/time |
| status | enum | Yes | Defined case status |
| follow_up_at | datetime/null | No | Verification timestamp |
| follow_up_outcome | enum/null | No | Resolved, not resolved, inconclusive |
| resolution_notes | text/null | No | Evidence supporting closure |

## Enumerations

### shelf_status
- empty
- partly_stocked
- misplaced
- unknown

### physical_stock_status
- on_shelf
- back_room
- elsewhere_in_store
- not_found
- unknown

### cause categories
- replenishment_delay
- inventory_record_mismatch
- order_or_supply_issue
- receiving_discrepancy
- product_misplacement
- planogram_or_location_mismatch
- damage_or_quality_hold
- unknown
- other

### status
- new
- triage_in_progress
- action_assigned
- awaiting_follow_up
- resolved_verified
- escalated
- closed_unresolved

### follow_up_outcome
- resolved
- not_resolved
- inconclusive

## Data-quality rules
- Null is not the same as zero.
- A date without timezone must be handled consistently by the app.
- SKU and store IDs in sample data are fictional.
- A cause is not confirmed by a rule alone.
- Do not calculate time-to-resolution for unresolved cases as if they were resolved.

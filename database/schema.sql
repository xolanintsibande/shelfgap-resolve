-- Illustrative relational schema for the ShelfGap Resolve MVP.
-- Use synthetic data only. Adjust syntax to the chosen database.

CREATE TABLE IF NOT EXISTS shelf_gap_cases (
    case_id TEXT PRIMARY KEY,
    sku TEXT NOT NULL,
    product_name TEXT NOT NULL,
    store_id TEXT NOT NULL,
    bay_expected TEXT,
    bay_observed TEXT,
    observed_at TEXT NOT NULL,
    created_at TEXT NOT NULL,
    shelf_status TEXT NOT NULL CHECK (shelf_status IN ('empty','partly_stocked','misplaced','unknown')),
    physical_stock_status TEXT NOT NULL CHECK (physical_stock_status IN ('on_shelf','back_room','elsewhere_in_store','not_found','unknown')),
    system_stock_qty INTEGER,
    last_sale_at TEXT,
    order_date TEXT,
    expected_delivery_date TEXT,
    delivered_qty INTEGER,
    received_qty INTEGER,
    provisional_cause TEXT,
    confirmed_cause TEXT,
    evidence_notes TEXT,
    next_action TEXT,
    owner_role TEXT,
    action_due_at TEXT,
    status TEXT NOT NULL CHECK (status IN ('new','triage_in_progress','action_assigned','awaiting_follow_up','resolved_verified','escalated','closed_unresolved')),
    follow_up_at TEXT,
    follow_up_outcome TEXT CHECK (follow_up_outcome IN ('resolved','not_resolved','inconclusive') OR follow_up_outcome IS NULL),
    resolution_notes TEXT
);

CREATE TABLE IF NOT EXISTS case_events (
    event_id TEXT PRIMARY KEY,
    case_id TEXT NOT NULL REFERENCES shelf_gap_cases(case_id),
    event_type TEXT NOT NULL,
    event_at TEXT NOT NULL,
    event_summary TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_cases_status ON shelf_gap_cases(status);
CREATE INDEX IF NOT EXISTS idx_cases_sku_store ON shelf_gap_cases(sku, store_id);
CREATE INDEX IF NOT EXISTS idx_cases_created_at ON shelf_gap_cases(created_at);

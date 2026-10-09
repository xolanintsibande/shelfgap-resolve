# ShelfGap Resolve
### Product Management Case Study and MVP Blueprint

**Status:** Product concept / prototype in development  
**Domain:** FMCG retail operations, shelf availability, inventory investigation  
**Primary market context:** South African grocery and FMCG retail  
**Repository purpose:** Demonstrate end-to-end product thinking, operational understanding, data modelling, and MVP delivery.

> ShelfGap Resolve is a proposed product concept. It has not been deployed in a retailer or proven to improve availability. All sample records in this repository are fictional and intended for educational prototyping.

## Problem statement

A shelf gap is an observable symptom, not a confirmed root cause. The product may be absent from the shelf because stock is unavailable, stock is recorded inaccurately, replenishment has not happened, the product is in the wrong location, or relevant evidence is missing. These explanations require different checks and actions.

ShelfGap Resolve is designed to guide a store user through a structured investigation, record evidence, track corrective action, and verify whether the issue was resolved.

## Product vision

Help retail teams move from detecting a shelf gap to taking a documented, evidence-supported next step, without treating an unverified hypothesis as a confirmed cause.

## Product principles

1. **Evidence before diagnosis:** do not present a possible cause as confirmed without supporting evidence.
2. **Unknown is a valid state:** users must be able to say that evidence is unavailable or inconclusive.
3. **Different problems need different actions:** shelf availability, store stock, inventory accuracy, replenishment and placement are related but distinct.
4. **Make the next step clear:** prioritise a practical investigation workflow over a dashboard full of charts.
5. **Measure verified outcomes:** a case is not resolved solely because someone changes its status.
6. **Protect retail information:** use synthetic or authorised data; do not upload confidential employer, retailer, customer or internal system data.

## MVP scope

### In scope
- Create a shelf-gap case.
- Capture SKU, location, time, shelf status and initial observations.
- Record physical shelf and back-room checks.
- Record system stock, order and delivery checks when available.
- Suggest next checks using transparent rule-based logic.
- Keep possible causes separate from confirmed causes.
- Assign an action, owner and due date.
- Track case status and resolution verification.
- View a simple KPI dashboard.
- Use synthetic seed data and a clear data dictionary.

### Out of scope for first MVP
- AI diagnosis or predictive machine learning.
- Computer vision and automatic shelf recognition.
- Automatic replenishment or ordering.
- Integration with live retailer systems.
- Claims of sales uplift or financial impact.
- Production deployment with real retailer data.

## Core workflow

1. Report a shelf gap.
2. Verify shelf and back-room situation.
3. Review available inventory, sales, order and delivery records.
4. Record checks and evidence.
5. Identify a supported cause or leave it unconfirmed.
6. Assign and complete an action.
7. Perform a follow-up check.
8. Analyse repeat issues and resolution performance.

## Suggested repository structure

```text
shelfgap-resolve/
├── README.md
├── LICENSE
├── .gitignore
├── .env.example
├── docs/
│   ├── product-brief.md
│   ├── product-requirements.md
│   ├── discovery-plan.md
│   ├── user-stories.md
│   ├── acceptance-criteria.md
│   ├── roadmap.md
│   ├── metrics-and-events.md
│   ├── data-dictionary.md
│   ├── root-cause-logic.md
│   ├── ux-specification.md
│   ├── architecture.md
│   ├── testing-plan.md
│   ├── pilot-and-validation-plan.md
│   ├── risks-and-assumptions.md
│   └── research-log.md
├── prompts/
│   └── build-mvp-master-prompt.md
├── data/
│   ├── sample_cases.csv
│   └── README.md
├── database/
│   └── schema.sql
├── analytics/
│   └── kpi_queries.sql
└── product-assets/
    └── README.md
```

## Success measures to test, not promise

- Time from case creation to first triage.
- Time from case creation to verified resolution.
- Percentage of cases with required initial checks completed.
- Percentage of closed cases with follow-up verification.
- Repeat-gap rate for the same SKU-location pair within a defined window.
- Percentage of investigated cases with evidence-supported cause classification.
- User completion time and perceived administrative burden.

Targets must be established after discovery and baseline measurement. Do not invent a reduction target before a pilot.

## Getting started

1. Read `docs/product-brief.md`.
2. Read `docs/product-requirements.md`.
3. Review `docs/risks-and-assumptions.md`.
4. Use `prompts/build-mvp-master-prompt.md` with your chosen coding assistant.
5. Build the smallest usable prototype using synthetic data.
6. Run the tests in `docs/testing-plan.md`.
7. Update this README with the actual implemented stack, setup steps, screenshots and known limitations only after the MVP exists.

## Portfolio disclosure

This repository documents a proposed product and its planned validation. Do not describe the MVP as deployed, adopted by a retailer, or commercially successful unless that becomes true and can be evidenced.

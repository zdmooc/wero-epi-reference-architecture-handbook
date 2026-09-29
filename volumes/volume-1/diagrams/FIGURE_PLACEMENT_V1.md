# Figure Placement Manifest — V1

**Date:** 2026-09-29  
**Status:** FIGURE_CHAPTER_INTEGRATION_PASS

## Integration contract

Each figure listed below is:

- rendered as SVG;
- embedded in its canonical chapter;
- assigned a unique Quarto figure ID `#fig-xx-xxx`;
- referenced in prose through `@fig-xx-xxx`;
- accompanied by a caption;
- accompanied by truth level, source note and verification date.

| Figure | Part | Canonical chapter | SVG artifact |
|---|---|---|---|
| FIG-01-001 | 01 foundations | `book/01-foundations/01-layered-reading-of-wero-epi.md` | `diagrams/svg/hero/FIG-01-001-layered-payment-architecture.svg` |
| FIG-02-001 | 02 Wero/EPI | `book/02-wero-epi/02-participant-responsibility-model.md` | `diagrams/svg/secondary/FIG-02-001-wero-commerce-four-corner.svg` |
| FIG-03-001 | 03 journeys | `book/03-journeys/01-end-to-end-wero-journeys.md` | `diagrams/svg/hero/FIG-03-001-c2b-end-to-end.svg` |
| FIG-03-002 | 03 journeys | `book/03-journeys/03-ecommerce-desktop-mobile.md` | `diagrams/svg/secondary/FIG-03-002-ecommerce-sequence.svg` |
| FIG-03-003 | 03 journeys | `book/03-journeys/02-p2p-alias-and-directory.md` | `diagrams/svg/secondary/FIG-03-003-p2p-alias-resolution.svg` |
| FIG-03-004 | 03 journeys | `book/03-journeys/04-pos-qr-instore.md` | `diagrams/svg/secondary/FIG-03-004-pos-qr-instore.svg` |
| FIG-04-001 | 04 functional | `book/04-functional/01-functional-reference-architecture.md` | `diagrams/svg/secondary/FIG-04-001-functional-capability-map.svg` |
| FIG-04-002 | 04 functional | `book/04-functional/03-state-machines-and-invariants.md` | `diagrams/svg/secondary/FIG-04-002-payment-state-machines.svg` |
| FIG-05-001 | 05 ISO 20022 | `book/05-iso20022/01-iso20022-reference.md` | `diagrams/svg/hero/FIG-05-001-iso20022-sctinst-message-map.svg` |
| FIG-05-002 | 05 ISO 20022 | `book/05-iso20022/02-business-application-header-and-identifiers.md` | `diagrams/svg/secondary/FIG-05-002-identifier-correlation-chain.svg` |
| FIG-05-003 | 05 ISO 20022 | `book/05-iso20022/04-rtransactions-and-investigations.md` | `diagrams/svg/secondary/FIG-05-003-recall-return-investigation.svg` |
| FIG-06-001 | 06 SCT Inst | `book/06-sct-inst/02-timing-timeout-and-reason-codes.md` | `diagrams/svg/secondary/FIG-06-001-sctinst-unknown-recovery.svg` |
| FIG-06-002 | 06 SCT Inst | `book/06-sct-inst/02-timing-timeout-and-reason-codes.md` | `diagrams/svg/secondary/FIG-06-002-sctinst-nine-second-window.svg` |
| FIG-07-001 | 07 rails | `book/07-rails/01-rails-clearing-settlement.md` | `diagrams/svg/hero/FIG-07-001-rails-layering.svg` |
| FIG-07-002 | 07 rails | `book/07-rails/02-tips-service-model.md` | `diagrams/svg/secondary/FIG-07-002-tips-account-model.svg` |
| FIG-07-003 | 07 rails | `book/07-rails/03-rt1-service-model.md` | `diagrams/svg/secondary/FIG-07-003-rt1-access-model.svg` |
| FIG-07-004 | 07 rails | `book/07-rails/04-reachability-routing-and-multi-csm.md` | `diagrams/svg/secondary/FIG-07-004-multicsm-routing.svg` |
| FIG-08-001 | 08 liquidity | `book/08-liquidity/01-settlement-liquidity-24x7.md` | `diagrams/svg/secondary/FIG-08-001-liquidity-control-loop.svg` |
| FIG-08-002 | 08 liquidity | `book/08-liquidity/02-target-accounts-and-liquidity-transfers.md` | `diagrams/svg/secondary/FIG-08-002-target-liquidity-accounts.svg` |
| FIG-09-001 | 09 network | `book/09-network/01-network-and-flow-reference.md` | `diagrams/svg/hero/FIG-09-001-end-to-end-network-reference.svg` |
| FIG-09-002 | 09 network | `book/09-network/03-internal-segmentation-east-west.md` | `diagrams/svg/secondary/FIG-09-002-network-trust-zones.svg` |
| FIG-09-003 | 09 network | `book/09-network/04-banking-connectivity-dual-links.md` | `diagrams/svg/secondary/FIG-09-003-dual-banking-connectivity.svg` |
| FIG-10-001 | 10 API/Event/Data | `book/10-api-event-data/03-event-driven-outbox-inbox-kafka-mq.md` | `diagrams/svg/secondary/FIG-10-001-outbox-inbox.svg` |
| FIG-11-001 | 11 infrastructure | `book/11-infrastructure/05-multiaz-multisite-dr-patterns.md` | `diagrams/svg/hero/FIG-11-001-multizone-reference.svg` |
| FIG-12-001 | 12 security | `book/12-security/01-security-identity-fraud-vop.md` | `diagrams/svg/secondary/FIG-12-001-security-trust-chain.svg` |
| FIG-12-002 | 12 security | `book/12-security/02-customer-workload-iam-sca.md` | `diagrams/svg/secondary/FIG-12-002-identity-security-layers.svg` |
| FIG-13-001 | 13 resilience | `book/13-resilience/02-bia-critical-services-rto-rpo.md` | `diagrams/svg/secondary/FIG-13-001-resilience-dependency-map.svg` |
| FIG-13-002 | 13 resilience | `book/13-resilience/02-bia-critical-services-rto-rpo.md` | `diagrams/svg/secondary/FIG-13-002-resilience-failure-domains.svg` |
| FIG-13-003 | 13 resilience | `book/13-resilience/03-active-passive-active-active-fencing.md` | `diagrams/svg/secondary/FIG-13-003-fencing-failover.svg` |
| FIG-13-004 | 13 resilience | `book/13-resilience/05-chaos-dora-testing-tlpt.md` | `diagrams/svg/secondary/FIG-13-004-resilience-testing-pyramid.svg` |
| FIG-14-001 | 14 operations | `book/14-operations/02-bank-reference-architecture.md` | `diagrams/svg/hero/FIG-14-001-bank-reference-architecture.svg` |
| FIG-14-002 | 14 operations | `book/14-operations/03-psp-merchant-reference-architecture.md` | `diagrams/svg/secondary/FIG-14-002-merchant-psp-reference.svg` |
| FIG-14-003 | 14 operations | `book/14-operations/04-sli-slo-business-observability.md` | `diagrams/svg/secondary/FIG-14-003-observability-correlation.svg` |
| FIG-14-004 | 14 operations | `book/14-operations/06-runbooks-incidents-postmortems.md` | `diagrams/svg/secondary/FIG-14-004-incident-lifecycle.svg` |
| FIG-15-001 | 15 future | `book/15-future-annexes/04-european-payments-2030-reference.md` | `diagrams/svg/hero/FIG-15-001-european-payments-2030.svg` |
| FIG-16-001 | 16 evidence | `book/16-testing/03-claim-evidence-matrix.md` | `diagrams/svg/secondary/FIG-16-001-claim-evidence-ladder.svg` |

## Verified counts

- figures: **36**
- target chapters: **34**
- hero figures: **8**
- secondary figures: **28**
- missing SVG paths: **0**
- missing chapter paths: **0**
- duplicate figure IDs: **0**

Two chapters intentionally contain two complementary figures:

- `book/06-sct-inst/02-timing-timeout-and-reason-codes.md` → FIG-06-001 + FIG-06-002;
- `book/13-resilience/02-bia-critical-services-rto-rpo.md` → FIG-13-001 + FIG-13-002.

## Remaining publication proof

Figure-to-chapter integration is complete.

Still required before PDF/EPUB:

- actual Quarto page-layout render;
- page-break/orphan checks;
- portrait/landscape sizing;
- caption/source-note typography;
- greyscale and print-size legibility;
- cross-reference render verification.

No PDF or EPUB is produced by this gate.

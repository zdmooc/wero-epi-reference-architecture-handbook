# Handbook Coverage Matrix

## Core coverage

| Domain | Canonical manuscript file | Truth model | Coverage |
|---|---|---|---|
| Foundations / layered model | book/01-foundations/01-layered-reading-of-wero-epi.md | REFERENCE_ARCHITECTURE | covered |
| Payment anatomy | book/01-foundations/02-end-to-end-payment-anatomy.md | REFERENCE_ARCHITECTURE | covered |
| Actors / trust boundaries | book/01-foundations/03-actors-and-trust-boundaries.md | REFERENCE_ARCHITECTURE | covered |
| Wero/EPI | book/02-wero-epi/01-ecosystem-public-baseline.md | MIXED | covered |
| Payment journeys | book/03-journeys/01-end-to-end-wero-journeys.md | MIXED | covered |
| Functional architecture | book/04-functional/01-functional-reference-architecture.md | REFERENCE_ARCHITECTURE | covered |
| ISO 20022 | book/05-iso20022/01-iso20022-reference.md | MIXED | covered |
| SCT Inst | book/06-sct-inst/01-sct-inst-lifecycle-exceptions.md | MIXED | covered |
| Rails / TIPS / RT1 / CSM | book/07-rails/01-rails-clearing-settlement.md | MIXED | covered |
| Settlement / liquidity | book/08-liquidity/01-settlement-liquidity-24x7.md | MIXED | covered |
| Network / flows | book/09-network/01-network-and-flow-reference.md | REFERENCE_ARCHITECTURE | covered |
| API / EDA / Data | book/10-api-event-data/01-api-event-data-architecture.md | REFERENCE_ARCHITECTURE | covered |
| Infrastructure / Cloud / OpenShift | book/11-infrastructure/01-infrastructure-cloud-platform.md | REFERENCE_ARCHITECTURE | covered |
| Security / Identity / Fraud / VoP | book/12-security/01-security-identity-fraud-vop.md | MIXED | covered |
| Resilience / DORA | book/13-resilience/01-operational-resilience-dora.md | MIXED | covered |
| SRE / observability | book/14-operations/01-sre-observability-operations.md | REFERENCE_ARCHITECTURE | covered |
| Bank reference architecture | book/14-operations/02-bank-reference-architecture.md | REFERENCE_ARCHITECTURE | covered |
| PSP / merchant architecture | book/14-operations/03-psp-merchant-reference-architecture.md | REFERENCE_ARCHITECTURE | covered |
| Digital Euro / future | book/15-future-annexes/01-interoperability-digital-euro-future.md | MIXED | covered |
| Testing / evidence | book/16-testing/01-testing-and-evidence-strategy.md | REFERENCE_ARCHITECTURE | covered |
| European regulation | book/17-regulation/01-european-regulatory-map.md | PUBLIC_VERIFIED | covered |

## Architecture views

| View | Covered |
|---|---|
| Business | yes |
| Functional | yes |
| Application | yes |
| Data | yes |
| API | yes |
| Event | yes |
| Network | yes |
| Physical/cloud | yes |
| Payment rails | yes |
| Clearing/settlement | yes |
| Liquidity | yes |
| Security | yes |
| Resilience | yes |
| Observability | yes |
| Regulation | yes |
| Testing/evidence | yes |
| Failure scenarios | yes |

## Annexes

Canonical annexes:
- `annexes/ISO20022_MESSAGE_CATALOG.md`
- `annexes/FAILURE_SCENARIOS.md`
- `annexes/RTO_RPO_MATRIX.md`
- `annexes/RACI_REFERENCE.md`
- `annexes/CHECKLISTS.md`
- `annexes/ACRONYMS.md`
- `annexes/SUBJECT_INDEX.md`
- `annexes/ARCHITECTURE_CROSS_REFERENCE.md`
- `GLOSSARY.md`
- `sources/VERIFIED_BASELINE_2026-09-28.md`

## Canonical publication order

The publication source of truth is `publishing/book-order.txt`.

All entries in that file were checked on 2026-09-29 and resolve to existing files.

## Master TOC interpretation

`MASTER_TOC.md` is a topic-level reference index. The first edition groups related topics into larger chapters instead of creating hundreds of artificially short chapter files.

## Verified manuscript structure

As of 2026-09-29:
- 87 canonical chapter files;
- 97 canonical files including annexes and verified baseline;
- 36 Mermaid source diagrams;
- 0 missing paths in `publishing/book-order.txt`.

## Publication is intentionally deferred

Content coverage I1→I16 is complete at GitHub manuscript level.

The following are deliberately **not started yet**:
- SVG rendering + final visual/layout pass;
- PDF render;
- EPUB render;
- print proof;
- ISBN/distribution decision.

Those steps start only after manuscript freeze.

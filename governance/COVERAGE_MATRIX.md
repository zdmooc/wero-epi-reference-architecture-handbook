# V1.0 Coverage Matrix

Date: 2026-09-29

The master TOC deliberately enumerates hundreds of subtopics. V1.0 now implements them through 87 canonical chapter files, grouping closely related topics while keeping detailed subchapters for the high-value architecture domains.

| Master TOC domain | V1 source |
|---|---|
| Front matter / reading model / truth labels | `book/00-front-matter`, `book/01-foundations`, governance |
| Wero / EPI ecosystem | `book/02-wero-epi/01-ecosystem-public-baseline.md` |
| P2P / C2B / e-commerce / POS / recurring / refund / recall / dispute/state | `book/03-journeys/01-end-to-end-wero-journeys.md` |
| Functional architecture / domains / orchestration / directory / merchant | `book/04-functional/01-functional-reference-architecture.md` |
| ISO 20022 / pacs / camt / identifiers / mapping / versions | `book/05-iso20022/01-iso20022-reference.md`, ISO annex |
| SCT Inst / timeout / UNKNOWN / investigation / duplicate / recall / return | `book/06-sct-inst/01-sct-inst-lifecycle-exceptions.md` |
| T2 / TIPS / RT1 / CSM / reachability / finality | `book/07-rails/01-rails-clearing-settlement.md` |
| Settlement / liquidity / DCA / prefunding / stress | `book/08-liquidity/01-settlement-liquidity-24x7.md` |
| Network / zones / DNS / DDoS / WAF / LB / firewall / mTLS / HSM / flows | `book/09-network/01-network-and-flow-reference.md` |
| API / webhook / idempotency / Kafka / MQ / outbox / inbox / data / ledger | `book/10-api-event-data/01-api-event-data-architecture.md` |
| DC / cloud / multi-AZ / multi-region / K8s / OpenShift / HA / GitOps / backup | `book/11-infrastructure/01-infrastructure-cloud-platform.md` |
| IAM / SCA / OAuth / PKI / HSM / fraud / AML / sanctions / VoP / GDPR | `book/12-security/01-security-identity-fraud-vop.md` |
| HA / PRA / BIA / RTO / RPO / split brain / chaos / DORA / third parties | `book/13-resilience/01-operational-resilience-dora.md` |
| SRE / OTel / logs / metrics / traces / capacity / runbooks / bank architecture | `book/14-operations/01-sre-observability-operations.md`, `02-bank-reference-architecture.md` |
| PSP / acquirer / merchant / checkout / webhook / reconciliation | `book/14-operations/03-psp-merchant-reference-architecture.md` |
| Interoperability / cross-border / Digital Euro / identity / future | `book/15-future-annexes/01-interoperability-digital-euro-future.md` |
| Test strategy / contracts / E2E / performance / chaos / DR / security evidence | `book/16-testing/01-testing-and-evidence-strategy.md` |
| IPR / EPC / PSD2/PSD3/PSR / DORA / GDPR / eIDAS2 / NIS2 | `book/17-regulation/01-european-regulatory-map.md` |
| Failure catalogue | `annexes/FAILURE_SCENARIOS.md` |
| Architecture/network/security/DORA/PRA checklists | `annexes/CHECKLISTS.md` |
| RTO/RPO matrix | `annexes/RTO_RPO_MATRIX.md` |
| ISO catalog | `annexes/ISO20022_MESSAGE_CATALOG.md` |
| RACI | `annexes/RACI_REFERENCE.md` |
| Glossary | `GLOSSARY.md` |
| Acronyms | `annexes/ACRONYMS.md` |
| Subject index | `annexes/SUBJECT_INDEX.md` |
| Architecture cross-reference | `annexes/ARCHITECTURE_CROSS_REFERENCE.md` |
| Official bibliography / dated baseline | `sources/OFFICIAL_SOURCES.yml`, `sources/VERIFIED_BASELINE_2026-09-28.md` |

## Coverage policy

A topic is considered V1-covered when:
1. the underlying concept is explained at architecture-reference depth;
2. its volatile public facts are source-registered;
3. its failure/safety implications are documented where material;
4. detailed vendor-specific implementation is intentionally delegated to a specialist repository when it would duplicate the portfolio.

## Intentionally delegated depth

V1 links rather than copies:
- complete Payment Hub vendor/RFP material;
- every XML example and XSD;
- full DORA article-by-article course;
- full OpenShift/Kafka/MQ implementation labs;
- companion runtime evidence.

This is deliberate: the handbook is the editorial reference layer, not a monorepo dump.


## Verified structure — 2026-09-29

- chapter files: 87
- canonical files including annexes/baseline/indexes: 97
- Mermaid diagram sources: 36
- missing canonical paths: 0
- canonical order: `publishing/book-order.txt`

This matrix validates **content coverage**, not PDF/EPUB layout.

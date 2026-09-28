# Handbook Coverage Matrix

## Core coverage

| Domain | Main manuscript file | Truth model | Coverage |
|---|---|---|---|
| Wero/EPI | book/02-wero-epi/01-public-ecosystem-and-roadmap.md | PUBLIC_VERIFIED | covered |
| Payment journeys | book/03-payment-journeys/01-end-to-end-journeys.md | MIXED | covered |
| Functional architecture | book/04-functional-architecture/01-capabilities-domains-and-states.md | REFERENCE_ARCHITECTURE | covered |
| ISO 20022 | book/05-iso20022/01-iso20022-end-to-end.md | MIXED | covered |
| SCT Inst | book/06-sct-inst/01-sct-inst-lifecycle-and-exceptions.md | PUBLIC_VERIFIED | covered |
| Rails / TIPS / RT1 | book/07-rails/01-tips-rt1-csm-and-reachability.md | PUBLIC_VERIFIED | covered |
| Settlement / liquidity | book/08-settlement-liquidity/01-settlement-liquidity-24x7.md | MIXED | covered |
| Network / flows | book/09-network-flows/01-network-and-flow-architecture.md | REFERENCE_ARCHITECTURE | covered |
| API / EDA / Data | book/10-api-event-data/01-api-event-data-architecture.md | REFERENCE_ARCHITECTURE | covered |
| Cloud / Kubernetes / OpenShift | book/11-platform/01-cloud-kubernetes-openshift-reference.md | REFERENCE_ARCHITECTURE | covered |
| Security / Identity / Fraud / VoP | book/12-security/01-security-identity-fraud-vop.md | MIXED | covered |
| Resilience / DORA | book/13-resilience-dora/01-resilience-dora-and-testing.md | MIXED | covered |
| SRE / operations | book/14-operations-sre/01-payment-sre-operating-model.md | REFERENCE_ARCHITECTURE | covered |
| Digital Euro / future | book/15-future-annexes/01-interoperability-digital-euro-and-2030.md | PUBLIC_VERIFIED_AND_WATCH | covered |

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
| Failure scenarios | yes |

## Annexes

- glossary;
- professional checklists;
- 55 failure scenarios;
- official-source registry;
- internal-repository map;
- publishing strategy;
- editorial governance;
- five-year roadmap.

## Master TOC interpretation

The master TOC remains a detailed **topic-level index**. The first edition groups many related topic entries into larger coherent chapters instead of artificially creating 263 short files.

Future editions may split high-density chapters when:
- reader navigation improves;
- a subject expands materially;
- a regulation/scheme deserves an independent chapter;
- print layout benefits.

## Known publishing—not architecture—gates

- figure rendering and numbering;
- final page design;
- final cross-reference automation;
- index generation;
- PDF/EPUB build validation;
- print proof;
- copy-edit pass.

These gates are handled by the publishing pipeline rather than by adding new architecture scope.

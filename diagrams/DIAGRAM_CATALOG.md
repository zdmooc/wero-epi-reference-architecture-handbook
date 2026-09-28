# Diagram Catalogue — v1.0 RC1

**Baseline:** 2026-09-28  
**Rule:** every figure is a maintainable source diagram and must state a truth level.

| Figure source | View |
|---|---|
| FIG-01-001-layered-payment-architecture.mmd | architecture layers |
| FIG-02-001-wero-commerce-four-corner.mmd | ecosystem / four-corner |
| FIG-03-001-c2b-end-to-end.mmd | C2B sequence |
| FIG-03-001-ecommerce-sequence.mmd | ecommerce sequence |
| FIG-03-002-payment-state-machines.mmd | state machines |
| FIG-04-001-functional-capability-map.mmd | functional capability |
| FIG-05-001-iso20022-sctinst-message-map.mmd | ISO 20022 message map |
| FIG-06-001-sctinst-unknown-recovery.mmd | UNKNOWN recovery |
| FIG-07-001-rails-layering.mmd | scheme / rail layering |
| FIG-07-001-rails-settlement-layers.mmd | settlement layers |
| FIG-08-001-liquidity-control-loop.mmd | liquidity |
| FIG-09-001-network-reference.mmd | network |
| FIG-09-001-reference-network.mmd | network / trust zones |
| FIG-10-001-outbox-inbox.mmd | event-driven |
| FIG-11-001-multizone-reference.mmd | infrastructure / multi-zone |
| FIG-12-001-security-trust-chain.mmd | security |
| FIG-13-001-resilience-dependency-map.mmd | resilience dependencies |
| FIG-13-001-resilience-failure-domains.mmd | failure domains |
| FIG-14-001-bank-reference-architecture.mmd | bank architecture |
| FIG-14-002-merchant-psp-reference.mmd | merchant / PSP |
| FIG-14-003-observability-correlation.mmd | observability |
| FIG-15-001-european-payments-2030.mmd | future architecture |

## Publication

`publishing/build-book.sh` renders all `diagrams/mermaid/*.mmd` to SVG and appends a figure catalogue to the generated manuscript.

## Quality gate

Before final print:
- confirm SVG renders;
- check text size at print scale;
- avoid colour-only semantics;
- keep legends consistent;
- split overly dense diagrams;
- retain truth/status metadata in source.

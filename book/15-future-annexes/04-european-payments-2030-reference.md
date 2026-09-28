---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE_AND_WATCH
primary_sources:
  - ecb-payments-strategy-2026
  - ecb-digital-euro-pilot-page-2026
  - epi-wero-commerce-2026-09
related_internal_repos: []
---

# Architecture européenne des paiements 2030 — vue de référence

## 1. Objective

Build an architecture able to absorb new methods without rebuilding bank core for each wallet.

## 2. Layered direction

~~~text
Experience
→ Identity / Consent
→ Payment Method Orchestration
→ Risk / VoP
→ Payment Hub
→ Scheme / Rail adapters
→ Settlement / Liquidity
→ Reconciliation
~~~

## 3. Payment methods

Potential portfolio:
- Wero ;
- SCT Inst ;
- OCT Inst ;
- cards ;
- digital euro if issued ;
- other local/international methods.

## 4. Common capabilities

Share where safe:
- customer IAM ;
- merchant onboarding ;
- fraud platform ;
- API management ;
- observability ;
- reconciliation framework ;
- secrets/PKI.

## 5. Keep separate

Do not over-share:
- financial state machine if semantics differ ;
- settlement adapter ;
- dispute model ;
- asset/ledger ;
- legal retention.

## 6. Merchant abstraction

A merchant can receive:
- payment intent API ;
- method selection ;
- status ;
- refund ;
- reporting.

Backend chooses method-specific execution.

## 7. European identity

eIDAS2/EUDI developments may affect:
- onboarding ;
- authentication ;
- attribute sharing.

Do not assume exact Wero integration without public evidence.

## 8. Real-time everywhere

Trends:
- instant settlement ;
- 24/7 operations ;
- real-time fraud ;
- real-time treasury ;
- real-time reconciliation.

Architecture must remove end-of-day assumptions.

## 9. Data

Use event-driven reporting while keeping authoritative ledger.

Future AI use:
- fraud ;
- capacity ;
- liquidity forecasting ;
- operations assistance.

Never let AI invent settlement state.

## 10. AI agents

ECB innovation work in 2026 explores AI/payment scenarios.

Architecture guardrail:
- agent can propose/initiate within authorization ;
- deterministic policy validates ;
- human/customer consent where required ;
- payment engine remains authoritative.

## 11. Programmability

Possible future services:
- subscriptions ;
- conditional merchant flows ;
- micropayments ;
- smart routing.

Keep financial core controlled.

## 12. Resilience

2030 architecture should isolate:
- channel ;
- method ;
- rail ;
- region ;
- provider.

One rail outage should not corrupt others.

## 13. Sovereignty

European payments strategy increasingly values:
- European reach ;
- resilience ;
- reduced concentration ;
- open standards.

Architecture should measure dependencies rather than use sovereignty as marketing label.

## 14. Migration strategy

Evolve by adapters/capabilities:
- add method ;
- certify ;
- migrate traffic ;
- retire legacy.

Avoid big-bang core replacement.

## 15. Five-year principle

Stable core concepts:
- truth ;
- idempotency ;
- finality ;
- reconciliation ;
- trust ;
- failure domains.

Volatile:
- products ;
- participants ;
- rules ;
- versions ;
- regulation.

The book versions the volatile layer and keeps the stable principles reusable.

---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - epc-oct-inst-2025-v1.1
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Cross-border, OCT Inst et interopérabilité

## 1. SCT Inst is not universal cross-border

SCT Inst covers its scheme scope.

For one-leg-out instant credit transfers, EPC maintains OCT Inst.

## 2. Baseline OCT Inst

At the 2026 baseline:
- 2025 OCT Inst rulebook v1.1 is current ;
- effective since 5 October 2025 ;
- based on its own rulebook and implementation guidelines.

Do not apply SCT Inst rules blindly to OCT Inst.

## 3. One-leg-out concept

One leg of the payment is within the scheme scope while another reaches beyond it according to the OCT Inst model.

Architecture adds:
- external correspondent/PSP ;
- FX/currency concerns where applicable ;
- additional compliance ;
- different reachability.

## 4. Cross-border identifiers

Need preserve:
- original customer reference ;
- EndToEndId ;
- transaction IDs ;
- external/correspondent references.

The more hops, the more important correlation becomes.

## 5. FX

If currency conversion exists:
- quote ;
- rate ;
- timestamp ;
- spread/fee ;
- expiry ;
- settlement currency ;
- customer disclosure.

No hidden implicit conversion in Payment object.

## 6. Compliance

Cross-border may add:
- sanctions ;
- AML ;
- jurisdiction ;
- data transfer ;
- additional participant requirements.

## 7. Routing

Reference:
~~~text
Payment Orchestrator
→ Scheme Selector
   ├─ SCT Inst
   ├─ OCT Inst
   └─ other cross-border rail
~~~

Selection depends on:
- currencies ;
- payer/payee geography ;
- reachability ;
- scheme eligibility ;
- cost ;
- timing.

## 8. Interoperability

Useful layers:
- common merchant API ;
- payment-method abstraction ;
- shared identity ;
- common observability ;
- canonical references.

Do not erase scheme differences.

## 9. Error mapping

External rails may use different reason models.

Normalize for:
- customer ;
- operations.

Retain raw reason.

## 10. Settlement certainty

Each route needs its own answer:
- what constitutes finality ?
- where is settlement asset ?
- who provides status ?
- what is reconciliation source ?

## 11. SLA

Cross-border path may have different:
- latency ;
- operating availability ;
- investigation timelines.

Do not reuse SCT Inst SLO automatically.

## 12. Merchant UX

Merchant may only need:
- accepted ;
- pending ;
- paid ;
- failed/rejected ;
- refunded.

Backend handles route complexity.

## 13. Operations

Separate dashboards:
- scheme ;
- currency ;
- corridor ;
- participant ;
- route.

## 14. Future interoperability

Potential European architecture can expose one merchant/payment API while selecting different underlying rails.

The abstraction is useful only if it preserves:
- legal meaning ;
- financial finality ;
- traceability.

## 15. Principle

Interoperability is not homogenisation. It is the ability to connect different schemes while preserving their semantics.

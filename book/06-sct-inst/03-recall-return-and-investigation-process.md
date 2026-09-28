---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - epc-sct-inst-2025-v1.1
  - epc-sct-inst-igs-2025-v1.0
  - epc-sct-inst-reason-codes-2025-v7
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Recall, return et investigation SCT Inst

## 1. Ne pas appeler tout échec une R-transaction identique

Les parcours d'exception ont des objectifs différents :
- reject ;
- return ;
- recall ;
- request for recall ;
- status investigation.

## 2. Reject

Le paiement n'aboutit pas dans le flow normal.

Questions :
- à quel stade ?
- par qui ?
- avec quel reason ?
- effet financier existant ?
- nouvelle tentative autorisée ?

## 3. Return

Le paiement initial existe, puis des fonds sont retournés.

Data :
- original payment refs ;
- return id ;
- reason ;
- amount ;
- settlement status.

## 4. Recall request

A party asks for a recall/cancellation process.

The request may be:
- accepted ;
- rejected ;
- unresolved for a time.

Do not update original payment to cancelled at request creation.

## 5. Investigation case

Create a durable case when:
- result ambiguous ;
- recall pending ;
- external response missing ;
- reconciliation break ;
- customer complaint requiring scheme investigation.

## 6. SLA clock

Case records:
- openedAt ;
- scheme deadline if any ;
- next action deadline ;
- escalation level.

Operations dashboard must surface overdue cases.

## 7. Original references

Mandatory mapping:
- original MsgId ;
- EndToEndId ;
- TxId ;
- paymentId ;
- settlement reference if available.

Without these, automation and investigation degrade.

## 8. Manual intervention

Operator actions:
- query ;
- attach evidence ;
- send scheme message ;
- approve correction ;
- close case.

Controls:
- RBAC ;
- four-eyes for financial adjustment ;
- audit.

## 9. Financial correction

If external truth says SETTLED but local is missing:
- do not resend ;
- repair/reconcile local state ;
- create accounting adjustment only if required by ledger design.

## 10. Recall customer UX

Customer-facing states can be:
- recall requested ;
- waiting counterparty ;
- returned ;
- refused.

Avoid promising success on request submission.

## 11. Fraud recall

Fraud cases may require urgent processes, but technical shortcuts must not create inconsistent financial records.

Separate:
- fraud case ;
- scheme recall case ;
- payment state.

## 12. Operations ownership

Possible teams:
- payment operations ;
- fraud ;
- customer service ;
- treasury ;
- scheme operations.

Case routing based on reason/category.

## 13. Reconciliation closure

Close only when:
- local state aligned ;
- ledger aligned ;
- external outcome known ;
- merchant/customer communication aligned ;
- case evidence complete.

## 14. Metrics

- cases opened ;
- by type ;
- age ;
- auto-resolved ;
- manual ;
- recall acceptance/rejection ;
- unknown resolution time ;
- financial adjustments.

## 15. Test scenarios

- positive return ;
- recall accepted ;
- recall refused ;
- no recall response ;
- original refs missing ;
- duplicate recall ;
- return message duplicate ;
- case reopened attempt ;
- operator unauthorized.

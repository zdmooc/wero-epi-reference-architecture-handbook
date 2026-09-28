---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Reconciliation Operations

## 1. Reconciliation is an operational service

It needs:
- owner ;
- queues ;
- SLIs ;
- runbooks ;
- audit.

Not a nightly script nobody owns.

## 2. Queues

- UNKNOWN ;
- local/external mismatch ;
- settlement mismatch ;
- merchant mismatch ;
- refund mismatch ;
- orphan message.

## 3. Prioritization

By:
- age ;
- value ;
- customer impact ;
- fraud ;
- accounting deadline ;
- regulatory significance.

## 4. Auto-match

Exact rules:
- unique reference ;
- amount/currency ;
- participant ;
- date/time.

Avoid fuzzy automatic correction of money.

## 5. Auto-resolution

Safe examples:
- duplicate callback ;
- delayed event after already settled ;
- known read-model lag.

Financial adjustment usually requires stronger control.

## 6. Manual case

Operator sees:
- payment timeline ;
- ISO references ;
- ledger ;
- external status ;
- merchant order ;
- events ;
- recommended action.

## 7. Four-eyes

Use for:
- financial correction ;
- large-value adjustment ;
- forced state transition.

## 8. Daily control

Review:
- open count ;
- oldest ;
- total value ;
- route ;
- reason ;
- unresolved UNKNOWN.

## 9. End-of-day

Confirm:
- payment totals ;
- settlement/account totals ;
- refunds/returns ;
- outstanding breaks.

## 10. Incident surge

After outage:
- freeze low-priority manual work ;
- bulk inquiry ;
- auto-resolve exact matches ;
- scale case workers ;
- protect DB/rail from inquiry storm.

## 11. Evidence

Every closure:
- source ;
- action ;
- before/after ;
- operator ;
- timestamp ;
- approvals.

## 12. SLA/SLO

Different targets:
- UNKNOWN ;
- merchant callback ;
- accounting break ;
- recall case.

## 13. Reporting

Trend:
- root cause ;
- system ;
- participant ;
- release ;
- route.

Reconciliation data should drive architecture improvements.

## 14. Access control

Operators need only data/actions required.

Mask sensitive data where possible.

## 15. Goal

Every financial ambiguity must converge to a provable state without creating a second payment.

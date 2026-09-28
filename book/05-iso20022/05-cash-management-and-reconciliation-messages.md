---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_WITH_ISO_CONTEXT
primary_sources: []
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Cash management messages et réconciliation

## 1. Pourquoi camt.052/.053/.054 comptent

Le paiement instantané est traité en secondes, mais la comptabilité et la réconciliation vivent sur des horizons différents.

Les messages de cash management peuvent fournir des informations utiles pour :
- intraday monitoring ;
- statements ;
- debit/credit notifications ;
- reconciliation.

## 2. camt.052

Concept :
BankToCustomerAccountReport.

Usage typique :
- reporting intraday ;
- balance/entry visibility ;
- treasury monitoring.

Il ne remplace pas le pacs.002 du flow inter-PSP.

## 3. camt.053

Concept :
BankToCustomerStatement.

Usage :
- statement ;
- end-of-day/accounting ;
- reconciliation ;
- audit.

## 4. camt.054

Concept :
BankToCustomerDebitCreditNotification.

Usage :
- notification de mouvements de compte selon le service concerné.

Important :
un marchand intégré via PSP reçoit souvent des API/webhooks, pas directement camt.054.

## 5. Reconciliation sources

~~~text
Payment database
Ledger
ISO payment messages
CSM/settlement records
camt/account reporting
Merchant orders
Callbacks/events
~~~

No single source contains every dimension.

## 6. Matching keys

Priority:
- exact unique external reference ;
- EndToEndId/TxId ;
- amount/currency ;
- value date/time ;
- participant ;
- original references.

Avoid fuzzy matching as first line.

## 7. Reconciliation levels

### L1 — Technical
Was message delivered?

### L2 — Payment
Do local/external payment states agree?

### L3 — Financial
Do ledger and settlement/account entries agree?

### L4 — Commercial
Does merchant order/refund state agree?

## 8. Intraday vs end-of-day

Instant payments need intraday reconciliation because waiting for end-of-day can leave UNKNOWNs too long.

End-of-day still validates:
- completeness ;
- accounting ;
- statements ;
- unresolved breaks.

## 9. Break classes

- missing external ;
- missing local ;
- amount mismatch ;
- duplicate ;
- status mismatch ;
- settlement mismatch ;
- orphan refund ;
- wrong value date ;
- late notification.

## 10. Auto-reconciliation

Rules can close:
- exact match ;
- known delayed callback ;
- duplicate event without duplicate financial effect.

Manual review:
- conflicting settlement evidence ;
- amount difference ;
- multiple candidate transactions ;
- fraud/legal hold.

## 11. Idempotent correction

Correction must be idempotent.

Example:
- reconciliation case triggers state update once ;
- repeated file/message does not create second adjustment.

## 12. Data retention

Store enough evidence for:
- operations ;
- customer support ;
- accounting ;
- audit ;
- legal requirements.

Retention duration is policy/legal-specific.

## 13. Observability

KPIs:
- total breaks ;
- break age ;
- auto-match rate ;
- manual queue ;
- unknown duration ;
- settlement mismatch ;
- retry count.

## 14. Incident recovery

After site failure:
1. restore platform ;
2. establish external connectivity ;
3. obtain authoritative reports/status ;
4. reconcile in-flight payments ;
5. release notifications/fulfilment ;
6. close incident.

Starting new payments before reconciling may be permitted or blocked according to risk policy, but the decision must be explicit.

## 15. Architecture lesson

The reconciliation engine is not a reporting afterthought. It is a safety mechanism that allows a distributed payment system to converge after partial failures.

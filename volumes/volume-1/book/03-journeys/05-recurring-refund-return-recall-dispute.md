---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources:
  - wero-faq-overview
  - epc-sct-inst-2025-v1.1
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Récurrence, refund, return, recall et dispute

## 1. Cinq objets différents

Le livre distingue recurring/subscription consent, merchant refund, scheme return, recall/cancellation request et dispute/investigation.

## 2. Recurring consent

~~~text
Mandate
- mandateId
- consumer
- merchant
- amount rules
- frequency
- validFrom
- validUntil
- status
- version
~~~

States :
- CREATED ;
- ACTIVE ;
- SUSPENDED ;
- REVOKED ;
- EXPIRED.

## 3. Charge occurrence

~~~text
Subscription
  ├─ Charge #1 → Payment #1
  ├─ Charge #2 → Payment #2
  └─ Charge #3 → Payment #3
~~~

Une autorisation de récurrence ne doit pas produire un paiement sans trace individuelle.

## 4. Idempotency de charge

Stable key :
- mandateId ;
- billing period ;
- merchant invoice/order.

Si un scheduler rejoue la même échéance, le système retrouve le même paiement logique.

## 5. Retry de charge

Un retry business après rejet est différent d'un retry technique après UNKNOWN.

### Reject certain
Nouvelle tentative éventuellement permise selon produit.

### UNKNOWN
Pas de nouvelle opération avant résolution.

## 6. Refund marchand

~~~text
REFUND_CREATED
→ AUTHORIZED
→ SUBMITTED
→ SETTLED
~~~

Exceptions :
- REJECTED ;
- UNKNOWN ;
- CANCELLED_BEFORE_SUBMIT.

Le refund référence l'opération originale.

## 7. Partial refund

Controls :
- total refunded <= original settled amount ;
- currency match ;
- duplicate key ;
- order/refund references ;
- concurrent partial refunds serialized.

## 8. Return scheme

Un return est une nouvelle opération du scheme qui référence l'original :
- own message ;
- own identifiers ;
- original references ;
- reason ;
- own settlement effect.

## 9. Recall

Un recall/cancellation request demande l'annulation ou le retour selon le scheme.

Important :
- request ≠ guaranteed cancel ;
- payment may already be final ;
- response may be negative ;
- investigation state must be stored.

## 10. Investigation

~~~text
CASE_OPEN
→ EVIDENCE_COLLECTED
→ EXTERNAL_REQUEST_SENT
→ WAITING_RESPONSE
→ RESOLVED
→ CLOSED
~~~

Lien :
- payment ;
- original message ;
- reason ;
- participant ;
- operator actions ;
- SLA.

## 11. Dispute

Une dispute commerciale peut exister même si le paiement est techniquement correctement réglé.

Séparer :
- payment correctness ;
- merchant/customer disagreement ;
- fraud claim ;
- scheme process ;
- customer support case.

## 12. Accounting

Ne pas modifier la ligne originale pour l'effacer.

Utiliser des écritures :
- original payment debit ;
- refund credit ;
- fees ;
- corrections.

## 13. Customer history

~~~text
Purchase 42.50
Refund 10.00
Remaining 32.50
~~~

Les opérations restent distinctes dans le ledger.

## 14. Reconciliation

Rapprocher :
- original payment ;
- return/refund ;
- bank ledger ;
- merchant order ;
- external statements ;
- case outcome.

## 15. Operational queues

Queues séparées :
- unknown payments ;
- failed refunds ;
- recall pending ;
- return exceptions ;
- disputes ;
- reconciliation breaks.

Cela clarifie ownership et SLO.

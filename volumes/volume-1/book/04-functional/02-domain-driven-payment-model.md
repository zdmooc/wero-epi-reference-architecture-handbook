---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/mayabank-instant-payments-resilience-platform
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Domain-Driven Design appliqué au paiement

## Pourquoi le découpage métier compte

Un microservice par table ou endpoint n'est pas une architecture métier. Le paiement exige des frontières où les invariants restent cohérents.

## Bounded contexts de référence

### Customer
Customer identity reference, eligibility, preferences, device relation.

### Directory
Alias, ownership, resolution, freshness.

### Merchant
Merchant, store, terminal, order, acceptance profile.

### Consent
Payment approval, recurring mandate, revocation, evidence.

### Payment
Payment intent, idempotence, lifecycle, status, references.

### Risk
Fraud, limits, VoP interaction, decision record.

### Financial Execution
Account, funds, posting, rail submission.

### Rail
Scheme mapping, ISO 20022, participant routing, external status.

### Reconciliation
Local vs external truth, breaks, recovery, investigation.

### Notification
Customer notification, merchant webhook, delivery state.

## Aggregate Payment

~~~text
Payment
- paymentId
- businessKey
- payer
- payee
- amount
- currency
- state
- version
- externalReferences
- timestamps
~~~

Invariants :

- one businessKey → one logical payment ;
- amount immutable after authorization ;
- terminal financial states controlled ;
- every transition auditable.

## Aggregate PaymentRequest

Merchant-owned request :

- paymentRequestId ;
- merchantOrderId ;
- expected amount ;
- expiry ;
- status ;
- linked payment.

Un PaymentRequest expiré ne signifie pas qu'une opération financière déjà soumise a échoué.

## Aggregate Refund

- refundId ;
- originalPaymentId ;
- amount ;
- reason ;
- state ;
- idempotency key.

## Value objects

Money :

- amount ;
- currency ;
- exact decimal handling.

PaymentIdentity :

- internal ID ;
- EndToEndId ;
- TxId mapping.

Beneficiary :

- account/party references ;
- verification context.

Reason :

- scheme code ;
- internal category ;
- customer-safe text.

## Domain events

Events expriment des faits :

- PaymentIntentCreated ;
- PaymentAuthorized ;
- PaymentSubmitted ;
- PaymentSettled ;
- PaymentRejected ;
- PaymentBecameUnknown ;
- PaymentReconciled ;
- RefundSettled.

Ne pas publier une commande comme si elle était déjà un fait.

## Commands

- CreatePayment ;
- AuthorizePayment ;
- SubmitPayment ;
- ReconcilePayment ;
- CreateRefund.

Une commande peut échouer.

## Anti-corruption layer

~~~text
Payment Domain
→ Anti-Corruption Layer
→ Legacy Payment Hub / Core
~~~

Le domain model ne doit pas hériter de tous les codes historiques.

## Canonical model caution

Un canonical model est utile aux frontières d'intégration, mais peut devenir surdimensionné.

Conserver :

- identifiers ;
- money ;
- parties essentielles ;
- state ;
- references.

Éviter le super-objet global.

## Transaction boundary

Garder atomiques localement :

- Payment + idempotency claim ;
- Payment + Outbox ;
- refund amount reservation + refund entity.

Ne pas chercher une transaction ACID distribuée avec un CSM externe.

## Eventual consistency

Acceptable pour :

- analytics ;
- notification ;
- reporting ;
- non-authoritative views.

Pas une excuse pour :

- double effet financier ;
- ledger incohérent ;
- double writer.

## Domain ownership

Chaque bounded context a :

- owner team ;
- API/event contract ;
- data owner ;
- SLO ;
- runbook ;
- change policy.

## Design review questions

- where is the invariant enforced ?
- what happens under concurrency ?
- what if event delivery duplicates ?
- what if external effect succeeds and local commit fails ?
- who can transition to SETTLED ?
- what is the recovery source ?

---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/mayabank-instant-payments-resilience-platform
  - zdmooc/payment-hub-iso20022-opf-reference
  - zdmooc/mayabank-kafka-ddd-openshift
  - zdmooc/mayabank-ibm-mq-native-ha-openshift-eda-platform
---

# Partie IX — API, Event-Driven et Data Architecture

## Trois contrats différents

Une plateforme de paiement expose généralement trois familles de contrats :

~~~text
Synchronous API
Asynchronous events
Financial messages
~~~

Ils ne sont pas interchangeables.

- API : requête/réponse pour canal ou partenaire.
- Event : notification d'un fait ou d'une transition d'état.
- Message financier : contrat de scheme ou d'infrastructure.

## API design

Exemple conceptuel de création :

~~~http
POST /payments
Idempotency-Key: 6d4...

{
  "amount": {"value":"25.00","currency":"EUR"},
  "creditor": {"alias":"+33..."},
  "channel":"ECOMMERCE",
  "merchantOrderId":"ORD-123"
}
~~~

Réponse conceptuelle :

~~~json
{
  "paymentId":"PAY-...",
  "status":"PENDING",
  "links":{"self":"/payments/PAY-..."}
}
~~~

Ce contrat est une REFERENCE_ARCHITECTURE, pas une API publique EPI.

## Idempotency contract

Sémantique attendue :

~~~text
same key + same semantic payload
→ same logical result

same key + materially different payload
→ conflict
~~~

Stocker :

- key ;
- fingerprint sémantique ;
- paymentId ;
- outcome ;
- expiry policy.

L'idempotence doit être atomique sous concurrence.

## Durable intent

Pattern critique :

~~~text
persist intent
BEFORE
potential external financial effect
~~~

Sinon :

1. paiement externe réussi ;
2. crash local avant enregistrement ;
3. retry du caller ;
4. risque de second paiement.

## Concurrency

Approches :

- optimistic versioning ;
- compare-and-swap ;
- row/advisory lock ;
- lease ;
- single-writer partition.

L'invariant compte plus que le produit :
un seul logical intent peut déclencher un effet financier donné.

## Transactional Outbox

Problème classique :

~~~text
DB commit
then publish event
~~~

Crash entre les deux = état et événement divergents.

Pattern :

~~~text
DB transaction:
  payment update
  + outbox insert
COMMIT

publisher:
  claim pending row
  publish event
  mark published
~~~

## Inbox / consumer deduplication

Un consumer doit tolérer une livraison au moins une fois.

Référence :

- eventId + consumer = unique ;
- si nouveau : appliquer l'effet ;
- si déjà traité : ack sans second effet.

## Delivery semantics

At-most-once : peut perdre.

At-least-once : peut dupliquer.

Exactly-once : souvent limité à un périmètre broker/transaction.

Règle du livre :

**Exactly-once messaging n'est pas une preuve de no-double-payment end-to-end.**

La sûreté financière exige idempotence et réconciliation aux frontières.

## Event taxonomy

Événements de référence :

- PaymentIntentCreated ;
- PaymentAuthorized ;
- PaymentSubmitted ;
- PaymentUnknown ;
- PaymentSettled ;
- PaymentRejected ;
- PaymentReconciled ;
- PaymentReturned ;
- RefundCreated ;
- RefundSettled ;
- MerchantCallbackFailed.

Envelope :

- eventId ;
- eventType ;
- eventVersion ;
- paymentId ;
- occurredAt ;
- correlationId ;
- causationId ;
- trace context ;
- payload.

## Event versioning

Principes :

- évolution additive ;
- schema version explicite ;
- compatibility tests ;
- deprecation window ;
- registry lorsque pertinent.

## Kafka et MQ

Ils illustrent des patterns différents.

Kafka-like :

- log d'événements ;
- multi-consumers ;
- replay ;
- analytics.

MQ-like :

- commandes ;
- queues ;
- transactional messaging ;
- backout / DLQ.

Une architecture bancaire peut combiner les deux.

## Replay

~~~text
replay event
!= replay payment
~~~

Replay sécurisé :

- eventId ;
- consumer dedup ;
- business idempotency ;
- scope ;
- audit ;
- approval pour flux sensibles.

## DLQ

Une DLQ doit avoir un runbook :

- classifier ;
- corriger ;
- replay/drop/manual ;
- relier au paymentId ;
- enregistrer l'action opérateur.

## Modèle de données canonique

Entités :

~~~text
PaymentIntent
Payment
PaymentInstruction
PaymentStatusHistory
LedgerEntry
OutboxEvent
InboxEvent
InvestigationCase
MerchantOrder
PaymentRequest
Refund
CallbackDelivery
Consent
BeneficiaryAlias
RiskDecision
ReconciliationRecord
~~~

## Ledger

Le ledger doit conserver l'histoire.

Exemple :

~~~text
PAYMENT_SETTLEMENT   +100
REFUND               -20
REFUND               -30
~~~

On ne remplace pas l'entrée initiale par un état final simplifié.

## Payment state store

Optimisé pour l'orchestration :

- current state ;
- version ;
- external reference ;
- timestamps.

Il ne remplace pas l'historique ledger/audit.

## Reconciliation store

Contient :

- source A ;
- source B ;
- comparison ;
- discrepancy ;
- owner ;
- resolution ;
- evidence.

## Consistency classes

Strong consistency candidates :

- idempotency reservation ;
- financial state ;
- ledger ;
- single-writer ownership.

Eventual consistency candidates :

- analytics ;
- dashboards ;
- search ;
- notification history.

## CAP appliqué au paiement

En partition réseau, autoriser deux writers divergents peut être pire qu'une indisponibilité temporaire.

Pour les données financières :

- quorum ;
- fencing ;
- ownership ;
- fail-closed selon le cas.

## RPO=0

Un claim RPO=0 doit préciser :

- failure domain ;
- acknowledged commits ;
- synchronous replicas ;
- quorum ;
- storage durability ;
- evidence.

RPO=0 sur perte d'un nœud n'implique pas RPO=0 sur perte région.

## Encryption

À considérer :

- transit ;
- at-rest ;
- backup ;
- event logs ;
- secrets ;
- key separation.

## Retention

Le paiement combine besoins :

- comptables ;
- litiges ;
- fraude ;
- support ;
- privacy minimisation.

La rétention doit être par classe de données.

## Data lineage

Pour un paiement :

~~~text
request
→ intent
→ risk
→ instruction
→ rail response
→ ledger
→ event
→ merchant callback
→ reconciliation
~~~

## Evidence du companion lab

Le flagship instant-payments du portefeuille apporte des preuves runtime documentées pour plusieurs patterns :

- idempotency ;
- UNKNOWN ;
- Outbox/Inbox ;
- Kafka outage recovery ;
- webhook dedup ;
- refund ;
- correlation chain ;
- external inquiry simulator.

Ces preuves sont utiles pour valider le pattern, pas pour attribuer ces technologies à Wero/EPI.

## Conclusion

API, événements et données forment la mémoire du paiement. Leur fonction principale est de préserver une vérité durable et réconciliable lorsque le système distribué devient ambigu.

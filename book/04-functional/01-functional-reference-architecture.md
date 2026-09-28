---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources:
  - wero-merchants
  - epc-vop-2026-v1.1
related_internal_repos:
  - zdmooc/wero-organisme-poc
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Partie III — Architecture fonctionnelle de référence

## 1. Objectif

Cette partie ne décrit pas l'architecture interne d'EPI. Elle définit une **architecture de capacités** permettant à une banque, un PSP ou un architecte de raisonner sur un service Wero/instant-payment de bout en bout.

## 2. Capability map

```text
CHANNEL & EXPERIENCE
├── Wallet / Bank App
├── Merchant Checkout
├── POS
└── Notifications

IDENTITY & TRUST
├── Enrollment
├── Customer IAM
├── SCA
├── Consent
├── Device trust
└── Workload identity

PAYMENT CONTROL
├── Payment Request
├── Payment Initiation
├── Orchestration
├── Idempotency
├── State Machine
├── Routing
└── Status / Inquiry

RISK
├── Fraud
├── VoP
├── AML
├── Sanctions
└── Limits

FINANCIAL PROCESSING
├── Account validation
├── Funds check
├── Ledger
├── Payment Hub
├── SCT Inst Gateway
└── CSM connectivity

OPERATIONS
├── Reconciliation
├── Refund
├── Return / Recall
├── Investigation
├── Dispute
├── Reporting
└── Audit

PLATFORM
├── API
├── Eventing
├── Data
├── Observability
├── Security
└── Resilience
```

## 3. Domain boundaries

### Customer / Wallet Domain

Owns:
- user-facing enrolment ;
- wallet state ;
- preferences ;
- device registration ;
- user-level payment history view.

Does not own:
- final settlement truth.

### Directory / Alias Domain

Owns:
- alias binding ;
- lookup ;
- eligibility ;
- lifecycle and freshness.

Important states:
- FOUND ;
- NOT_FOUND ;
- STALE ;
- UNAVAILABLE.

A directory outage must not silently fall back to an unverified destination.

### Consent Domain

Owns:
- what the customer approved ;
- scope ;
- merchant/payee context ;
- amount constraints ;
- recurrence conditions ;
- timestamps ;
- revocation.

### Payment Orchestration Domain

Owns the logical payment intent and coordinates:
- validation ;
- risk ;
- execution ;
- status ;
- inquiry ;
- reconciliation.

It should avoid embedding every bank product detail directly.

### Financial Execution Domain

Owns:
- account and funds checks ;
- ledger posting/reservation logic ;
- rail instruction ;
- financial state.

This domain must remain deterministic.

### Risk Domain

Combines distinct controls:

```text
Fraud != AML != Sanctions != VoP
```

They may contribute to one decision but solve different problems and have different legal/operational semantics.

### Merchant / Acceptor Domain

Owns:
- merchant order correlation ;
- payment request ;
- channel type ;
- callback/webhook ;
- merchant-facing status ;
- refund initiation ;
- merchant reconciliation.

## 4. Reference component map

```text
Channels
   |
API Gateway
   |
+--------------------------+
| Payment Experience/API   |
+--------------------------+
   |
Payment Orchestrator
   |
   +--> IAM / Consent / SCA
   +--> Directory / Alias
   +--> Fraud / VoP / AML / Sanctions
   +--> Payment Hub / Core Adapter
   +--> SCT Inst Adapter
   +--> Reconciliation
   +--> Notification
   +--> Merchant / Acceptor
   |
Event Bus
   |
Audit / Analytics / Operations
```

## 5. Payment state as a first-class domain object

Recommended conceptual object:

```text
Payment
- paymentId
- businessIntentKey
- payerReference
- payeeReference
- amount / currency
- commercialContext
- consentReference
- riskDecisionReference
- financialState
- schemeState
- externalReference
- createdAt / updatedAt
- version
```

The model should not store only a generic `status` field. A single status often becomes ambiguous once commercial, orchestration and financial states diverge.

## 6. State transition invariants

Examples:

- SETTLED cannot transition to FAILED because a webhook delivery failed.
- REFUNDED does not erase SETTLED; it adds a later financial movement.
- UNKNOWN cannot become a new CREATED payment on a blind retry.
- merchant order cancellation does not automatically reverse an already-settled payment.
- an alias lookup failure does not justify reuse of stale beneficiary data unless explicitly allowed by policy.

## 7. Functional sequence — nominal

```text
Channel
  -> Payment API: create intent
Payment API
  -> Idempotency: reserve/check logical key
  -> Directory/VoP: validate beneficiary
  -> Fraud/Risk: assess
  -> Consent/SCA: approve
  -> Financial Execution: submit
Financial Execution
  -> Rail Adapter: instruction
Rail Adapter
  -> External infrastructure
External
  -> Rail Adapter: authoritative result
Rail Adapter
  -> Orchestrator: update financial state
Orchestrator
  -> Event Bus: PaymentSettled
  -> Notification/Merchant
```

## 8. Functional sequence — ambiguous outcome

```text
submit
→ timeout after possible external effect
→ financialState = UNKNOWN
→ schedule inquiry
→ query authoritative external status
→ reconcile same paymentId
→ SETTLED or FAILED
```

No new financial instruction is created until policy has established that this is safe.

## 9. Reconciliation as a capability, not a batch afterthought

Reconciliation must answer:

1. What did we intend?
2. What did we commit locally?
3. What did we send?
4. What did the external system accept?
5. What was settled?
6. What did we notify?
7. What did the merchant/customer observe?

Reference reconciliation dimensions:

- transaction count ;
- amount ;
- identifiers ;
- status ;
- timestamps ;
- ledger entries ;
- external records ;
- callback delivery.

## 10. Capability ownership matrix

| Capability | System of record candidate | Recovery authority |
|---|---|---|
| Customer consent | consent domain | consent store/audit |
| Business intent | orchestrator | durable intent store |
| Account balance | core/ledger | core/ledger |
| Rail status | rail adapter cache | external inquiry/CSM |
| Merchant order | merchant | merchant backend |
| Callback delivery | acceptor integration | delivery log |
| Audit trail | audit platform | append-only evidence |
| Reconciliation result | reconciliation domain | authoritative compared records |

## 11. NFRs by capability

### Payment Orchestrator
- strong idempotency ;
- durable state ;
- optimistic/pessimistic concurrency control ;
- observable state transitions.

### Directory
- low latency ;
- freshness ;
- outage semantics explicit.

### Fraud
- deterministic fallback policy ;
- timeout budget ;
- explainable decision references.

### Rail Adapter
- message validation ;
- duplicate control ;
- inquiry ;
- no blind replay.

### Merchant Integration
- signed callbacks ;
- retry ;
- deduplication ;
- active status retrieval.

## 12. Design rule: capability before product

The book always defines:
1. required capability ;
2. contract ;
3. NFR ;
4. failure mode ;
5. evidence ;
6. only then a possible product.

For example:

```text
Eventing capability
  != Kafka mandatory

Messaging capability
  != IBM MQ mandatory

Container platform
  != OpenShift mandatory

Database HA
  != PostgreSQL mandatory
```

Products used by companion labs illustrate patterns; they do not reveal participant technology.

## 13. Conclusion

The functional architecture is the bridge between business journeys and technical architecture. It provides stable concepts that can survive product replacement, cloud migration and regulatory change.

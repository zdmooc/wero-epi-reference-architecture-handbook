---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Modèle de données paiement et ledger

## Séparer workflow et ledger

Payment workflow answers:

- where is the payment in its lifecycle?

Ledger answers:

- what financial entries exist?

Do not overload one table with both responsibilities.

## Core entities

~~~text
PAYMENT
PAYMENT_REFERENCE
PAYMENT_STATUS_HISTORY
PAYMENT_MESSAGE
LEDGER_ENTRY
REFUND
RECONCILIATION_CASE
IDEMPOTENCY_CLAIM
OUTBOX
INBOX
AUDIT_EVENT
~~~

## PAYMENT

Fields:

- paymentId ;
- businessKey ;
- payerRef ;
- payeeRef ;
- amount ;
- currency ;
- financialState ;
- schemeState ;
- version ;
- createdAt ;
- updatedAt.

## PAYMENT_REFERENCE

Multiple references per payment:

- merchant order ;
- payment request ;
- MsgId ;
- EndToEndId ;
- TxId ;
- settlement reference.

Use type/value/issuer/effective timestamps.

## Status history

Append:

- from ;
- to ;
- reason ;
- source ;
- timestamp ;
- correlation ;
- actor.

Current state can be denormalized in PAYMENT.

## Ledger entry

Immutable concept:

- entryId ;
- account/reference ;
- direction ;
- amount ;
- currency ;
- booking/settlement reference ;
- paymentId ;
- original entry if correction.

## Refund

Separate:

- refundId ;
- originalPaymentId ;
- amount ;
- state ;
- reason ;
- business key.

## Reconciliation case

Stores:

- expected ;
- observed ;
- difference ;
- external evidence ;
- resolution ;
- operator.

## Audit

Audit should be append-only/tamper-evident according to policy.

Record:

- privileged actions ;
- manual correction ;
- configuration changes ;
- state override ;
- replay.

## PII

Classify:

- names ;
- IBAN/account ;
- phone/e-mail aliases ;
- IP/device ;
- fraud data.

Minimise copies.

## Encryption

- storage encryption ;
- backup encryption ;
- TLS ;
- field-level protection where justified ;
- keys separate from data.

## Retention

Different retention classes:

- financial ;
- operational logs ;
- traces ;
- fraud ;
- user directory ;
- audit.

Do not retain all data forever because storage is cheap.

## Indexes

Need for:

- paymentId ;
- businessKey ;
- EndToEndId ;
- TxId ;
- merchantOrderId ;
- status/age for operations.

Beware hot indexes and excessive write cost.

## Partitioning

Possible by:

- date ;
- tenant/domain ;
- hash key.

Design for:

- queries ;
- retention ;
- backup ;
- archive ;
- write throughput.

## Data quality

Constraints:

- exact numeric type ;
- currency mandatory ;
- unique business keys ;
- valid transitions ;
- references not silently overwritten.

## Recovery

Restore test must prove:

- PAYMENT ;
- ledger ;
- references ;
- idempotency claims ;
- outbox ;
- audit
remain mutually coherent.

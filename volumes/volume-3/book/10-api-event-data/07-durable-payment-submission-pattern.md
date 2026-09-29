---
status: COLLECTION_V2_REVIEWED
last_verified: 2026-09-29
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
---

# Durable payment submission pattern

The platform implementation must make the Volume II invariant — one controlled financial submission per logical payment — enforceable under concurrency and crash recovery.

## Data model

Conceptual tables:

```text
PAYMENT
- payment_id PK
- idempotency_key UNIQUE
- business_state
- financial_state
- version
- created_at
- updated_at

SUBMISSION
- submission_id PK
- payment_id UNIQUE
- rail
- route
- state
- external_reference
- created_at

OUTBOX
- event_id PK
- aggregate_id
- event_type
- payload
- published_at NULLABLE
```

The schema is illustrative. The important property is uniqueness of submission ownership, not the specific database product.

## API flow

```text
request
→ validate idempotency key
→ load/create logical payment
→ transactionally claim submission
→ persist intent + outbox
→ commit
→ external rail worker submits
→ persist outcome/reference
→ emit status event
```

## Concurrency

Two API replicas can receive the same logical request.

Correctness must come from durable state:

- unique constraint;
- conditional update / compare-and-set;
- serialisation strategy where justified;
- immutable correlation identity.

Do not rely on in-memory locks across replicas.

## Crash windows

### Crash before commit
No durable submission claim exists. Same logical request can be retried.

### Crash after claim, before external submit
Recovery worker can resume the claimed submission.

### Crash after external submit, before local outcome
State becomes uncertain. Recover through external evidence/reconciliation, not a new payment.

### Crash after outcome, before event publication
Transactional Outbox permits event publication to resume without recreating the financial effect.

## Event deduplication

Consumers maintain an Inbox/deduplication identity when side effects are not naturally idempotent.

"Exactly once" at one broker layer is not a substitute for end-to-end financial idempotency.

## Operator replay

Replay tooling must distinguish:

- republish an event;
- rerun a projection;
- retry a technical callback;
- submit a financial instruction.

The last action requires explicit financial-state authority and must never be hidden behind a generic "retry" button.

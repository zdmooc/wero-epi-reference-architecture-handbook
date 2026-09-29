---
status: REVIEWED
last_verified: 2026-09-29
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/mayabank-kafka-ddd-openshift
  - zdmooc/mayabank-ibm-mq-native-ha-openshift-eda-platform
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Event-driven architecture, Outbox, Inbox, Kafka et MQ

La @fig-10-001 matérialise la vue de référence de ce chapitre.

![Pattern Outbox/Inbox transactionnel — transport at-least-once et effet métier idempotent.](../../diagrams/svg/secondary/FIG-10-001-outbox-inbox.svg){#fig-10-001}

*Statut : **REFERENCE_ARCHITECTURE** · Source(s) : Handbook reference architecture · Vérifié : 2026-09-29.*

## 1. Event ≠ command

Event:
- fact that happened.

Command:
- request to perform action.

Do not publish PaymentSettled until authoritative settlement state exists.

## 2. Event envelope

~~~json
{
  "eventId": "evt-001",
  "eventType": "PaymentSettled",
  "aggregateId": "pay-001",
  "aggregateVersion": 7,
  "occurredAt": "...",
  "correlationId": "...",
  "schemaVersion": 2,
  "payload": {}
}
~~~

## 3. Transactional Outbox

Atomic transaction:
~~~text
update PAYMENT
insert OUTBOX
COMMIT
~~~

Publisher later:
~~~text
OUTBOX
→ broker
→ mark published
~~~

This prevents DB-success/broker-loss gap.

## 4. Outbox worker

Needs:
- batching ;
- locking/claim ;
- SKIP LOCKED or equivalent ;
- retry ;
- poison handling ;
- lag metrics.

## 5. Inbox

Consumer:
1. attempt insert eventId into INBOX ;
2. if exists, duplicate ;
3. if new, process effect ;
4. commit business state + INBOX.

## 6. Kafka partitioning

Possible key:
- paymentId.

Benefits:
- ordering per payment ;
- horizontal scale.

Do not partition all payments on one key.

## 7. MQ use cases

MQ remains relevant for:
- guaranteed enterprise messaging ;
- legacy/core integration ;
- request/reply where justified ;
- transactional patterns.

Kafka and MQ are not interchangeable slogans; choose by contract.

## 8. Delivery semantics

At-least-once transport is compatible with exactly-one business effect if consumers are idempotent.

Never promise exactly-once financial settlement purely because a broker offers transaction features.

## 9. Schema evolution

Rules:
- version envelope ;
- additive fields ;
- tolerant readers ;
- avoid changing meaning ;
- schema registry where appropriate.

## 10. DLQ

DLQ entry includes:
- event ;
- error ;
- first/last failure ;
- attempts ;
- consumer version ;
- correlation.

DLQ replay requires business-safe check.

## 11. Replay

Before replay:
- inspect current aggregate state ;
- verify event not already applied ;
- authorize operator ;
- scope subset ;
- observe impact.

## 12. Broker outage

Outbox allows:
- payment DB commits ;
- secondary events wait ;
- publisher catches up after broker recovery.

Whether new payments continue depends on how critical downstream consumers are.

## 13. Consumer outage

Broker retains backlog.

Monitor:
- lag ;
- age ;
- throughput ;
- storage ;
- recovery time.

## 14. Event storms

Avoid event loop:
- consumer writes update ;
- emits event ;
- another consumer echoes back.

Define ownership and causal rules.

## 15. Security

- TLS ;
- SASL/workload identity ;
- ACL per topic/queue ;
- encryption ;
- no secrets in payload ;
- data classification.

## 16. Operations

Dashboards:
- broker health ;
- producer error ;
- outbox lag ;
- consumer lag ;
- DLQ ;
- duplicate rate ;
- replay actions.

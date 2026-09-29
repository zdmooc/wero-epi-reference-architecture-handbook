---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/mayabank-kafka-ddd-openshift
---

# Saga, compensation, replay et DLQ

## Payment is not a generic saga demo

External settlement may be irreversible. A compensation cannot pretend to undo a final transfer.

## Orchestration saga

Reference:
~~~text
create intent
→ risk
→ authorize
→ submit
→ wait result
→ notify
~~~

If settlement succeeds and notification fails:

- retry notification ;
- do not compensate financial payment.

## Compensation types

### Technical compensation
Release local reservation.

### Business compensation
Create refund/return process.

### No compensation
If external effect is final and no reverse operation is justified.

## State persistence

Saga state durable:

- current step ;
- completed steps ;
- external refs ;
- retry count ;
- timers.

## Timers

Examples:

- payment request expiry ;
- waiting for external status ;
- webhook retry ;
- investigation escalation.

Timers must survive process restart.

## DLQ

DLQ is an operational queue, not a trash can.

For each entry:

- owner ;
- severity ;
- retryability ;
- runbook ;
- age alert.

## Replay safety

Categories:

- safe read-model event ;
- idempotent state event ;
- dangerous external side-effect command.

Only first two are broadly replayable.

## Poison message

If payload/schema invalid:

- quarantine ;
- preserve ;
- alert ;
- fix producer/consumer ;
- controlled replay.

Do not infinite-loop.

## Compensation audit

When creating refund:

- link original payment ;
- reason ;
- approval ;
- amount ;
- operator/system ;
- outcome.

## Timeout saga

If external call times out:

- do not automatically move to compensation ;
- determine whether effect may exist ;
- UNKNOWN + inquiry.

## Human task

Some cases require:

- operator decision ;
- fraud review ;
- recall approval ;
- treasury action.

Human task is a durable workflow state, not an e-mail side process.

## Concurrent saga

One logical payment should have one financial owner.

Use:

- lease/claim ;
- optimistic version ;
- DB uniqueness.

## Event choreography risk

Pure choreography can make overall state hard to understand.

For critical financial lifecycle, explicit orchestration/state ownership often improves auditability.

## Metrics

- saga age ;
- stuck state ;
- compensation count ;
- DLQ age ;
- replay count ;
- human queue ;
- unknown resolution.

## Testing

- crash between steps ;
- duplicate event ;
- delayed event ;
- compensation fails ;
- refund unknown ;
- DLQ replay ;
- operator double action.

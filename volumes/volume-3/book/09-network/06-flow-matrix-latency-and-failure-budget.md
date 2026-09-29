---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources:
  - epc-sct-inst-2025-v1.1
related_internal_repos:
  - zdmooc/wero-organisme-poc
---

# Matrice des flux, budget de latence et failure budget

## Une architecture réseau doit être exploitable

Un joli diagramme n'est pas suffisant. Il faut une matrice de flux.

## Flow record

Fields:

- flowId ;
- source ;
- destination ;
- direction ;
- protocol ;
- port ;
- auth ;
- encryption ;
- data class ;
- timeout ;
- retry ;
- criticality ;
- owner.

## Example

| ID | Source | Destination | Protocol | Auth | Critical |
|---|---|---|---|---|---|
| F01 | Customer | API GW | HTTPS | session/SCA | yes |
| F02 | API GW | Payment API | HTTPS/mTLS | workload | yes |
| F03 | Payment | Fraud | HTTPS/mTLS | workload | yes |
| F04 | Payment | DB | DB/TLS | workload | yes |
| F05 | Payment Hub | Rail Adapter | HTTPS/mTLS | workload | yes |
| F06 | Rail Adapter | CSM | scheme channel | cert | yes |
| F07 | Acceptor | Merchant | HTTPS | signed webhook | yes |

## Timeout hierarchy

Avoid contradiction:

- proxy timeout 2s ;
- app timeout 5s ;
- client timeout 3s.

Define top-down budget.

## SCT Inst timing context

The scheme/regulatory timing creates an end-to-end constraint.

Architecture must allocate margin between:

- channel ;
- API ;
- risk ;
- core ;
- adapter ;
- CSM ;
- beneficiary.

## Tail latency

Track:

- p50 ;
- p95 ;
- p99 ;
- p99.9 ;
- max.

Tail determines customer timeouts and UNKNOWN risk.

## Connection setup

Latency components:

- DNS ;
- TCP ;
- TLS ;
- mTLS ;
- authentication ;
- application.

Use persistent secure connections where safe to avoid repeated setup cost.

## Packet loss

Small packet loss can amplify latency with retransmissions.

Monitor:

- loss ;
- retransmit ;
- reset ;
- handshake failure.

## Failure budget

For each dependency:

- detection time ;
- failover time ;
- retry allowance ;
- reconciliation impact.

Example:
~~~text
total customer budget
- normal processing
- network variance
- failover allowance
= safety margin
~~~

## Queueing

At high load, queues dominate latency.

Monitor:

- request queue ;
- thread pool ;
- DB pool ;
- broker lag ;
- network appliance queue.

## Timeout storm

If dependency slows:

- callers timeout ;
- retry ;
- more load ;
- further slowdown.

Controls:

- bounded retry ;
- circuit breaker ;
- backpressure ;
- queue limits ;
- load shedding on non-critical features.

## Financial retry

Network retry must never bypass idempotency.

For uncertain financial effect:

- stop ;
- mark UNKNOWN ;
- reconcile.

## Synthetic checks

Safe checks can verify:

- DNS ;
- TLS ;
- route ;
- auth ;
- non-financial health endpoint.

Do not create real money movement just for basic network health.

## Change impact

Any network change should identify affected flow IDs.

This enables:

- targeted testing ;
- rollback ;
- audit.

## Deliverables

Network chapter should produce:

- zone diagram ;
- flow matrix ;
- certificate inventory ;
- latency budget ;
- failure matrix ;
- failover test evidence.

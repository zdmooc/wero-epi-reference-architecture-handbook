---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Cohérence, concurrence et CAP dans les paiements

## 1. Le problème n'est pas CAP en théorie

La vraie question :
> que fait le système pendant une partition sans créer deux effets financiers contradictoires ?

## 2. Single logical writer

For a payment:
- one authoritative state transition owner ;
- concurrent requests serialized by key/version ;
- no two independent writers.

## 3. Optimistic concurrency

Good for:
- state update ;
- merchant order ;
- refund progression.

Handle conflict explicitly.

## 4. Pessimistic lock

Useful for short critical sections:
- partial refund remaining amount ;
- reconciliation claim ;
- outbox batch.

Avoid long locks across network calls.

## 5. Unique constraints

Use database constraints for invariants:
- idempotency key ;
- eventId ;
- external reference where truly unique.

Application checks alone race.

## 6. Partition

If region A and B cannot communicate:
- do not allow both to become financial writer unless protocol guarantees no conflict ;
- choose availability or correctness per capability.

## 7. Degraded availability

Possible:
- status reads continue ;
- new payments paused ;
- non-financial notifications queued.

This can be safer than dual-write.

## 8. Consensus

Distributed DB may use consensus internally.

Architecture still needs:
- quorum placement ;
- latency ;
- loss-of-quorum behavior ;
- fencing ;
- operational understanding.

## 9. RPO=0

Must specify:
- acknowledged commit ;
- failure domain ;
- synchronous replicas ;
- quorum ;
- storage durability.

RPO=0 for DB does not mean external financial effect can never be temporarily missing locally.

## 10. Eventual consistency

Use for views and propagation, with convergence guarantees.

Never use eventual consistency to justify contradictory debits.

## 11. Read-after-write

Customer UX often needs immediate view after create.

Options:
- return resource from write path ;
- read primary/consistent replica ;
- session consistency.

## 12. Replication lag

If status read hits lagging replica:
- could show PENDING after SETTLED.

Design:
- monotonic client view ;
- state authority ;
- avoid downgrade.

## 13. Multi-region

Patterns:
- active/passive ;
- cell ownership ;
- regional sharding ;
- active/active with constrained ownership.

No universal best model.

## 14. Testing

- two concurrent submits ;
- network partition ;
- leader loss ;
- stale replica read ;
- failover during submit ;
- duplicate external response.

## 15. Principle

Prefer an explicit UNKNOWN or temporary unavailability over a false financial certainty.

---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/wero-organisme-poc
  - zdmooc/dora-operational-resilience-architecture-masterbook
---

# Active/passive, active/active, fencing et split-brain

## 1. Availability is not correctness

Deux sites actifs peuvent augmenter disponibilité tout en augmentant le risque de double effet.

## 2. Active/passive

~~~text
Site A ACTIVE
  |
replication
  |
Site B STANDBY
~~~

Advantages:
- single writer ;
- simpler consistency.

Risks:
- standby untested ;
- promotion delay ;
- stale config ;
- failback.

## 3. Hot vs warm standby

Hot:
- services running ;
- data near-current ;
- quick promotion.

Warm:
- partial capacity ;
- startup/scale required.

Document exact state.

## 4. Active/active

Possible models:
- shared consensus datastore ;
- sharded ownership ;
- cell-based ;
- region affinity.

Avoid uncontrolled dual writer.

## 5. Split brain

Scenario:
- A cannot see B ;
- both think other failed ;
- both accept same logical payment.

Outcome can be catastrophic.

## 6. Fencing

Before promoting B:
- ensure A cannot write.

Mechanisms:
- consensus lease ;
- DB quorum ;
- storage fencing ;
- network isolation ;
- cloud/provider fencing ;
- manual isolation with proof.

## 7. Quorum

Place quorum so no simple network partition creates two majorities.

Understand:
- node count ;
- zone placement ;
- witness ;
- latency.

## 8. External side effects

Even if internal DB uses consensus, two workers may still call external rail twice unless submission ownership is fenced.

Use:
- durable claim ;
- state version ;
- unique logical submission ;
- idempotency.

## 9. Traffic fencing

Global LB/DNS must not send new writes to old site after promotion.

Need:
- health source ;
- TTL ;
- drain ;
- session handling.

## 10. Operator split brain

Two incident teams can take conflicting actions.

Define:
- incident commander ;
- promotion authority ;
- runbook ;
- communication channel.

## 11. Failover sequence

~~~text
detect
→ declare incident
→ freeze/limit writes if needed
→ fence old writer
→ promote data
→ enable app
→ route traffic
→ validate rail
→ reconcile
→ reopen full service
~~~

## 12. Failback

Not immediate.

Need:
- root cause fixed ;
- data resynced ;
- old site trustworthy ;
- planned window ;
- second fencing event.

## 13. Testing

- clean failover ;
- network partition ;
- stale standby ;
- old writer returns ;
- DNS lag ;
- operator duplicate promotion ;
- external submit during switchover.

## 14. Metrics

- detection ;
- fencing time ;
- promotion ;
- traffic switch ;
- first successful payment ;
- reconciliation completion.

## 15. Design rule

If the architecture cannot explain exactly who owns write authority during every partition, it is not ready for active/active financial processing.

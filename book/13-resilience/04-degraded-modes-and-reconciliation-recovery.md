---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Modes dégradés, recovery et réconciliation

## 1. Degraded mode is designed, not improvised

Define what remains:
- read status ;
- accept new payment ;
- perform refund ;
- send webhook ;
- perform admin actions.

## 2. Dependency-specific modes

### IAM unavailable
Maybe:
- validate already-issued token locally ;
- block new login.

Only if security policy permits.

### Broker unavailable
Maybe:
- payment continues ;
- events wait in Outbox.

### Fraud unavailable
Policy may:
- fail closed ;
- allow only low-risk subset ;
- lower limits.

### CSM unavailable
- no unsafe financial retry ;
- status remains available ;
- queue only if scheme/timing permits.

## 3. Read-only mode

Useful during:
- DB failover ;
- uncertain site state ;
- cyber containment.

Allow:
- history ;
- status.

Block:
- new financial writes.

## 4. Safe stop

A safe stop is better than wrong payment.

Triggers:
- no trusted financial state ;
- split brain risk ;
- key compromise ;
- settlement uncertainty beyond policy.

## 5. Recovery phases

~~~text
contain
→ restore infrastructure
→ restore trusted data
→ restore connectivity
→ reconcile
→ validate
→ reopen writes
→ clear backlog
~~~

## 6. UNKNOWN queue

After incident:
- list all SUBMITTED/UNKNOWN ;
- sort by age/value/risk ;
- inquire ;
- compare ledger ;
- converge.

## 7. Merchant recovery

For settled payment whose webhook was lost:
- resend callback ;
- merchant dedup ;
- update order.

Do not resubmit payment.

## 8. Event recovery

Outbox backlog:
- publish in controlled rate ;
- monitor consumers ;
- avoid flood.

## 9. Reconciliation before reopen

Depending on incident severity, require:
- zero critical unexplained payments ;
- or defined acceptable queue with owner.

Decision recorded.

## 10. Cyber recovery

Need trusted restore:
- clean binaries ;
- rotated keys ;
- validated data ;
- isolated malicious persistence.

Then reconcile external financial truth.

## 11. Manual correction

Use:
- dedicated tool ;
- RBAC ;
- reason ;
- four-eyes if material ;
- immutable audit.

No direct production SQL as normal process.

## 12. Customer communication

States:
- processing ;
- temporarily unavailable ;
- restored.

Do not claim failure where outcome unknown.

## 13. Exercise

Test degraded mode explicitly, not only full failover.

Examples:
- broker down ;
- IAM down ;
- VoP down ;
- read replica only ;
- CSM outage.

## 14. Metrics

- time in degraded mode ;
- transactions blocked ;
- UNKNOWN count ;
- reconciliation age ;
- manual corrections ;
- backlog clearance.

## 15. Exit criteria

Return normal only when:
- root dependency stable ;
- monitoring green ;
- backlog controlled ;
- payment invariants validated ;
- incident commander approves.

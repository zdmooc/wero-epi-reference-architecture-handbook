---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Modes dégradés, recovery et réconciliation

## Degraded mode is designed, not improvised

Define what remains:

- read status ;
- accept new payment ;
- perform refund ;
- send webhook ;
- perform admin actions.

## Dependency-specific modes

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

## Read-only mode

Useful during:

- DB failover ;
- uncertain site state ;
- cyber containment.

Allow:

- history ;
- status.

Block:

- new financial writes.

## Safe stop

A safe stop is better than wrong payment.

Triggers:

- no trusted financial state ;
- split brain risk ;
- key compromise ;
- settlement uncertainty beyond policy.

## Recovery phases

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

## UNKNOWN queue

After incident:

- list all SUBMITTED/UNKNOWN ;
- sort by age/value/risk ;
- inquire ;
- compare ledger ;
- converge.

## Merchant recovery

For settled payment whose webhook was lost:

- resend callback ;
- merchant dedup ;
- update order.

Do not resubmit payment.

## Event recovery

Outbox backlog:

- publish in controlled rate ;
- monitor consumers ;
- avoid flood.

## Reconciliation before reopen

Depending on incident severity, require:

- zero critical unexplained payments ;
- or defined acceptable queue with owner.

Decision recorded.

## Cyber recovery

Need trusted restore:

- clean binaries ;
- rotated keys ;
- validated data ;
- isolated malicious persistence.

Then reconcile external financial truth.

## Manual correction

Use:

- dedicated tool ;
- RBAC ;
- reason ;
- four-eyes if material ;
- immutable audit.

No direct production SQL as normal process.

## Customer communication

States:

- processing ;
- temporarily unavailable ;
- restored.

Do not claim failure where outcome unknown.

## Exercise

Test degraded mode explicitly, not only full failover.

Examples:

- broker down ;
- IAM down ;
- VoP down ;
- read replica only ;
- CSM outage.

## Metrics

- time in degraded mode ;
- transactions blocked ;
- UNKNOWN count ;
- reconciliation age ;
- manual corrections ;
- backlog clearance.

## Exit criteria

Return normal only when:

- root dependency stable ;
- monitoring green ;
- backlog controlled ;
- payment invariants validated ;
- incident commander approves.

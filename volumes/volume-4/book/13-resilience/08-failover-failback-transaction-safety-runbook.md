---
status: COLLECTION_V2_REVIEWED
last_verified: 2026-09-29
truth_level: REFERENCE_ARCHITECTURE
primary_sources:
  - eu-dora-2022-2554
---

# Failover / failback transaction-safety runbook

## Objective

Restore service without creating duplicate financial effects, split-brain or irreversible state divergence.

## Failover sequence

```text
detect
→ classify incident
→ establish incident command
→ stop or limit new financial writes if authority uncertain
→ prove/fence old writer
→ validate data state
→ promote target data authority
→ enable application writers
→ validate rail/connectivity credentials
→ switch traffic
→ execute synthetic/non-destructive checks
→ execute approved payment validation
→ reconcile in-flight/UNKNOWN transactions
→ reopen full service
```

## Mandatory evidence before promotion

- old writer cannot continue authorised writes;
- promoted data state is understood;
- unique submission ownership remains enforceable;
- route/rail credentials available;
- monitoring path works;
- operator roles are explicit.

## In-flight payment classes

### Not submitted
Safe to resume under same logical identity.

### Submission claimed but no external send
Recover worker ownership; do not create second payment.

### Possibly submitted
Mark/retain UNKNOWN and investigate.

### Settled externally
Repair local observation; never resubmit.

## Failback

Failback is a new controlled transition, not "turn the first site back on".

Required:

- root cause fixed;
- old site/data reconciled;
- authority transfer plan;
- second fencing event;
- controlled traffic shift;
- post-failback reconciliation.

## Success criteria

- no dual writer;
- no duplicate external effect;
- RTO measured;
- RPO measured/evidenced;
- UNKNOWN backlog bounded and resolved;
- business status converges;
- evidence package complete.

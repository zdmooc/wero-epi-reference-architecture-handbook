---
status: COLLECTION_V2_REVIEWED
last_verified: 2026-09-29
truth_level: REFERENCE_ARCHITECTURE
primary_sources:
  - kubernetes-probes
  - kubernetes-topology-spread
  - kubernetes-pdb
---

# Runtime evidence and failure-test ladder

## Evidence follows the failure domain

A test is evidence only for the property and environment actually exercised.

## Ladder

### Level 1 — process/container
- startup failure;
- deadlock/liveness;
- readiness withdrawal;
- graceful termination;
- memory/CPU pressure.

### Level 2 — pod/node
- pod kill;
- node drain;
- node loss;
- topology rescheduling;
- PDB behaviour for voluntary disruption.

### Level 3 — dependency
- database unavailable/failover;
- broker unavailable;
- IAM unavailable;
- DNS failure;
- PKI/certificate failure;
- rail adapter timeout.

### Level 4 — zone/site
- zone traffic removal;
- storage failure-domain loss;
- cross-zone dependency;
- site failover;
- fencing.

### Level 5 — end-to-end financial correctness
- timeout after submit;
- duplicated callback;
- duplicated event;
- old writer returns after failover;
- reconciliation resolves UNKNOWN;
- no second financial effect.

## Evidence record

Each test record should contain:

- test ID;
- build/config SHA;
- environment topology;
- fault injected;
- timestamps;
- expected invariant;
- observed outcome;
- payment/trace correlation IDs;
- metrics/log/trace references;
- pass/fail;
- residual risk.

## Critical rule

A successful pod restart is not evidence of site resilience.

A successful site switch is not sufficient evidence of payment correctness unless the test also proves:

- only one writer/submission authority;
- no duplicate external effect;
- state convergence;
- reconciliation;
- controlled failback.

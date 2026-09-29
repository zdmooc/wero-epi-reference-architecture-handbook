---
status: COLLECTION_V2_REVIEWED
last_verified: 2026-09-29
truth_level: REFERENCE_ARCHITECTURE
primary_sources:
  - eu-dora-2022-2554
---

# Resilience architecture decision framework

High availability is a property of the end-to-end service, not a synonym for "two sites".

## Decision dimensions

A resilience design is selected against:

- business service criticality;
- tolerated data loss;
- tolerated interruption;
- consistency model;
- external financial side effects;
- database/broker capabilities;
- network latency and partition behaviour;
- rail/connectivity dependencies;
- operational maturity;
- failover/failback evidence;
- cost and complexity.

## Active/passive

Preferable when a single write authority materially simplifies correctness.

Required evidence:

- replication lag understood;
- standby capacity proven;
- promotion authority defined;
- old writer fenced;
- traffic switch tested;
- failback rehearsed.

## Active/active

Active/active is acceptable only when the design can state exactly who owns each write and external financial effect during every relevant partition.

Possible models:

- consensus-backed single logical authority;
- sharded/cell ownership;
- region affinity with deterministic ownership;
- service-specific active/active with a single financial-submission authority.

"Both sites accept everything independently" is not a sufficient financial design.

## RPO=0 caution

An architectural objective of zero committed-data loss requires evidence at the authoritative data boundary. It does not follow from:

- two application replicas;
- synchronous-looking API calls;
- asynchronous cross-site replication;
- successful pod restart.

## Decision record

For each critical service record:

- selected mode;
- write authority;
- data authority;
- external-effect authority;
- quorum/witness;
- fencing mechanism;
- routing mechanism;
- RTO/RPO objective;
- degraded mode;
- failback method;
- evidence references.

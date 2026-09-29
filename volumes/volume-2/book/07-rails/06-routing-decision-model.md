---
status: COLLECTION_V2_REVIEWED
last_verified: 2026-09-29
truth_level: REFERENCE_ARCHITECTURE
primary_sources:
  - ecb-tips-overview
  - eba-clearing-rt1
  - epc-sct-inst-2025-v1.1
---

# Multi-rail routing decision model

Routing is a controlled decision over reachability, policy, health and settlement context. It is not a blind failover between URLs.

## 1. Decision inputs

A reference routing decision can evaluate:
- destination PSP/reachability;
- supported scheme/service;
- participant/access model;
- rail availability;
- participant-specific route health;
- liquidity/position constraints where available to the routing policy;
- operational restrictions;
- effective dates of routing data;
- institution policy.

## 2. Deterministic decision record

For every logical payment, persist a routing decision record:

```text
routingDecision
- paymentId
- destinationPsp
- selectedRail
- selectedRoute
- decisionVersion
- reason
- effectiveDirectoryVersion
- createdAt
```

This makes production behaviour explainable after the fact.

## 3. Before submission

Rerouting may be possible when evidence proves that no financial instruction was submitted.

## 4. After possible submission

If effect is uncertain, do not silently reroute the same customer intent to another rail.

```text
possible submit on Rail A
+ no authoritative outcome
≠ safe permission to submit on Rail B
```

First resolve the original financial outcome.

## 5. Reachability is versioned data

Routing data must support:
- effective-from/effective-to;
- source/provenance;
- refresh timestamp;
- participant/access model;
- fallback eligibility.

## 6. Failover semantics

A rail outage may produce different states:
- no connection before submit;
- submit rejected;
- submit accepted then response lost;
- rail unavailable after settlement;
- participant-specific unreachable condition.

Failover policy depends on the evidence, not merely on a health check.

## 7. Observability

Measure:
- route decision count;
- route rejection;
- participant-specific failures;
- rail latency;
- UNKNOWN after submit;
- fallback attempts;
- stale directory age.

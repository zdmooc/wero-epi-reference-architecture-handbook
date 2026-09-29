---
status: COLLECTION_V2_REVIEWED
last_verified: 2026-09-29
truth_level: REFERENCE_ARCHITECTURE
primary_sources:
  - ecb-target-shared-features
  - ecb-target-services-annual-report-2025
  - ecb-tips-overview
  - eba-clearing-rt1
---

# Liquidity resilience model

Availability of applications is insufficient when the settlement position cannot support payment execution.

## 1. Liquidity as a first-class dependency

The end-to-end service model includes:
- application capacity;
- connectivity;
- scheme/rail availability;
- settlement account/position;
- ability to transfer or replenish liquidity;
- operational ownership.

## 2. Reference thresholds

An institution-specific implementation may define:
- target operating buffer;
- warning threshold;
- critical threshold;
- emergency threshold;
- forecast horizon;
- automated/manual replenishment boundary.

These values are institution-specific reference-design parameters, not public Wero/EPI facts.

## 3. State model

```text
NORMAL
→ WATCH
→ LOW
→ CRITICAL
→ RESTRICTED / RECOVERING
→ NORMAL
```

The state must be based on measured position, expected flows and operational ability to replenish.

## 4. Stress scenarios

- traffic spike;
- asymmetric outgoing flow;
- delayed liquidity transfer;
- loss of operator access;
- rail-specific position stress;
- weekend/night operational incident;
- route change that moves volume to another settlement context.

## 5. Guardrail

Routing decisions must not hide liquidity risk. Moving traffic between rails can change operational and settlement dependencies and therefore requires explicit policy.

## 6. Evidence

Production readiness should be able to show:
- position monitoring;
- threshold ownership;
- alert path;
- replenishment procedure;
- degraded-mode rule;
- test evidence;
- reconciliation after liquidity-related rejects.

## 7. Cross-volume contract

V2 owns the liquidity model. V3 exposes telemetry and integrations. V4 owns on-call, incident handling, BIA/RTO and evidence.

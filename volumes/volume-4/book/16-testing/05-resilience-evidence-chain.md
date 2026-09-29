---
status: COLLECTION_V2_REVIEWED
last_verified: 2026-09-29
truth_level: REFERENCE_ARCHITECTURE
primary_sources:
  - eu-dora-2022-2554
---

# Resilience evidence chain

## 1. From claim to proof

```text
Business objective
→ architecture decision
→ control
→ test
→ observation
→ evidence artifact
→ finding
→ remediation
→ retest
```

A document asserting "RPO=0" is not evidence. Evidence demonstrates the authoritative data boundary and tested failure scenario.

## 2. Evidence classes

- configuration evidence;
- topology evidence;
- runtime logs/metrics/traces;
- data consistency evidence;
- rail/settlement evidence;
- operator/runbook evidence;
- timing evidence;
- reconciliation evidence;
- recovery/failback evidence.

## 3. Example — site loss

Claim: critical payment service survives site loss within target.

Evidence package:
- topology and failure-domain map;
- initial data state;
- fault timestamp;
- fencing evidence;
- promotion timestamp;
- first successful payment timestamp;
- RTO calculation;
- transaction sample before/during/after event;
- duplicate check;
- UNKNOWN/reconciliation report;
- failback evidence.

## 4. Negative evidence matters

A failed exercise produces useful evidence when:
- the failure is preserved;
- root cause is traceable;
- corrective action is owned;
- retest criterion is explicit.

Deleting inconvenient test results weakens operational-resilience governance.

## 5. Runtime-proven boundary

`RUNTIME_PROVEN` applies only to the demonstrated property in the demonstrated environment and version. It never silently becomes proof of production architecture.

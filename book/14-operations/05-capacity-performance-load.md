---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Capacity planning, performance et load testing

## 1. Capacity is end-to-end

Bottleneck can be:
- API ;
- CPU ;
- DB ;
- HSM ;
- broker ;
- network ;
- fraud ;
- rail ;
- liquidity.

## 2. Workload model

Define:
- normal TPS ;
- peak TPS ;
- burst ;
- request mix ;
- payment vs status ;
- refund ;
- webhook ;
- inquiry.

## 3. Business peaks

Examples:
- salary ;
- lunch ;
- weekends ;
- Black Friday ;
- campaign ;
- ticket launch ;
- incident recovery.

## 4. Performance percentiles

Measure:
- p50 ;
- p95 ;
- p99 ;
- p99.9 ;
- max.

Average is insufficient.

## 5. Load test types

### Baseline
Normal volume.

### Stress
Beyond capacity.

### Spike
Sudden burst.

### Soak
Long duration.

### Recovery
Backlog after outage.

### Failure under load
Kill component during peak.

## 6. Data realism

Use:
- realistic payload sizes ;
- key distributions ;
- merchant mix ;
- enough DB history.

Do not use real PII.

## 7. DB capacity

Metrics:
- TPS ;
- query latency ;
- locks ;
- connections ;
- IOPS ;
- WAL/log ;
- replication lag.

## 8. Broker capacity

- producer throughput ;
- consumer lag ;
- partition skew ;
- disk ;
- recovery throughput.

## 9. HSM capacity

- crypto ops/s ;
- sessions ;
- latency ;
- failover capacity.

## 10. Network capacity

- bandwidth ;
- packets ;
- TLS handshakes ;
- connections ;
- NAT ports ;
- loss.

## 11. Autoscaling

Scale before saturation when possible.

But downstream must support extra load.

HPA cannot fix:
- DB max connections ;
- CSM rate limit ;
- HSM saturation.

## 12. Backpressure

When downstream slower:
- queue bounded ;
- reject/slow according to policy ;
- protect system ;
- do not create retry storm.

## 13. Headroom

Capacity target includes:
- forecast growth ;
- failure capacity ;
- recovery backlog ;
- maintenance.

## 14. Capacity review

Cadence:
- weekly trend ;
- monthly forecast ;
- before major campaign ;
- after architecture change.

## 15. Evidence

Performance claim requires:
- environment ;
- dataset ;
- topology ;
- versions ;
- load profile ;
- percentiles ;
- bottleneck ;
- date.

Local CRC numbers are not production capacity evidence.

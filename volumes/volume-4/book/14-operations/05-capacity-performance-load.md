---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Capacity planning, performance et load testing

## Capacity is end-to-end

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

## Workload model

Define:

- normal TPS ;
- peak TPS ;
- burst ;
- request mix ;
- payment vs status ;
- refund ;
- webhook ;
- inquiry.

## Business peaks

Examples:

- salary ;
- lunch ;
- weekends ;
- Black Friday ;
- campaign ;
- ticket launch ;
- incident recovery.

## Performance percentiles

Measure:

- p50 ;
- p95 ;
- p99 ;
- p99.9 ;
- max.

Average is insufficient.

## Load test types

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

## Data realism

Use:

- realistic payload sizes ;
- key distributions ;
- merchant mix ;
- enough DB history.

Do not use real PII.

## DB capacity

Metrics:

- TPS ;
- query latency ;
- locks ;
- connections ;
- IOPS ;
- WAL/log ;
- replication lag.

## Broker capacity

- producer throughput ;
- consumer lag ;
- partition skew ;
- disk ;
- recovery throughput.

## HSM capacity

- crypto ops/s ;
- sessions ;
- latency ;
- failover capacity.

## Network capacity

- bandwidth ;
- packets ;
- TLS handshakes ;
- connections ;
- NAT ports ;
- loss.

## Autoscaling

Scale before saturation when possible.

But downstream must support extra load.

HPA cannot fix:

- DB max connections ;
- CSM rate limit ;
- HSM saturation.

## Backpressure

When downstream slower:

- queue bounded ;
- reject/slow according to policy ;
- protect system ;
- do not create retry storm.

## Headroom

Capacity target includes:

- forecast growth ;
- failure capacity ;
- recovery backlog ;
- maintenance.

## Capacity review

Cadence:

- weekly trend ;
- monthly forecast ;
- before major campaign ;
- after architecture change.

## Evidence

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

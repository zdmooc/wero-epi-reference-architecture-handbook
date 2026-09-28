---
status: REVIEWED
last_verified: 2026-09-28
truth_level: EVIDENCE
primary_sources: []
related_internal_repos:
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Companion Lab — carte des preuves exécutables

## 1. Rôle

Le handbook explique.

Le companion lab démontre certains comportements applicatifs.

Repository:
zdmooc/mayabank-instant-payments-resilience-platform

## 2. Proven themes

Selon le référentiel interne :
- stateless recovery ;
- PostgreSQL-backed payment state ;
- Outbox recovery ;
- Kafka-compatible broker recovery ;
- observability ;
- Consumer/Acceptor journeys ;
- webhook retry/dedup ;
- refund ;
- correlation ;
- concurrent idempotency ;
- UNKNOWN/inquiry recovery.

## 3. What it proves

Application-pattern evidence:
- stable intent ;
- idempotent creation ;
- durable state ;
- crash recovery ;
- event propagation ;
- callback recovery.

## 4. What it does not prove

- real Wero internal behavior ;
- real TIPS connection ;
- real RT1 connection ;
- bank production topology ;
- multi-AZ ;
- multi-site ;
- production SLA ;
- DORA compliance.

## 5. Mapping

| Handbook topic | Companion evidence |
|---|---|
| Idempotency | concurrent same-key tests |
| UNKNOWN | crash window + inquiry |
| Outbox | broker outage/recovery |
| Webhook | retry/dedup |
| Refund | separate operation |
| Observability | traces/metrics/logs |
| Pod recovery | CRC runtime |
| Multi-site | reference design only |

## 6. Evidence link pattern

Handbook chapter may say:
> Companion lab demonstrates this pattern in a local CRC environment.

It must not say:
> Wero production works this way.

## 7. Version pinning

Each future book release should record:
- lab tag ;
- commit ;
- OpenShift/K8s version ;
- application version.

## 8. Reproducibility

Lab should provide:
- one-command demo ;
- test scripts ;
- expected result ;
- evidence pack.

## 9. Evidence retention

For release:
- logs ;
- screenshots where useful ;
- command outputs ;
- test reports ;
- limitations.

## 10. New proof backlog

High-value future evidence:
- multi-node Kubernetes ;
- DB leader failover ;
- broker failover ;
- network partition ;
- cert rotation ;
- multi-site reference simulation.

## 11. Lab separation

No book chapter should include code dump better maintained in the lab repository.

Use explanation + link/reference.

## 12. Security

The lab uses synthetic data and generic names.

No client secrets or non-public architecture.

## 13. Publication

The lab may be offered as companion material, but access/licensing is a separate publishing decision.

## 14. Maintenance

When handbook architecture changes:
- update lab only if executable pattern changes ;
- do not force every conceptual chapter into code.

## 15. Principle

One source for narrative, one source for executable evidence, linked by explicit claims.

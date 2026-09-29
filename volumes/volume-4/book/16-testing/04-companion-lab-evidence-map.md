---
status: REVIEWED
last_verified: 2026-09-28
truth_level: EVIDENCE
primary_sources: []
related_internal_repos:
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Companion Lab — carte des preuves exécutables

## Rôle

Le handbook explique.

Le companion lab démontre certains comportements applicatifs.

Repository:
zdmooc/mayabank-instant-payments-resilience-platform

## Proven themes

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

## What it proves

Application-pattern evidence:

- stable intent ;
- idempotent creation ;
- durable state ;
- crash recovery ;
- event propagation ;
- callback recovery.

## What it does not prove

- real Wero internal behavior ;
- real TIPS connection ;
- real RT1 connection ;
- bank production topology ;
- multi-AZ ;
- multi-site ;
- production SLA ;
- DORA compliance.

## Mapping

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

## Evidence link pattern

Handbook chapter may say:
> Companion lab demonstrates this pattern in a local CRC environment.

It must not say:
> Wero production works this way.

## Version pinning

Each future book release should record:

- lab tag ;
- commit ;
- OpenShift/K8s version ;
- application version.

## Reproducibility

Lab should provide:

- one-command demo ;
- test scripts ;
- expected result ;
- evidence pack.

## Evidence retention

For release:

- logs ;
- screenshots where useful ;
- command outputs ;
- test reports ;
- limitations.

## New proof backlog

High-value future evidence:

- multi-node Kubernetes ;
- DB leader failover ;
- broker failover ;
- network partition ;
- cert rotation ;
- multi-site reference simulation.

## Lab separation

No book chapter should include code dump better maintained in the lab repository.

Use explanation + link/reference.

## Security

The lab uses synthetic data and generic names.

No client secrets or non-public architecture.

## Publication

The lab may be offered as companion material, but access/licensing is a separate publishing decision.

## Maintenance

When handbook architecture changes:

- update lab only if executable pattern changes ;
- do not force every conceptual chapter into code.

## Principle

One source for narrative, one source for executable evidence, linked by explicit claims.

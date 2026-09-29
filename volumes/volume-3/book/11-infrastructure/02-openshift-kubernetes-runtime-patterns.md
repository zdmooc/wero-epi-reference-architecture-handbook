---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/openshift-platform-blueprints
  - zdmooc/k8s-openshift-cluster-factory
---

# OpenShift / Kubernetes — patterns runtime

## 1. Le cluster n'est pas l'architecture métier

OpenShift fournit des capacités de plateforme :
- scheduling ;
- networking ;
- ingress ;
- secrets ;
- policy ;
- storage ;
- autoscaling ;
- operators ;
- observability.

Le paiement conserve ses propres invariants au-dessus.

## 2. Namespaces

Reference separation:
- payment-app ;
- payment-data ;
- platform-observability ;
- platform-security ;
- gitops ;
- shared-services.

Avoid namespace sprawl without ownership.

## 3. Deployment

For stateless services:
- replicas aligned with failure objective ;
- readiness ;
- startup ;
- liveness ;
- requests/limits ;
- topology spread ;
- anti-affinity.

## 4. Readiness

A pod should not receive traffic if:
- startup incomplete ;
- configuration invalid ;
- mandatory dependency unavailable according to service policy.

Avoid making readiness depend on every optional downstream.

## 5. Liveness

Liveness answers whether the process is stuck.

It must not restart healthy pods because a downstream system is temporarily unavailable.

## 6. Startup probe

Useful for slow JVM/startup to prevent premature liveness failures.

## 7. Requests and limits

Requests drive scheduling.

Too low:
- contention ;
- eviction risk.

Too high:
- poor density ;
- unschedulable workloads.

Limits require workload-specific testing.

## 8. HPA

Scale signals:
- CPU ;
- memory ;
- custom RPS/queue metrics.

Payment latency and downstream capacity can matter more than CPU alone.

## 9. PDB

PodDisruptionBudget reduces risk during voluntary disruption.

It does not protect against:
- node crash ;
- zone loss ;
- app bug ;
- DB outage.

## 10. Topology spread

Distribute replicas across nodes and zones only if the infrastructure truly has those failure domains.

## 11. NetworkPolicy

Default deny and explicit allow for:
- API ;
- DB ;
- broker ;
- IAM ;
- observability ;
- egress.

## 12. Secrets

Use:
- external secret manager/operator ;
- short-lived credentials where possible ;
- RBAC ;
- rotation.

No secret in ConfigMap or Git.

## 13. Storage

Stateful workloads need:
- storage class ;
- topology ;
- performance ;
- snapshot ;
- backup ;
- restore ;
- failure-domain semantics.

## 14. Operators

Operators can simplify lifecycle but add:
- CRD versioning ;
- compatibility ;
- upgrade dependency ;
- support boundaries.

## 15. Runtime evidence

CRC/local can prove deployment, probes, pod restart, GitOps and application behavior.

It does not prove multi-worker, AZ, site or production throughput.

---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - https://eur-lex.europa.eu/eli/reg/2022/2554/oj
  - https://www.ecb.europa.eu/paym/cyber-resilience/tiber-eu/html/index.en.html
related_internal_repos:
  - zdmooc/dora-operational-resilience-architecture-masterbook
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Résilience opérationnelle et DORA

## 1. DORA baseline

Regulation (EU) 2022/2554 applies from **17 January 2025**.

For an architect, DORA is not a « PRA regulation ». It spans:
- ICT risk management ;
- incident management/reporting ;
- resilience testing ;
- ICT third-party risk ;
- oversight / contractual and concentration concerns.

## 2. Critical business service view

```text
Execute Instant Payment
    |
    +--> Channel
    +--> IAM
    +--> Fraud / VoP
    +--> Payment Hub
    +--> Core account
    +--> DB
    +--> Kafka/MQ
    +--> Network
    +--> PKI/HSM
    +--> CSM / settlement
    +--> Merchant notification
    +--> Third parties
```

A PRA that ignores one critical dependency is incomplete.

## 3. Failure domains

```text
process
pod
node
rack
zone
site
region
network
DNS
PKI
HSM
IAM
database
broker
CSM
settlement
provider
subcontractor
human/process
cyber compromise
```

## 4. Infrastructure + application

### Infrastructure resilience
- replicas ;
- multi-zone ;
- storage ;
- DB HA ;
- load balancing ;
- network redundancy.

### Application resilience
- idempotence ;
- durable state ;
- Outbox/Inbox ;
- dedup ;
- UNKNOWN ;
- inquiry ;
- reconciliation ;
- controlled retry.

### Operational resilience
- monitoring ;
- runbooks ;
- staffing ;
- supplier escalation ;
- decision rights ;
- crisis process.

## 5. RTO

RTO is not the time for Kubernetes to start a pod.

Business-service RTO measures restoration of the useful service.

Examples:
- API reachable ;
- new payment safe to accept ;
- status inquiry working ;
- settlement path working ;
- operator can reconcile.

## 6. RPO

RPO must identify the dataset/failure domain.

Possible separate RPOs:
- payment database ;
- event stream ;
- audit ;
- reporting ;
- configuration.

Financial truth may be external to local storage.

## 7. Active/passive

Advantages:
- simpler single-writer ;
- easier fencing.

Risks:
- stale standby ;
- promotion error ;
- DNS/routing delay ;
- untested failback.

## 8. Active/active

Risks:
- double writer ;
- conflicting states ;
- duplicate external effect ;
- cross-region latency ;
- consensus dependency.

For financial systems, availability without correctness is not resilience.

## 9. Fencing

Before promoting a standby writer:

> prove the previous writer cannot still write.

Mechanisms may involve:
- DB consensus ;
- lease ;
- storage fencing ;
- network isolation ;
- external coordination.

## 10. Degraded modes

Not all functions need identical availability.

Possible:
- allow status lookup while blocking new payments ;
- allow existing-token operations while IAM login is degraded if security policy permits ;
- pause non-critical reporting ;
- queue secondary events.

Never degrade:
- duplicate protection ;
- financial state integrity ;
- audit of sensitive action.

## 11. Test strategy

```text
DESIGN CLAIM
→ FAILURE SCENARIO
→ EXPECTED SERVICE
→ EXPECTED DATA STATE
→ RTO/RPO TARGET
→ INJECT FAILURE
→ MEASURE
→ VERIFY BUSINESS INVARIANTS
→ EVIDENCE
→ REMEDIATE
```

## 12. Chaos scenarios

Minimum:
- kill application pod ;
- kill broker ;
- DB failover ;
- DNS failure ;
- certificate expiry/rotation ;
- IAM unavailable ;
- CSM unavailable ;
- timeout-after-effect ;
- duplicate callback ;
- site loss ;
- network partition ;
- retry storm.

## 13. DORA incident reporting

ESA operational instructions published in September 2026 support competent authorities and financial entities around major ICT-related incident reporting. They reference Implementing Regulation (EU) 2025/302 for forms/procedures.

Editorial rule:
- operational guidance is not itself a replacement for the Regulation/ITS.

## 14. TLPT / TIBER-EU

The ECB updated TIBER-EU to align with DORA TLPT RTS.

Architecture implication:
- threat-led scenarios ;
- controlled red-team ;
- control team ;
- provider governance ;
- remediation ;
- evidence ;
- purple-team phase under the aligned framework.

Not every institution is automatically in the same TLPT scope; applicability must be established.

## 15. Third-party risk

For each provider:
- service ;
- data ;
- region/jurisdiction ;
- subcontractors ;
- concentration ;
- exit ;
- replacement time ;
- recovery ;
- contractual support ;
- testability.

## 16. Exit strategy

Exit is architecture:
- export data ;
- alternative provider ;
- DNS/cert/network changes ;
- re-deploy ;
- re-key secrets ;
- reconcile state ;
- preserve audit ;
- prove continuity.

## 17. Evidence language

```text
DESIGNED
IMPLEMENTED
STATICALLY_TESTED
CI_RENDER_PROVEN
RUNTIME_PROVEN
PRODUCTION_VALIDATED
COMPLIANT
```

These are not synonyms.

## 18. Companion lab evidence

The portfolio contains runtime evidence for:
- concurrency/idempotency ;
- UNKNOWN→inquiry recovery ;
- webhook loss ;
- Kafka outage/outbox ;
- observability ;
- pod replacement.

It explicitly does not claim multi-AZ/site production resilience from CRC.

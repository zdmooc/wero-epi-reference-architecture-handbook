---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Exploitation, SRE et production readiness

## 1. Observability

Three technical pillars:
- logs ;
- metrics ;
- traces.

But payment operations requires a fourth:
- **business state observability**.

## 2. Correlation contract

Every telemetry item should carry where relevant:
- paymentId ;
- merchantOrderId ;
- paymentRequestId ;
- EndToEndId ;
- TxId ;
- eventId ;
- correlationId ;
- traceId.

Never log sensitive data unnecessarily.

## 3. Golden payment signals

### Availability
Can a user safely create/status a payment?

### Latency
- API ;
- fraud ;
- VoP ;
- Payment Hub ;
- rail ;
- end-to-end.

### Errors
- technical ;
- reject ;
- UNKNOWN ;
- reconciliation.

### Saturation
- CPU/memory ;
- DB connections/locks/IOPS ;
- Kafka lag ;
- MQ depth ;
- thread pool ;
- connection pool ;
- storage.

## 4. Business KPIs

- initiated ;
- authorized ;
- submitted ;
- settled ;
- rejected ;
- unknown ;
- reconciled ;
- refunded ;
- callback failed ;
- duplicate detected ;
- STP rate ;
- merchant recovery rate.

## 5. SLI / SLO

Example framework, not contractual targets:

| Service | SLI | SLO decision |
|---|---|---|
| payment API | successful safe requests | business-approved |
| status API | availability | business-approved |
| instant-payment completion | completion latency | scheme-aware |
| reconciliation | age of unresolved UNKNOWN | operations-approved |
| webhooks | successful delivery | merchant contract |
| liquidity monitoring | freshness | treasury-approved |

Do not invent SLA percentages in the book.

## 6. Latency

Measure:
- p50 ;
- p95 ;
- p99 ;
- p99.9 ;
- max ;
- timeout rate.

Averages hide tail latency.

## 7. Capacity

Monitor by domain:
- RPS/TPS ;
- concurrent requests ;
- DB ;
- broker ;
- storage ;
- network ;
- CSM ;
- external dependencies.

Review:
- daily incident view ;
- weekly trend ;
- monthly capacity plan ;
- before peak ;
- before major release.

## 8. Peak model

```text
normal volume
× business peak factor
× incident/retry factor
× growth factor
= design load
```

Test recovery under load, not only steady state.

## 9. Runbook — payment UNKNOWN

1. identify payment ;
2. freeze blind retry ;
3. find all identifiers ;
4. query external authoritative status ;
5. compare local state ;
6. reconcile ;
7. apply controlled transition ;
8. verify ledger ;
9. verify merchant/customer status ;
10. close with audit.

## 10. Runbook — reject spike

Check:
- deployment ;
- scheme version ;
- XSD ;
- reason codes ;
- BIC/IBAN data ;
- address-format rules ;
- certificates ;
- CSM maintenance ;
- participant reachability.

## 11. Runbook — latency

Trace:
```text
edge
→ gateway
→ IAM
→ VoP
→ fraud
→ core
→ Payment Hub
→ network
→ CSM
→ beneficiary
```

## 12. Runbook — certificate expiry

- identify cert ;
- chain ;
- SAN ;
- trust ;
- expiry ;
- secret ;
- issuer ;
- rotation ;
- reload/restart behavior ;
- regression payment.

## 13. Incident management

Timeline:
- detect ;
- classify ;
- contain ;
- preserve evidence ;
- restore ;
- reconcile payments ;
- communicate ;
- postmortem ;
- remediate.

## 14. Postmortem

Must answer:
- customer impact ;
- financial impact ;
- number of UNKNOWN ;
- duplicates prevented/created ;
- time to authoritative truth ;
- failure domain ;
- missing signal ;
- control that failed ;
- permanent action.

## 15. Production Readiness Review

Checklist:
- ownership ;
- on-call ;
- SLO ;
- dependencies ;
- capacity ;
- HA ;
- backup ;
- restore ;
- DR ;
- network ;
- security ;
- certificates ;
- observability ;
- runbooks ;
- reconciliation ;
- deployment ;
- rollback ;
- third parties ;
- compliance/evidence.

## 16. Architecture E2E — bank

```text
Digital Channel
→ API Management
→ IAM/SCA
→ Payment Orchestrator
→ Fraud/VoP
→ Payment Hub
→ Core Account
→ SCT Inst Gateway
→ CSM/Settlement
→ Reconciliation
→ Notification
```

## 17. Architecture E2E — merchant

```text
Checkout/POS
→ PSP/Acceptor
→ Wero payment request
→ Consumer authorization
→ financial payment
→ authoritative status
→ webhook/status API
→ fulfilment
```

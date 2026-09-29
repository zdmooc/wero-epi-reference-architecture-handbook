---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Matrice de tests end-to-end

## 1. Test by invariant

The most important invariants:
- one intent → at most one financial effect ;
- no false success ;
- UNKNOWN recoverable ;
- refund distinct ;
- audit complete ;
- settlement truth reconcilable.

## 2. Journey tests

### P2P
- nominal ;
- invalid alias ;
- alias changes ;
- double click ;
- timeout ;
- beneficiary unavailable.

### E-commerce
- desktop QR ;
- mobile app-to-app ;
- browser return lost ;
- webhook lost ;
- duplicate callback ;
- order amount changed.

### POS
- QR expiry ;
- double scan ;
- POS reboot ;
- store network loss ;
- customer approves after terminal timeout.

## 3. ISO tests

- pacs.008 valid ;
- invalid XSD ;
- wrong scheme field ;
- duplicate ;
- pacs.002 positive ;
- negative reason ;
- delayed ;
- recall ;
- return ;
- status inquiry.

## 4. Rail tests

- TIPS route nominal ;
- RT1 route nominal ;
- destination unreachable ;
- primary route down before submit ;
- timeout after submit ;
- directory stale ;
- low liquidity.

Real CSM tests require participant/test environments; mocks only prove adapter logic.

## 5. Concurrency tests

- 10 same key ;
- 50 ;
- 100 ;
- same key/different payload ;
- concurrent refunds ;
- simultaneous status callbacks.

Assertions:
- one logical resource ;
- no duplicate effect ;
- deterministic conflict.

## 6. Failure tests

- app pod ;
- node ;
- DB leader ;
- broker ;
- DNS ;
- WAF ;
- IAM ;
- HSM ;
- CSM connection ;
- site.

## 7. Recovery tests

- UNKNOWN inquiry ;
- DB restore + reconciliation ;
- outbox drain ;
- DLQ replay ;
- merchant callback resend ;
- site failback.

## 8. Security tests

- auth bypass ;
- expired token ;
- wrong audience ;
- invalid cert ;
- webhook forgery ;
- replay ;
- unauthorized admin ;
- secret leak simulation.

## 9. Performance

- baseline ;
- peak ;
- spike ;
- soak ;
- failure under load ;
- backlog recovery.

## 10. Liquidity

- warning threshold ;
- critical threshold ;
- failed funding ;
- route concentration ;
- weekend simulation.

## 11. Data

- backup restore ;
- PITR ;
- replication failover ;
- stale replica ;
- audit integrity.

## 12. DORA/resilience

- business-service continuity ;
- DR exercise ;
- third-party outage ;
- cyber recovery ;
- TLPT applicability/process where legally required.

## 13. Evidence template

~~~yaml
test_id:
claim:
environment:
version:
preconditions:
action:
expected:
observed:
business_result:
financial_result:
rto:
rpo:
evidence:
limitations:
status:
~~~

## 14. Pass criteria

A test passes only if:
- technical expectation ;
- business state ;
- financial state ;
- audit
all satisfy expected result.

## 15. Regression

Critical tests run on:
- scheme update ;
- DB change ;
- routing change ;
- security change ;
- major platform upgrade.

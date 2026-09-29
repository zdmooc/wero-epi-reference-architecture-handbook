---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Matrice de tests end-to-end

## Test by invariant

The most important invariants:

- one intent → at most one financial effect ;
- no false success ;
- UNKNOWN recoverable ;
- refund distinct ;
- audit complete ;
- settlement truth reconcilable.

## Journey tests

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

## ISO tests

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

## Rail tests

- TIPS route nominal ;
- RT1 route nominal ;
- destination unreachable ;
- primary route down before submit ;
- timeout after submit ;
- directory stale ;
- low liquidity.

Real CSM tests require participant/test environments; mocks only prove adapter logic.

## Concurrency tests

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

## Failure tests

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

## Recovery tests

- UNKNOWN inquiry ;
- DB restore + reconciliation ;
- outbox drain ;
- DLQ replay ;
- merchant callback resend ;
- site failback.

## Security tests

- auth bypass ;
- expired token ;
- wrong audience ;
- invalid cert ;
- webhook forgery ;
- replay ;
- unauthorized admin ;
- secret leak simulation.

## Performance

- baseline ;
- peak ;
- spike ;
- soak ;
- failure under load ;
- backlog recovery.

## Liquidity

- warning threshold ;
- critical threshold ;
- failed funding ;
- route concentration ;
- weekend simulation.

## Data

- backup restore ;
- PITR ;
- replication failover ;
- stale replica ;
- audit integrity.

## DORA/resilience

- business-service continuity ;
- DR exercise ;
- third-party outage ;
- cyber recovery ;
- TLPT applicability/process where legally required.

## Evidence template

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

## Pass criteria

A test passes only if:

- technical expectation ;
- business state ;
- financial state ;
- audit
all satisfy expected result.

## Regression

Critical tests run on:

- scheme update ;
- DB change ;
- routing change ;
- security change ;
- major platform upgrade.

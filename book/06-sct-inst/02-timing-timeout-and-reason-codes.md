---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - epc-sct-inst-2025-v1.1
  - epc-sct-inst-reason-codes-2025-v7
  - eu-ipr-2024-886
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Timing, timeout et reason codes SCT Inst

## 1. Plusieurs horloges

Un instant payment possède plusieurs budgets :
- UX ;
- API ;
- risk/VoP ;
- core/payment processing ;
- scheme ;
- CSM/network ;
- legal/regulatory.

Ils doivent être conçus ensemble.

## 2. Baseline EPC 2025

Le rulebook SCT Inst 2025 décrit un budget scheme de neuf secondes pour les acteurs concernés dans le traitement visé.

Le règlement UE 2024/886 contient ses propres exigences de dix secondes pour le périmètre légal concerné.

Ne pas déduire que chaque microservice dispose de neuf ou dix secondes.

## 3. Internal latency budget

Exemple non normatif :

| Stage | Target design budget |
|---|---:|
| API/validation | 100 ms |
| SCA completion already obtained | outside backend budget |
| Fraud/VoP | 500–1000 ms |
| Core/ledger | 300–500 ms |
| Adapter | 100–200 ms |
| Network/CSM/peer | dominant shared budget |
| Safety margin | mandatory |

Les valeurs réelles sont mesurées et validées.

## 4. Timeout taxonomy

### Client timeout
UI stops waiting.

### HTTP timeout
One API call exceeded threshold.

### Dependency timeout
Fraud, core, CSM or external PSP did not answer.

### Scheme timeout
Defined by scheme conditions/reason semantics.

### Business expiration
Payment request/mandate no longer valid.

These are different.

## 5. Timeout before effect

Evidence establishes no financial effect:
- connection failed before send ;
- external system explicitly says not found and contract makes that authoritative ;
- local transaction never reached submit.

Retry of same logical payment may be possible.

## 6. Timeout after possible effect

If the system cannot prove whether the instruction took effect:
- mark UNKNOWN ;
- freeze creation of replacement financial payment ;
- investigate.

## 7. AB05 / AB06

EPC reason guidance includes timeout-related codes such as AB05 and AB06 in applicable contexts.

The book stores:
- exact scheme code ;
- documented definition/version ;
- internal category.

Never map every technical timeout to the same scheme code.

## 8. Reason-code architecture

~~~text
SchemeReason
→ InternalReasonCategory
→ OperationalAction
→ CustomerMessage
~~~

Example:
- external code ;
- category = TIMEOUT_BENEFICIARY_SIDE ;
- action = INVESTIGATE ;
- customer = PAYMENT_STATUS_PENDING.

## 9. Unknown code

Rules:
- preserve raw code ;
- do not crash parser ;
- map category UNKNOWN_EXTERNAL_REASON ;
- alert if new/unexpected ;
- update catalog.

## 10. Retryability

Reason code alone may not decide retry.

Consider:
- financial effect certainty ;
- request identity ;
- scheme rule ;
- elapsed time ;
- original transaction state.

## 11. Tail latency

p99/p99.9 matters more than average.

A platform with 100 ms average but 5 s p99 can consume the entire safety margin during peak.

## 12. Clock synchronization

Use reliable time sync.

Risks:
- wrong expiry ;
- bad token validation ;
- inconsistent incident timeline ;
- message timestamp anomalies.

## 13. Monitoring

Metrics:
- end-to-end finality ;
- each internal stage ;
- timeout by dependency ;
- reason-code distribution ;
- UNKNOWN rate ;
- resolution time.

## 14. Customer experience

If finality not known:
- say processing/pending ;
- do not say failed unless known ;
- provide status recovery.

## 15. Incident trigger

Alert on:
- timeout-rate spike ;
- one reason code spike ;
- p99 degradation ;
- unknown backlog ;
- CSM latency ;
- participant-specific pattern.

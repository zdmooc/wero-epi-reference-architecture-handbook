# Annexe — Catalogue de 50 scénarios de panne

> Chaque scénario doit être exécuté ou qualifié avec son failure domain, hypothèse, expected outcome, evidence et owner.

| ID | Scénario | Invariant attendu |
|---|---|---|
| F01 | Crash API avant persistance intent | aucun effet financier |
| F02 | Crash après intent avant submit | reprise même intent |
| F03 | Crash après submit avant réponse | UNKNOWN, pas de blind retry |
| F04 | Crash après réponse avant commit local | inquiry/reconciliation |
| F05 | Double clic utilisateur | un logical payment |
| F06 | 100 requêtes concurrentes même idempotency key | un effet |
| F07 | Même key, montant différent | conflict |
| F08 | Duplicate pacs/message | pas de double effet |
| F09 | pacs.002 perdu | investigation |
| F10 | Timeout creditor agent | classify/reconcile |
| F11 | Timeout instructed agent | classify/reconcile |
| F12 | CSM inaccessible avant submit | aucun effet |
| F13 | CSM réponse perdue après settlement | UNKNOWN→inquiry |
| F14 | Route primaire down | route secondaire seulement si autorisée |
| F15 | Les deux routes down | fail controlled |
| F16 | Beneficiary PSP unreachable | reject/status exact |
| F17 | Liquidity insufficient | pas de faux succès |
| F18 | DCA/position proche seuil | alert/rebalance |
| F19 | Recharge liquidité indisponible | buffer/degraded plan |
| F20 | DNS indisponible | pas de duplicate |
| F21 | DNS retourne endpoint stale | health/failover contrôlé |
| F22 | WAF bloque trafic légitime | détecter/rétablir |
| F23 | DDoS | protéger core |
| F24 | API Gateway saturé | backpressure |
| F25 | Proxy retry POST financier | neutralisé par idempotency |
| F26 | Certificat client expiré | alerte avant expiry |
| F27 | CA/intermediate problème | runbook PKI |
| F28 | HSM inaccessible | fail secure |
| F29 | HSM saturé | queue/alert |
| F30 | IAM indisponible | pas de bypass SCA |
| F31 | Fraud engine timeout | policy déterministe |
| F32 | VoP timeout | règle scheme/legal appliquée |
| F33 | Alias directory unavailable | stop avant mauvaise destination |
| F34 | Alias stale | policy/freshness |
| F35 | DB primary crash | promotion fenced |
| F36 | DB network partition | un writer |
| F37 | Storage unavailable | no unsafe ack |
| F38 | Kafka/broker down | Outbox durable |
| F39 | Duplicate event | Inbox/dedup |
| F40 | Consumer lag massif | backlog observable |
| F41 | DLQ saturation | incident/runbook |
| F42 | Pod kill | self-heal sans double effet |
| F43 | Node loss | reschedule + data safe |
| F44 | AZ loss | remaining zones carry load |
| F45 | Site loss | PRA controlled |
| F46 | Split brain inter-site | fencing |
| F47 | Merchant callback HTTP 500 | durable retry |
| F48 | Duplicate webhook | no duplicate merchant effect |
| F49 | Browser success redirect perdu | status recoverable |
| F50 | Merchant marks paid before financial truth | control prevents fulfilment/error |

## Template d'exécution

```yaml
scenario_id:
failure_domain:
preconditions:
injected_fault:
expected_business_outcome:
expected_financial_outcome:
expected_technical_outcome:
rto_target:
rpo_target:
observed:
evidence:
limitations:
owner:
status:
```

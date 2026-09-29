---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/mayabank-instant-payments-resilience-platform
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Partie XIII — Exploitation, SRE et observabilité

## Exploiter un paiement, pas seulement des composants

Une plateforme peut avoir tous ses pods au vert alors que des paiements restent bloqués, inconnus ou non réconciliés.

L'observabilité doit donc couvrir deux plans :

```text
TECHNICAL HEALTH
CPU / RAM / network / DB / broker / errors / latency

BUSINESS HEALTH
payments created / submitted / settled / rejected / unknown
reconciliation backlog
refund backlog
merchant callback failures
liquidity pressure
```

## Identifiants d'observabilité

Un paiement de bout en bout doit pouvoir être recherché par plusieurs clés :

- `paymentId` ;
- `merchantOrderId` ;
- `paymentRequestId` ;
- `EndToEndId` ;
- `TxId` ;
- `MsgId` ;
- `eventId` ;
- `traceId` ;
- `correlationId` ;
- référence settlement/reconciliation.

Le `traceId` sert à la vue technique. Il ne remplace pas les identifiants financiers.

## OpenTelemetry

Architecture de référence :

```text
Applications
  |
OpenTelemetry SDK / Agent
  |
Collector
  |
+-------------------+
| Traces | Metrics  |
| Logs   | Context  |
+-------------------+
  |
Observability backends
```

La propagation doit conserver le contexte à travers :

- HTTP ;
- messages ;
- Kafka/MQ ;
- callbacks ;
- jobs de reconciliation.

## Logs

Un log utile répond :

- quel paiement ?
- quelle étape ?
- quel actor ?
- quel état avant/après ?
- quelle latence ?
- quel reason code ?
- quel external reference ?

Éviter :

- secrets ;
- tokens ;
- clés ;
- données personnelles excessives ;
- payload XML complet par défaut.

## Metrics

### Techniques
- request rate ;
- error rate ;
- latency ;
- saturation ;
- CPU/memory ;
- DB pool ;
- broker lag ;
- queue depth ;
- network errors.

### Métier
- created TPS ;
- settled TPS ;
- reject rate ;
- UNKNOWN rate ;
- time-to-finality ;
- reconciliation latency ;
- duplicate prevented ;
- refund rate ;
- merchant callback success ;
- VoP response distribution.

## Traces

Une trace idéale relie :

```text
Channel
→ API Gateway
→ Orchestrator
→ Fraud
→ Core
→ Rail Adapter
→ Event publication
→ Reconciliation
→ Merchant callback
```

Pour un rail externe, la trace distribuée peut s'arrêter à la frontière. Il faut alors relier le reste par identifiants métier/ISO.

## SLI / SLO / SLA

### SLI
Mesure.

Exemples :

- successful payment API ratio ;
- p99 initiation latency ;
- payment finality latency ;
- UNKNOWN rate ;
- reconciliation convergence.

### SLO
Objectif interne.

### SLA
Engagement contractuel.

Ne jamais transformer un SLO de lab en SLA client.

## Error budget

Un SLO de disponibilité peut être converti en budget d'erreur, mais pour le paiement il faut ajouter des budgets métier :

- max UNKNOWN rate ;
- max reconciliation backlog ;
- max callback backlog ;
- max stale alias rate ;
- max certificate expiry risk window.

## Latency SLO

Décomposer :

```text
client
+ edge
+ IAM/SCA
+ risk/VoP
+ core
+ rail
+ beneficiary
+ confirmation
```

La latence p99 totale doit être compatible avec le budget scheme.

## Capacity planning

Dimensions :

- payments/sec ;
- peak x normal ;
- retry multiplier ;
- event fan-out ;
- DB write amplification ;
- fraud calls ;
- VoP calls ;
- callback volume ;
- reconciliation backlog ;
- audit retention.

Scénarios :

- Black Friday ;
- soldes ;
- paie ;
- incident rail ;
- recovery après outage ;
- retry storm.

## Backpressure

Quand une dépendance ralentit :

- limiter intake si nécessaire ;
- protéger DB/broker ;
- queue contrôlée ;
- circuit breaker approprié ;
- conserver durable intent ;
- exposer un état honnête.

Le circuit breaker ne doit pas convertir une ambiguïté financière en échec certain.

## Runbooks

Minimum :

### RB-01 — UNKNOWN spike
- confirmer rail/network ;
- suspendre blind retries ;
- lancer inquiry/reconciliation ;
- mesurer scope ;
- informer ops.

### RB-02 — Kafka outage
- vérifier Outbox ;
- préserver paiement ;
- restaurer broker ;
- drain contrôlé ;
- vérifier Inbox.

### RB-03 — DB failover
- fence ancien writer ;
- promouvoir ;
- vérifier commit position ;
- reconcile external effects.

### RB-04 — Certificate expiry
- identifier chain ;
- rotate ;
- reload ;
- test mTLS ;
- verify partner path.

### RB-05 — CSM outage
- confirmer état ;
- stop unsafe submit ;
- activate alternate route only if authorised ;
- reconcile.

### RB-06 — Merchant callback backlog
- payment truth intact ;
- retry delivery ;
- merchant status API available ;
- monitor dedup.

## Incident severity

Severity should combine:

- number/value of payments ;
- customers/merchants ;
- duration ;
- uncertainty ;
- fraud/security ;
- regulatory impact ;
- settlement risk.

A low infrastructure impact can still be a high payment incident if financial state is ambiguous.

## Post-mortem

Include:

- timeline ;
- trigger ;
- contributing factors ;
- blast radius ;
- customer impact ;
- financial impact ;
- detection gap ;
- recovery ;
- reconciliation ;
- why controls failed ;
- actions ;
- owners ;
- due dates.

Avoid “human error” as root cause without system analysis.

## Change/release

24/7 platform principles:

- backward compatibility ;
- expand/contract DB migrations ;
- canary ;
- feature flags ;
- rollback ;
- dark launch where useful ;
- no schema-breaking big bang.

## Operational readiness review

Before production:

- ownership ;
- on-call ;
- dashboards ;
- alerts ;
- runbooks ;
- capacity ;
- backup restore ;
- DR ;
- security ;
- cert lifecycle ;
- dependency map ;
- reconciliation ;
- incident contacts ;
- vendor escalation ;
- change rollback.

## Golden signals + payment signals

```text
Latency
Traffic
Errors
Saturation
+
Finality
UNKNOWN
Reconciliation
Duplicates
Liquidity
Callbacks
```

## Conclusion

SRE appliqué au paiement consiste à exploiter une vérité financière distribuée. Les meilleurs dashboards combinent santé technique et état métier.

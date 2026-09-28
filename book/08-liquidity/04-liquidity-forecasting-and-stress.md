---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources:
  - ecb-target-services-annual-report-2025
  - ecb-t2-hours-roadmap-2026
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Prévision de liquidité et stress 24/7

## 1. Forecast horizon

Horizons utiles :
- 5 min ;
- 15 min ;
- 30 min ;
- 60 min ;
- end of constrained funding window ;
- weekend/holiday horizon.

## 2. Inputs

- current balance ;
- incoming/outgoing rate ;
- day of week ;
- month/day ;
- salary/payment cycles ;
- merchant peaks ;
- public holidays ;
- campaigns ;
- routing changes ;
- incidents ;
- historical percentiles.

## 3. Deterministic baseline

Commencer simple :

~~~text
forecast = recent trend
         + known scheduled effects
         + safety percentile
~~~

ML est optionnel.

## 4. Safety buffer

Le buffer absorbe :
- forecast error ;
- burst ;
- temporary funding outage ;
- route shift ;
- recovery storm.

Trop faible :
- rejects/outage.

Trop élevé :
- fragmentation/idle liquidity.

## 5. Weekend profile

Instant payments continuent.

Plan :
- Friday/weekend opening balance ;
- Saturday e-commerce ;
- Sunday behavior ;
- Monday morning transition ;
- holidays.

## 6. T2 operating-hours evolution

Les travaux Eurosystème 2026 identifient la gestion de liquidité des instant payments comme un moteur d'extension des heures T2.

Conclusion :
- les procédures actuelles suivent les heures actuelles ;
- l'architecture future doit être adaptable ;
- une roadmap n'est pas une capacité déjà en production.

## 7. Stress tests

### Volume surge
Outgoing x5.

### Inflow collapse
Incoming drops 80%.

### Route migration
Traffic switches to one settlement position.

### Funding unavailable
No planned rebalance for N hours.

### Operator error
Large defund.

### Data stale
Balance feed delayed.

### Combined
Peak + funding outage + high rejects.

## 8. Test outputs

Mesurer :
- minimum balance ;
- time to warning ;
- time to critical ;
- rejected payments ;
- required emergency funding ;
- operator actions ;
- recovery time.

## 9. Forecast quality

Metrics :
- MAE/MAPE where meaningful ;
- underforecast frequency ;
- worst error ;
- bias ;
- peak miss.

Business metric :
- number of liquidity-driven rejects.

## 10. Auto-rebalance

Guardrails :
- approved target corridor ;
- maximum transfer ;
- rate limit ;
- stop on stale data ;
- stop on abnormal route state ;
- audit.

## 11. Treasury SLO

SLIs possibles :
- balance freshness ;
- forecast freshness ;
- threshold alert latency ;
- successful rebalance latency.

Aucune valeur production n'est inventée.

## 12. Capacity link

La capacité paiement est bornée par :
- TPS technique ;
- fonds disponibles.

Un performance test sans liquidity model est incomplet.

## 13. Incident mode

Pendant incident :
- augmenter buffer si possible ;
- réduire mouvements non essentiels ;
- coordonner routing ;
- protéger visibility ;
- suspendre automation risquée.

## 14. Governance

Forecast model change :
- version ;
- backtest ;
- approval ;
- monitored rollout ;
- rollback.

## 15. Audit

Pour un incident liquidité, préserver :
- balances ;
- forecasts ;
- alerts ;
- transfers ;
- payment rejects ;
- routing decisions ;
- operator actions.

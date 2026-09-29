---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - eba-clearing-rt1
  - eba-clearing-rt1-pfmi
  - eba-clearing-rt1-access
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# RT1 — position de liquidité et contrôle

## Position par participant

Le modèle public RT1 décrit une funds balance par participant.

Chaque paiement :

- débite la position du sender ;
- crédite celle du receiver ;
- ne peut pas faire passer la position du sender sous zéro.

## Backing central bank funds

Les fonds sont adossés au modèle de central-bank funds du système via le compte technique applicable dans TIPS.

Conséquence :

- la position RT1 n'est pas une simple ligne comptable locale ;
- elle doit être réconciliée avec le système.

## Funding

~~~text
Treasury
→ liquidity instruction
→ RT1/TIPS model
→ participant position increases
~~~

Defunding :

~~~text
participant position
→ approved withdrawal
→ target liquidity account
~~~

## 24/7

EBA CLEARING décrit une gestion de liquidité 24/7.

Operations :

- monitoring continu ;
- support ;
- alerts ;
- transfer controls ;
- provider availability if serviced.

## Liquidity serviced participant

If using a liquidity provider :

- provider executes/manages funding ;
- participant needs visibility ;
- SLA ;
- threshold agreement ;
- fallback ;
- DORA supplier mapping.

## Position threshold

Référence :

- target ;
- warning ;
- critical ;
- minimum operational buffer.

Ne pas exploiter normalement à zéro.

## Inflow/outflow

Projected position :

~~~text
current balance
+ expected incoming
- expected outgoing
- safety buffer
= projected available
~~~

Prévoir une bande d'incertitude.

## Route concentration

Si un autre CSM est indisponible, le volume RT1 peut augmenter.

Treasury et routing engine doivent partager :

- route shift ;
- volume forecast ;
- remaining buffer.

## Reject due to liquidity

Le classer séparément de :

- beneficiary reject ;
- validation reject ;
- technical timeout.

Il doit déclencher treasury/operations, pas blind application retry.

## Serviced model failure

Cas :

- liquidity provider unavailable ;
- provider funds late ;
- connectivity provider OK but no funds ;
- threshold feed stale.

Il faut une supervision indépendante du participant.

## Reconciliation

Rapprocher :

- local payment values ;
- RT1 participant position changes ;
- external reports ;
- treasury transfers.

## Stress test

Scénarios :

- 5x outflow ;
- no incoming ;
- route failover ;
- provider outage ;
- erroneous oversized defund ;
- stale balance feed.

## Controls

- max transfer ;
- min retained buffer ;
- four-eyes above threshold ;
- no negative target position ;
- alert on rapid depletion ;
- independent reconciliation.

## Metrics

- balance ;
- value sent/received ;
- projected 15/30/60 min ;
- funding amount ;
- rejected due liquidity ;
- provider latency ;
- time below warning threshold.

## Architecture lesson

Real-time settlement transforme la trésorerie d'un sujet fin de journée en dépendance opérationnelle continue.

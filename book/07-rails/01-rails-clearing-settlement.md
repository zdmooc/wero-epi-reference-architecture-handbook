---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - ecb-tips-overview
  - ecb-target-shared-features
  - eba-clearing-rt1
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Partie VI — Rails, clearing, routing et settlement

## 1. Le vocabulaire qui évite les erreurs

### Scheme
Règles communes du paiement.

### Messaging
Format des messages.

### CSM
Mécanisme de clearing et settlement au sens large du marché / scheme.

### Routing
Choix du chemin vers le participant cible.

### Settlement
Transfert de l'actif de règlement qui éteint l'obligation correspondante selon le système.

### Rail
Terme d'architecture pratique qui regroupe un chemin de traitement. Il doit toujours être précisé par le nom réel de l'infrastructure.

## 2. Pile conceptuelle

```text
Wero experience
      |
SCT Inst scheme
      |
ISO 20022
      |
routing / CSM
      |
settlement infrastructure
      |
central-bank liquidity
```

## 3. TIPS

La BCE décrit TIPS comme la plateforme Eurosystème de settlement instantané :
- en temps réel ;
- 24/7/365 ;
- en monnaie banque centrale ;
- final et irrévocable ;
- avec Dedicated Cash Accounts pour les participants directs.

### Vue conceptuelle

```text
PSP A DCA
   |
   | instant payment
   v
TIPS
   |
   v
PSP B DCA
```

La technique réelle inclut davantage de rôles et de modes d'accès ; le livre conserve cette vue pour expliquer la finalité.

## 4. RT1

EBA CLEARING décrit RT1 comme :
- un système pan-européen ;
- real-time gross settlement ;
- SCT Inst / OCT Inst ;
- 24/7 ;
- settlement avec des fonds banque centrale immédiatement disponibles ;
- interopérable avec d'autres CSM SCT Inst.

La distinction pédagogique correcte n'est donc pas :

```text
TIPS = central bank money
RT1  = commercial bank money
```

Cette représentation serait fausse.

## 5. Relation RT1 / TIPS

EBA CLEARING décrit des options de settlement TIPS incluant :
- DCA TIPS ;
- modèle utilisant l'AS technical account pour RT1/TIPS.

L'architecture doit donc séparer :
- processing/routing RT1 ;
- funding model ;
- settlement account arrangement ;
- TIPS connectivity.

## 6. T2 / TARGET Services

TARGET Services partagent un modèle de gestion centralisée de liquidité.

La BCE décrit :
- Main Cash Account ;
- Central Liquidity Management ;
- Dedicated Cash Accounts liés aux services ;
- transferts de liquidité entre composants.

T2 ne doit pas être dessiné comme « le même système que TIPS ». Ils appartiennent à la famille TARGET Services mais ont des rôles distincts.

## 7. STET et autres CSM

Le livre inclut STET lorsqu'il est pertinent pour expliquer la reachability ou les architectures multi-CSM.

Règle :
- ne jamais supposer qu'une banque Wero utilise un CSM donné sans source ;
- modéliser une abstraction `InstantPaymentRailAdapter` ;
- documenter les particularités du CSM dans un adapter / profil de route.

## 8. Reachability

Le paiement ne dépend pas seulement de la présence du PSP payeur.

Il faut déterminer :
- comment le payee PSP est reachable ;
- quels participants sont directs/indirects ;
- quelles routes sont disponibles ;
- quelle règle choisit la route ;
- quelles fenêtres de maintenance existent ;
- comment gérer une route indisponible.

## 9. Multi-rail routing

Reference architecture :

```text
Payment
  |
Routing Policy
  |
  +--> Route A / TIPS
  +--> Route B / RT1
  +--> Route C / other SCT Inst CSM
```

Routing criteria possibles :
- reachability ;
- participant preference ;
- cost ;
- latency ;
- liquidity ;
- operational health ;
- bilateral agreements ;
- regulation/contract.

Le livre ne recommande pas un algorithme universel. Le choix est établissement-specific.

## 10. Rail adapter contract

Minimum :

```text
submit(payment)
getStatus(reference)
inquire(reference)
recall(reference, reason)
getReachability(participant)
getHealth()
```

Le contrat applicatif doit expliciter :
- idempotency ;
- retry ;
- timeout semantics ;
- authoritative status ;
- correlation.

## 11. Settlement finality

L'architecte doit identifier exactement le point de finalité applicable au rail.

Erreur :
- considérer la création du paiement comme settlement ;
- considérer l'acceptation technique comme settlement ;
- considérer le callback marchand comme settlement.

Il faut tracer l'évidence de l'infrastructure financière appropriée.

## 12. Failure matrix

| Failure | Impact possible | Recovery |
|---|---|---|
| route unavailable before submit | pas d'effet | reroute si autorisé |
| timeout after submit | UNKNOWN | inquiry |
| beneficiary unreachable | reject/route failure | rule-based |
| liquidity insufficient | no settlement | liquidity action |
| CSM degraded | delay/reject/unknown | failover/reroute selon contrat |
| local gateway down | backlog/no submit | HA/recovery |
| response path lost | local UNKNOWN | external status |

## 13. Active-active rail adapters

Deux instances d'adapter ne doivent pas signifier deux instructions financières.

Nécessaire :
- durable single logical intent ;
- fencing / claim ;
- unique external reference ;
- idempotent downstream contract si disponible ;
- reconciliation.

## 14. Rail observability

Metrics :
- submitted TPS ;
- accepted/rejected ;
- timeout rate ;
- UNKNOWN rate ;
- p50/p95/p99 latency ;
- route distribution ;
- reachability failures ;
- liquidity rejects ;
- investigation backlog.

## 15. Conclusion

Une architecture Wero correcte montre le rail explicitement, mais sans confondre rail, scheme, message et settlement. TIPS et RT1 doivent être étudiés selon leurs documents officiels, pas selon des raccourcis.

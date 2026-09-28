---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/wero-organisme-poc
  - zdmooc/dora-operational-resilience-architecture-masterbook
---

# Multi-AZ, multi-site et patterns DR

## 1. Failure domains

~~~text
process
pod
node
rack
zone
site
region
provider
~~~

Chaque niveau demande une protection différente.

## 2. Multi-node

Protège la perte d'un nœud seulement si :
- replicas distribuées ;
- storage disponible ;
- LB route ;
- dependencies survivantes.

## 3. Multi-AZ

Exige :
- workers répartis ;
- DB quorum ;
- broker distribution ;
- ingress ;
- storage topology ;
- network ;
- IAM ;
- secrets/HSM access.

## 4. Multi-site

Ajoute :
- WAN latency ;
- DNS/global routing ;
- data replication ;
- split brain ;
- operational ownership ;
- network providers.

## 5. Active/passive

~~~text
Site A ACTIVE
Site B STANDBY
~~~

Nécessite :
- data replication ;
- regular failover test ;
- warm capacity ;
- promotion runbook ;
- fencing A before B.

## 6. Active/active

Seulement si :
- ownership/sharding/consensus clair ;
- duplicate external effects prevented ;
- data model adapté.

Ne pas choisir pour prestige.

## 7. Cell architecture

Partitionner le trafic en cellules :
- independent app/data slice ;
- blast-radius control ;
- known ownership.

## 8. Global routing

Options :
- DNS ;
- global LB ;
- traffic manager.

Définir :
- health source ;
- TTL ;
- failover ;
- client cache behavior.

## 9. Site loss

Le test doit inclure :
- perte réseau site ;
- promotion data ;
- route clients ;
- rail connectivity depuis DR ;
- certificates ;
- HSM ;
- reconciliation.

## 10. External dependencies

Le site DR doit atteindre :
- CSM ;
- IAM ;
- fraud ;
- PKI/HSM ;
- observability ;
- third parties.

## 11. Capacity in DR

Un standby sous-dimensionné peut ne pas tenir le pic.

Définir :
- minimum critical capacity ;
- scale-up time ;
- degraded mode.

## 12. RTO decomposition

~~~text
detect
+ decide
+ fence
+ promote
+ route
+ warm
+ validate
+ reconcile
= business RTO
~~~

## 13. RPO decomposition

Par classe de données :
- payment DB ;
- ledger ;
- event broker ;
- audit ;
- config.

## 14. Failback

Étapes :
- stabilize ;
- resync ;
- prove consistency ;
- fence ;
- move traffic ;
- reconcile again.

## 15. Evidence

Le diagramme n'est pas une preuve.

La preuve contient :
- exercise date ;
- failure injected ;
- measured times ;
- data validation ;
- payment outcomes ;
- unresolved gaps.

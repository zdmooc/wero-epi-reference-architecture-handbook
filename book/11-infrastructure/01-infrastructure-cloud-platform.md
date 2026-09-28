---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/openshift-platform-blueprints
  - zdmooc/mayabank-instant-payments-resilience-platform
  - zdmooc/wero-organisme-poc
---

# Partie X — Infrastructure, Cloud, Kubernetes et OpenShift

## 1. Capability before platform

La documentation publique Wero n'établit pas qu'un participant utilise Kubernetes, OpenShift, Kafka ou une base particulière.

Cette partie décrit donc une architecture de déploiement professionnelle de référence.

## 2. Failure domains

Modéliser explicitement :

~~~text
process
pod
node
rack
network device
AZ / room
datacenter
site
region
cloud provider
external PSP
CSM
central service
~~~

Un PDB protège certaines interruptions volontaires. Il ne prouve ni HA de données, ni perte de zone.

## 3. Physical reference

~~~text
Region / Site A
  Zone 1
    ingress
    app workers
    data replica
  Zone 2
    ingress
    app workers
    data replica
  Zone 3
    ingress
    app workers
    data replica

Region / Site B
  recovery capacity
~~~

Le choix multi-zone/multi-site dépend de la latence, des exigences de cohérence, du RTO/RPO, du coût et de la localisation des données.

## 4. Stateless workload pattern

Pour API/services :
- replicas multiples ;
- topology spread ;
- anti-affinity ;
- startup/readiness/liveness probes ;
- requests/limits ;
- PDB ;
- autoscaling lorsque justifié ;
- NetworkPolicy ;
- ServiceAccount/workload identity ;
- image immutable par digest.

## 5. Stateful services

Pour DB, broker, IAM :
- replication mode ;
- quorum ;
- sync/async ;
- storage ;
- anti-affinity ;
- backup ;
- restore ;
- fencing ;
- rolling maintenance ;
- upgrade compatibility.

StatefulSet seul ne signifie pas HA.

## 6. Database HA

Référence :

~~~text
Primary
  | synchronous durability policy
  +--> Standby A
  |
  +--> Standby B
~~~

Pour un claim RPO=0 :
- définir les commits concernés ;
- définir le domaine de panne ;
- mesurer ;
- tester la perte réelle.

## 7. Split brain

Deux writers sont dangereux.

Contrôles possibles :
- quorum ;
- consensus ;
- lease ;
- STONITH/fencing ;
- witness ;
- storage fencing ;
- network isolation.

Principe :

~~~text
controlled unavailability
can be safer than
uncontrolled double-writer availability
~~~

## 8. Broker HA

Pattern :
- 3+ brokers selon produit ;
- replication factor ;
- min ISR/quorum ;
- zone awareness ;
- durable storage ;
- producer ack policy ;
- consumer recovery.

Les valeurs exactes dépendent du broker.

## 9. IAM HA

L'authentification client peut être critique.

Concevoir :
- plusieurs replicas ;
- session/cache cohérents ;
- DB HA ;
- key availability ;
- token verification ;
- rotation ;
- degraded-mode explicite.

Jamais de bypass silencieux de SCA pour “sauver la disponibilité”.

## 10. Ingress/router

Référence :
- multiples ingress/router instances ;
- zones distinctes ;
- public/internal separation ;
- TLS policy ;
- edge/re-encrypt/pass-through choisi consciemment.

## 11. Service mesh

Peut apporter :
- mTLS ;
- workload identity ;
- traffic policy ;
- telemetry.

Coûts :
- ressources ;
- complexité ;
- latence ;
- dépendance certificats ;
- nouvelles failure modes.

Il reste optionnel.

## 12. GitOps

~~~text
Git
→ review
→ CI validation
→ build / scan / sign
→ desired state
→ Argo CD or equivalent
→ cluster
~~~

Bénéfices :
- traceabilité ;
- drift detection ;
- reproductibilité ;
- rollback.

Secrets plaintext interdits.

## 13. Environnements

Typique :
- sandbox ;
- dev ;
- test ;
- preprod ;
- prod.

La prod ajoute :
- HA réel ;
- PKI réelle ;
- network réel ;
- secrets réels ;
- données gouvernées ;
- astreinte ;
- capacity ;
- DR.

“Manifest renders” n'est pas “production proven”.

## 14. Multi-AZ

Une plateforme n'est multi-AZ que si les dépendances critiques le sont aussi.

Vérifier :
- app ;
- DB ;
- broker ;
- ingress ;
- storage ;
- DNS ;
- HSM ;
- IAM ;
- egress ;
- observability.

## 15. Multi-region / multi-site patterns

### Active/passive

Un writer principal, un standby.

Avantages :
- cohérence plus simple.

Risques :
- failover time ;
- capacité dormante ;
- risque de bascule non fenced.

### Active/active

Deux sites actifs.

Avantages :
- disponibilité/localité.

Risques :
- conflicts ;
- cross-region coordination ;
- complexity.

### Cell architecture

Cellules isolées avec partitionnement contrôlé du trafic et des données.

Objectif :
- blast radius limité ;
- scaling par cellule.

## 16. Backup, HA et DR

~~~text
HA
= continuité face à panne composant

Backup
= restauration de données

DR / PRA
= restauration du service après sinistre majeur
~~~

Trois capacités différentes.

## 17. PITR

Protège contre :
- erreur opérateur ;
- corruption logique ;
- certains scénarios cyber.

Après restore, un système paiement doit souvent réconcilier avec les sources externes avant de reprendre comme writer.

## 18. Cyber recovery

Controls :
- backups immutables ;
- credentials séparés ;
- isolation ;
- clean-room ;
- scanning ;
- restore tests ;
- rotation des secrets/clés ;
- reconciliation.

## 19. Supply chain

Pipeline :
- secret scan ;
- SAST ;
- SCA ;
- IaC scan ;
- container scan ;
- SBOM ;
- signature ;
- provenance ;
- admission policy ;
- vulnerability management.

## 20. Capacity planning

Mesurer :
- CPU ;
- memory ;
- threads ;
- DB connections ;
- DB IOPS ;
- broker throughput ;
- network ;
- storage ;
- HSM sessions ;
- ingress connections.

Dimensionner sur peak + failure headroom, pas sur moyenne.

## 21. Autoscaling

HPA peut aider les workloads stateless mais :
- DB/broker ne scalent pas instantanément ;
- fraud service peut devenir bottleneck ;
- scale-up tardif peut rater le budget SCT Inst ;
- retry storms peuvent déclencher un scaling inutile.

Prévoir warm capacity.

## 22. Rolling upgrades

Un service 24/7 nécessite :
- backward/forward compatibility ;
- schema evolution ;
- connection draining ;
- PDB ;
- canary/progressive delivery ;
- rollback.

## 23. Local lab evidence

OpenShift Local/CRC prouve utilement :
- pod behavior ;
- APIs ;
- Kafka/Outbox ;
- observability ;
- application recovery.

Il ne prouve pas :
- perte worker ;
- multi-zone ;
- region loss ;
- production capacity ;
- contractual RTO/RPO.

## 24. Cloud neutrality

Reference architecture separates:
- business ;
- platform capability ;
- implementation.

Mapping possible :
- Kubernetes managed ;
- OpenShift ;
- private cloud ;
- on-prem.

Le livre ne transforme pas Azure, OpenShift ou un autre produit en exigence Wero.

## 25. Conclusion

La plateforme doit rendre les failure domains explicites, éviter les single points invisibles et démontrer les claims de résilience par des tests correspondant au domaine de panne annoncé.

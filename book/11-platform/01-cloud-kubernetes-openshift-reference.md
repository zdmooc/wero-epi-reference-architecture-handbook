---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/openshift-platform-blueprints
  - zdmooc/wero-organisme-poc
---

# Infrastructure, Cloud, Kubernetes et OpenShift

## 1. Provider-neutral first

Le paiement ne dépend pas conceptuellement d'un produit de conteneur.

Capabilities :
- scheduling ;
- service discovery ;
- ingress ;
- secrets ;
- autoscaling ;
- isolation ;
- persistent storage ;
- health management ;
- deployment ;
- policy ;
- observability.

OpenShift/Kubernetes est une implémentation de ces capabilities.

## 2. Cluster architecture

```text
External LB
  |
Ingress / Router replicas
  |
API Gateway
  |
Services
  |
+-------------+--------------+
| DB          | Kafka        |
| IAM         | Observability|
+-------------+--------------+
```

## 3. Namespaces

Séparer :
- application ;
- data ;
- observability ;
- security ;
- GitOps ;
- platform services.

Séparation par environnement selon stratégie plateforme.

## 4. Workload types

- Deployment : stateless ;
- StatefulSet/Operator CR : stateful lorsque pertinent ;
- Service ;
- Route/Ingress ;
- ConfigMap ;
- Secret ;
- PVC ;
- Job/CronJob.

## 5. Availability controls

- replicas ;
- topology spread ;
- anti-affinity ;
- PodDisruptionBudget ;
- readiness/liveness/startup probes ;
- HPA ;
- requests/limits ;
- priority class si justifiée.

## 6. PDB n'est pas HA

Un PDB protège certaines évictions volontaires. Il ne garantit pas :
- zone survival ;
- DB consistency ;
- external LB ;
- network path ;
- storage survival.

## 7. Multi-AZ

Pour revendiquer multi-AZ :
- workers réellement répartis ;
- storage topology compatible ;
- DB replicas réparties ;
- broker racks/zones ;
- ingress réparti ;
- dependencies réparties ;
- test de perte zone exécuté.

## 8. Database HA

Questions :
- single writer ?
- sync/async replica ?
- quorum ?
- fencing ?
- automatic promotion ?
- backup/PITR ?
- split brain ?
- failback ?

## 9. Kafka HA

Minimum conceptuel :
- >=3 brokers lorsque la tolérance recherchée le nécessite ;
- replication factor adapté ;
- min ISR ;
- rack/zone awareness ;
- secure listeners ;
- monitoring ;
- recovery.

Le nombre exact dépend du workload et des objectifs.

## 10. IAM HA

L'IAM est critique mais son indisponibilité ne doit pas systématiquement tuer les transactions déjà correctement authentifiées si le modèle de sécurité permet un mode dégradé sûr.

À décider explicitement :
- token lifetime ;
- JWK cache ;
- session ;
- revocation ;
- new-login dependency.

## 11. GitOps

```text
Git
→ pull request
→ validation
→ desired state
→ Argo CD
→ cluster
→ drift reconciliation
```

Règles :
- secrets hors Git ;
- promotion d'image par digest ;
- env overlays ;
- rollback ;
- policy gates.

## 12. Progressive delivery

Canary/blue-green peut réduire le risque, mais un service financier stateful ou un changement de schéma nécessite une stratégie de compatibilité spécifique.

## 13. Backup / PITR

Backup n'est pas HA.

HA :
- continuité.

Backup/PITR :
- récupération après corruption/suppression/cyber incident.

Les deux sont obligatoires pour un service critique.

## 14. Multi-region / multi-site

Options :

### Active / passive
- one writer ;
- hot/warm standby ;
- simpler consistency ;
- explicit promotion/fencing.

### Active / active
- higher complexity ;
- conflict/consensus/data ownership ;
- network partition ;
- duplicated external side effects.

Le livre ne présume jamais que active/active est « meilleur ».

## 15. CRC evidence boundary

OpenShift Local mono-nœud :
- excellent pour comportement app, deployment, GitOps, probes, pod recovery ;
- ne prouve pas worker loss ;
- ne prouve pas AZ ;
- ne prouve pas multi-site ;
- ne prouve pas throughput production.

## 16. Cloud

Cloud architecture must include:
- IAM ;
- network ;
- private connectivity ;
- KMS/HSM ;
- logs ;
- backup ;
- DR ;
- region constraints ;
- FinOps ;
- sovereignty / supplier risk ;
- exit strategy.

## 17. Production readiness

Gate :
- NFR ;
- failure domains ;
- capacity ;
- security ;
- evidence ;
- runbooks ;
- ownership ;
- observability ;
- backup restore ;
- DR exercise ;
- supply-chain security.

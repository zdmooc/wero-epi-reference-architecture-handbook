---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - eu-dora-2022-2554
related_internal_repos:
  - zdmooc/dora-operational-resilience-architecture-masterbook
  - zdmooc/mayabank-instant-payments-resilience-platform
  - zdmooc/wero-organisme-poc
---

# Partie XII — Résilience opérationnelle et DORA

## 1. Disponibilité ≠ résilience

~~~text
Availability
= service répond

Resilience
= service absorbe, récupère, réconcilie et apprend d'une perturbation
tout en préservant l'issue métier critique
~~~

Pour un paiement, l'issue critique inclut :
- pas de double paiement incontrôlé ;
- pas de perte silencieuse ;
- vérité réconciliable ;
- récupération contrôlée ;
- preuve exploitable.

## 2. Baseline DORA

Le règlement (UE) 2022/2554 s'applique depuis le 17 janvier 2025.

Lecture architecture :
- gouvernance ;
- ICT risk management ;
- incident management/classification/reporting ;
- digital operational resilience testing ;
- ICT third-party risk ;
- oversight context ;
- information sharing.

DORA ne prescrit pas un produit.

## 3. Level 2 measures

La Commission et les ESAs maintiennent un ensemble d'actes délégués/implémentation et standards techniques couvrant notamment :
- ICT risk management framework ;
- incident classification ;
- major incident reporting ;
- register of information ;
- ICT third-party policy ;
- subcontracting pour fonctions critiques/importantes ;
- TLPT.

Règle éditoriale :
la page Commission DORA “implementing and delegated acts” est la source d'inventaire à revalider à chaque édition.

## 4. Critical Business Service

Commencer par le service, pas les serveurs.

~~~text
Execute Instant Payment
    |
Business Process
    |
Applications
    |
Data / Integration
    |
IAM / PKI / HSM
    |
Network
    |
Platform / DB / Broker
    |
PSP / CSM / Third Parties
~~~

## 5. BIA

Questions :
- impact après 10 s ?
- 1 min ?
- 15 min ?
- 1 h ?
- 4 h ?
- 1 jour ?
- pertes financières ?
- clients affectés ?
- obligations ?
- backlog settlement ?
- fraude ?

Outputs :
- criticality ;
- RTO ;
- RPO ;
- minimum service level ;
- dependencies ;
- recovery priorities.

## 6. RTO

RTO = délai cible de restauration.

Toujours préciser :
- service ;
- failure domain ;
- start event ;
- end event ;
- degraded/full service.

Exemple utile :
Payment API RTO <= 60 s pour perte d'un pod.

Exemple inutile :
RTO = 0 sans contexte.

## 7. RPO

RPO = fenêtre de perte de données acceptable.

Dans le paiement, distinguer :
- orchestration ;
- ledger ;
- events ;
- audit ;
- analytics.

Une transaction peut être réglée à l'extérieur alors que l'état local est perdu. Le RPO DB et la vérité financière ne sont donc pas la même chose.

## 8. Failure domains

Catalogue :
- process ;
- pod ;
- node ;
- rack ;
- storage ;
- DB primary ;
- broker ;
- IAM ;
- DNS ;
- certificate ;
- HSM ;
- network ;
- CSM ;
- PSP externe ;
- datacenter ;
- site ;
- region ;
- third party.

## 9. Active/passive

~~~text
Site A = writer
Site B = warm standby
~~~

Critique :
- replication ;
- fencing ;
- promotion ;
- traffic switch ;
- reconciliation ;
- failback.

## 10. Active/active

Plus complexe :
- partitionnement ou global consistency ;
- ownership d'un payment ;
- idempotency ;
- conflict avoidance ;
- cross-region latency ;
- split-brain control.

## 11. Cell architecture

Cellules indépendantes avec trafic et données contrôlés.

Avantages :
- blast radius ;
- scaling ;
- isolation.

Challenge :
- routing ;
- global identity ;
- cross-cell operation ;
- reconciliation.

## 12. Fencing

Avant promotion d'un nouveau writer :

**prouver que l'ancien writer ne peut plus produire d'effet financier.**

Mechanisms possibles :
- lease/quorum ;
- storage fencing ;
- network isolation ;
- DB consensus ;
- cloud API ;
- operator-controlled cut.

## 13. Degraded modes

Acceptables selon design :
- notifications retardées ;
- analytics indisponible ;
- enrollment temporairement fermé ;
- callback marchand retardé avec status API disponible.

Inacceptables :
- bypass SCA ;
- idempotency désactivée ;
- UNKNOWN converti arbitrairement en SUCCESS ;
- deux writers non fenced.

## 14. Reconciliation after incident

Question centrale :

**Le paiement a-t-il réellement eu lieu ?**

Runbook :
1. stopper les retries dangereux ;
2. extraire intents locaux ;
3. extraire statuts externes ;
4. comparer ledger ;
5. classer discrepancies ;
6. réparer l'état local ;
7. notifier ;
8. conserver evidence.

## 15. Chaos engineering

Un test de chaos doit avoir une hypothèse.

Exemple :

~~~text
Given payment committed locally
When event broker becomes unavailable
Then payment remains committed
And Outbox remains pending
And after recovery event is published
And no second financial payment is created
~~~

## 16. Companion lab evidence

Le flagship du portefeuille documente dans son scope CRC mono-nœud des preuves runtime pour :
- idempotent replay ;
- UNKNOWN/reconciliation ;
- Outbox/Kafka recovery ;
- Inbox deduplication ;
- webhook retry/dedup ;
- refunds ;
- application correlation ;
- pod replacement ;
- Consumer/Acceptor ;
- external inquiry simulator ;
- C2B merchant status recovery ;
- service-to-service security ;
- business observability ;
- chaos scenarios.

Ce sont des preuves de pattern dans ce lab, pas des preuves de topologie Wero/EPI ou de multi-AZ.

## 17. Resilience test ladder

~~~text
unit fault
→ process fault
→ pod fault
→ dependency fault
→ network fault
→ node fault
→ AZ fault
→ site fault
→ cyber recovery
→ third-party outage
~~~

## 18. Third-party risk

Cartographier :
- provider ;
- service ;
- critical/important function support ;
- subcontractors ;
- location ;
- data ;
- concentration ;
- exit ;
- recovery dependency ;
- SLA ;
- evidence.

## 19. Exit strategy

Pour chaque provider critique :
- export data ;
- format ;
- migration duration ;
- alternative ;
- skills ;
- licensing ;
- DNS/cert migration ;
- test environment ;
- trigger ;
- decision authority.

Une stratégie de sortie non testée reste une hypothèse.

## 20. Incident classification/reporting

Les standards techniques DORA harmonisent classification et reporting.

Conséquence architecture :
- timestamps fiables ;
- services affectés identifiables ;
- volumes/clients impactés calculables ;
- cause/failure domain traçable ;
- evidence retenue.

## 21. Major incident reporting

Les standards techniques publiés précisent le contenu, les templates et des délais de reporting.

Le système d'incident management doit donc être capable de produire rapidement :
- detection time ;
- classification time ;
- scope ;
- impact ;
- service restoration status ;
- cause/current hypothesis ;
- mitigation ;
- third-party involvement.

## 22. TLPT

Threat-Led Penetration Testing pour les entités concernées.

Préparation :
- critical functions ;
- realistic scope ;
- third-party coordination ;
- production safeguards ;
- remediation ;
- evidence.

Generic pentest ≠ TLPT.

## 23. Register of Information

Architecture inputs :
- provider ;
- contract ;
- service ;
- entity/function supported ;
- subcontracting ;
- location ;
- dates ;
- criticality.

Il faut aligner EAM/CMDB/procurement/legal data pour éviter un registre manuel divergent.

## 24. DORA evidence model

~~~text
obligation
→ control objective
→ architecture capability
→ implementation
→ test
→ evidence
→ owner
→ remediation
~~~

## 25. Resilience evidence matrix

| Claim | Design | CI | Runtime | Production |
|---|---:|---:|---:|---:|
| Pod self-healing | oui | oui | lab | target |
| Node HA | oui | render | multi-node required | target |
| AZ HA | oui | static | multi-AZ required | target |
| RPO=0 | design | config | failure test | contractual |
| Site DR | runbook | checks | exercise | periodic |

## 26. NIS2 / DORA

Le livre documente les deux cadres mais ne déclare pas l'applicabilité juridique individuelle d'une entité.

Pour les entités financières, vérifier les interactions et la lex specialis avec les textes et autorités compétentes.

## 27. Conclusion

La résilience opérationnelle relie correctness paiement, infrastructure, réseau, incident management, third parties et preuve réglementaire. Elle ne se résume ni à Kubernetes, ni à un deuxième datacenter.

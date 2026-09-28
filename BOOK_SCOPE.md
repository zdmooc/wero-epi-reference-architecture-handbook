# Book Scope — Wero & EPI Reference Architecture Handbook

## 1. Ambition

Construire une référence professionnelle vivante 2026→2031 sur Wero/EPI et l'architecture de bout en bout des paiements instantanés européens.

Le livre doit répondre simultanément à quatre questions :

1. **Que se passe-t-il fonctionnellement ?**
2. **Quels composants et flux réalisent le paiement ?**
3. **Sur quels réseaux, infrastructures et rails le paiement circule-t-il et se règle-t-il ?**
4. **Comment rendre cette chaîne sûre, observable, résiliente, conforme et exploitable 24/7/365 ?**

## 2. Périmètre obligatoire

### Wero / EPI
- histoire, contexte et positionnement ;
- acteurs et responsabilités ;
- P2P, C2B, e-commerce, m-commerce, POS, QR, NFC lorsque documenté ;
- Consumer PSP / Acceptor PSP ;
- merchant journeys ;
- consentement, authentification, statut, refund, return, recall, dispute ;
- évolution et interopérabilité européenne.

### Paiement instantané
- SCT Inst ;
- cycle de vie ;
- règles de temps ;
- statuts ;
- exceptions ;
- investigation ;
- idempotence ;
- transaction UNKNOWN ;
- réconciliation.

### ISO 20022
- modèle ;
- pacs.008 ;
- pacs.002 ;
- pacs.004 ;
- pacs.028 ;
- camt.029 ;
- camt.052/053/054/056 ;
- pain lorsque pertinent ;
- Business Application Header ;
- identifiants de corrélation et de bout en bout ;
- exemples XML annotés.

### Rails, clearing, settlement et liquidité
- CSM ;
- TIPS ;
- RT1 ;
- STET lorsque pertinent ;
- T2 / TARGET Services ;
- reachability ;
- central bank money ;
- comptes et positions ;
- prefunding ;
- liquidity management ;
- week-end / jours fériés / 24/7/365.

### Réseaux
- Internet / mobile ;
- DNS ;
- CDN / anti-DDoS ;
- WAF ;
- load balancers ;
- reverse proxies ;
- API gateways ;
- firewalls ;
- segmentation et zones ;
- réseau bancaire privé / connectivité CSM ;
- TLS / mTLS ;
- PKI ;
- HSM ;
- dual connectivity ;
- latence, timeouts, perte de paquets, dépendances réseau ;
- flux Nord/Sud et Est/Ouest.

### Infrastructure / plateforme
- datacenter ;
- cloud ;
- multi-AZ / multi-région ;
- Kubernetes / OpenShift ;
- ingress ;
- service mesh lorsque pertinent ;
- Kafka / MQ ;
- bases transactionnelles ;
- cache ;
- stockage ;
- backup ;
- GitOps ;
- secrets ;
- observabilité.

### Données
- ledger ;
- journal d'audit ;
- payment state ;
- event store ;
- outbox/inbox ;
- reconciliation store ;
- données fraude ;
- directory / aliases ;
- rétention ;
- cohérence ;
- RPO ;
- chiffrement.

### Sécurité
- IAM ;
- SCA ;
- OAuth2 / OIDC ;
- workload identity ;
- certificats ;
- HSM ;
- key lifecycle ;
- tokenisation ;
- fraude ;
- AML/CFT ;
- sanctions ;
- VoP ;
- Zero Trust ;
- secrets management.

### Résilience
- HA ;
- PRA / PCA ;
- RTO / RPO ;
- active/active et active/passive ;
- quorum et fencing ;
- split-brain ;
- modes dégradés ;
- chaos engineering ;
- perte pod/node/AZ/site/région ;
- perte DB/Kafka/HSM/DNS/PKI/CSM ;
- duplicate / replay ;
- UNKNOWN ;
- recovery et reconciliation ;
- failback.

### Exploitation / SRE
- SLI/SLO/SLA ;
- latency budgets ;
- p95/p99/p99.9 ;
- capacity planning ;
- saturation ;
- dashboards ;
- alerting ;
- tracing ;
- runbooks ;
- incident management ;
- post-mortem ;
- release / rollback ;
- production readiness.

### Réglementation européenne
- Instant Payments Regulation ;
- EPC SCT Inst Rulebook et Implementation Guidelines ;
- DORA + RTS/ITS ;
- PSD2 et trajectoire PSD3/PSR selon état juridique ;
- RGPD ;
- AML/CFT ;
- sanctions ;
- Verification of Payee ;
- eIDAS2 lorsque pertinent ;
- NIS2 uniquement lorsque son articulation est réellement applicable ;
- TIBER-EU / TLPT.

## 3. Ce que le livre ne doit jamais faire

- inventer l'architecture interne d'EPI/Wero ;
- confondre Wero, SCT Inst, ISO 20022, CSM et settlement ;
- présenter une architecture de référence comme une architecture officielle ;
- utiliser un POC comme preuve de conformité ;
- donner une version réglementaire sans date ni source ;
- présenter un comportement de rail comme universel sans citer la règle applicable ;
- présenter une latence de lab comme SLA de production.

## 4. Durée de vie

Le livre est conçu pour cinq ans avec :

- version majeure annuelle ;
- mises à jour mineures lors de changements EPC/EPI/BCE/EBA/UE significatifs ;
- changelog ;
- statut de vérification par chapitre ;
- date de dernière revue ;
- sources primaires.

## 5. Public cible

Priorité :
1. architectes paiement et solution ;
2. architectes réseau / infrastructure / cloud ;
3. SRE / production / résilience ;
4. sécurité / IAM / DORA ;
5. consultants et responsables de transformation.

Le livre doit rester accessible à un lecteur expérimenté qui ne connaît pas encore Wero, tout en restant suffisamment profond pour servir de référence à un architecte paiement.

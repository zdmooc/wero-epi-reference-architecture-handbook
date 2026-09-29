# Wero & EPI — Reference Architecture Handbook

> **Living reference handbook — 2026→2031**  
> Architecture métier, fonctionnelle, applicative, données, API, événements, réseau, infrastructure, sécurité, résilience, rails de paiement, règlement, liquidité et réglementation européenne.

## Mission

Ce dépôt est la **source éditoriale maître** d'un ouvrage professionnel consacré à Wero / EPI et à l'architecture de bout en bout des paiements instantanés européens.

L'objectif n'est **pas** de viser un nombre arbitraire de pages. L'objectif est de construire un ouvrage de référence durable, maintenu pendant cinq ans, capable d'expliquer le paiement depuis l'expérience client jusqu'au règlement interbancaire et à la résilience opérationnelle.

Le livre doit être utile à plusieurs profils :

- architecte solution / transverse ;
- architecte paiement ;
- architecte infrastructure / réseau ;
- architecte sécurité ;
- SRE / production ;
- RSSI / IAM ;
- équipes DORA / résilience opérationnelle ;
- banque, PSP, acquéreur, marchand ;
- consultant transformation des paiements.

## Positionnement

Titre de travail :

**Wero & EPI — Architecture de Référence des Paiements Européens**

Sous-titre de travail :

**Paiements instantanés, ISO 20022, SCT Inst, TIPS, RT1, réseaux, cloud, sécurité, résilience et réglementation européenne**

Ce dépôt n'est ni une documentation officielle EPI/Wero, ni une reproduction d'une architecture interne d'un établissement. Les architectures non publiquement documentées sont présentées comme **REFERENCE_ARCHITECTURE** ou **INFERRED**, jamais comme des faits internes.

## Principe éditorial

Chaque sujet important doit être expliqué sous plusieurs vues :

1. **Business** — acteurs, responsabilité, chaîne de valeur.
2. **Fonctionnelle** — consentement, initiation, authentification, exécution, confirmation, remboursement, recall, dispute.
3. **Applicative** — wallet, EPI/Wero, PSP, Payment Hub, fraude, VoP, core banking, gateway SCT Inst.
4. **Flux** — REST/JSON, webhook, événements, ISO 20022, flux synchrones/asynchrones.
5. **Réseau** — Internet, DNS, anti-DDoS, WAF, LB, API Gateway, firewall, proxies, zones, interconnexions bancaires.
6. **Infrastructure** — datacenters, zones, régions, Kubernetes/OpenShift, Kafka, databases, cache, stockage.
7. **Rails de paiement** — SCT Inst, CSM, TIPS, RT1, reachability, clearing, settlement.
8. **Liquidité** — comptes de règlement, positions, prefunding, disponibilité 24/7/365.
9. **Sécurité** — IAM, SCA, OAuth2/OIDC, TLS/mTLS, PKI, HSM, secrets.
10. **Résilience** — HA, PRA/PCA, RTO/RPO, failover/failback, transaction UNKNOWN, réconciliation.
11. **Observabilité / Run** — logs, metrics, traces, SLI/SLO, capacity, runbooks.
12. **Réglementation** — SCT Inst Rulebook, Instant Payments Regulation, DORA, PSD2/PSD3/PSR, RGPD, AML/CFT, sanctions, VoP.

## Couches à ne jamais confondre

```text
┌──────────────────────────────────────────┐
│ EXPERIENCE / WALLET                     │  Wero
├──────────────────────────────────────────┤
│ PAYMENT PRODUCT / SCHEME                 │  Wero rules + SCT Inst context
├──────────────────────────────────────────┤
│ MESSAGE STANDARD                         │  ISO 20022
├──────────────────────────────────────────┤
│ CLEARING / ROUTING                       │  CSM
├──────────────────────────────────────────┤
│ SETTLEMENT                               │  TIPS / RT1 mechanisms
├──────────────────────────────────────────┤
│ LIQUIDITY                                │  central-bank liquidity / positions
├──────────────────────────────────────────┤
│ NETWORK / CONNECTIVITY                   │  Internet + banking connectivity
├──────────────────────────────────────────┤
│ PHYSICAL / CLOUD INFRASTRUCTURE          │  DC / cloud / K8s / OpenShift
└──────────────────────────────────────────┘
```

## Règle de vérité

Chaque affirmation technique ou réglementaire doit être classée :

- **PUBLIC_VERIFIED** — confirmé par une source primaire ou officielle ;
- **REFERENCE_ARCHITECTURE** — architecture proposée dans cet ouvrage ;
- **INFERRED** — déduction raisonnable, explicitement signalée ;
- **RUNTIME_PROVEN** — démontré dans un lab exécutable avec preuve ;
- **TO_BE_VERIFIED** — information à confirmer avant publication.

```text
PUBLIC_VERIFIED ≠ REFERENCE_ARCHITECTURE ≠ INFERRED ≠ RUNTIME_PROVEN
```

Aucune architecture interne Wero/EPI non publique ne doit être présentée comme une certitude.

## Dépôts sources existants

Le livre réutilise sans les fusionner les référentiels suivants :

| Domaine | Dépôt | Rôle |
|---|---|---|
| Wero / Consumer / Acceptor | `zdmooc/wero-organisme-poc` | architecture Wero de référence, résilience, mission, lab historique |
| Payment Hub / ISO 20022 / rails | `zdmooc/payment-hub-iso20022-opf-reference` | ISO 20022, SCT Inst, TIPS, RT1, STET, T2, architecture paiement |
| Instant Payments executable lab | `zdmooc/mayabank-instant-payments-resilience-platform` | preuves runtime, idempotence, UNKNOWN, reconciliation, Kafka, OpenShift |
| DORA / Operational Resilience | `zdmooc/dora-operational-resilience-architecture-masterbook` | réglementation, BIA, RTO/RPO, tests, tiers ICT, exit strategy |
| OpenShift | `zdmooc/openshift-platform-blueprints` | patterns plateforme |
| Messaging / EDA | `zdmooc/mayabank-ibm-mq-native-ha-openshift-eda-platform` | MQ, HA, EDA |
| Kafka / DDD / OpenShift | `zdmooc/mayabank-kafka-ddd-openshift` | event-driven architecture |
| Enterprise Architecture | `zdmooc/archimate-3-2-foundation-practitioner-masterbook` | vues et modélisation |

Voir `sources/internal-repositories.yml`.

## Structure

```text
book/                 manuscrit source
diagrams/             Mermaid / PlantUML / Draw.io / SVG
sources/              sources officielles et registre de preuves
examples/             ISO 20022 / API / réseau / résilience
publishing/           règles de génération PDF/EPUB/print
governance/           règles éditoriales, qualité, vérité
CHANGELOG.md           évolution du livre
MASTER_TOC.md          sommaire maître
ROADMAP.md             roadmap 2026–2031
```

## Format de publication cible

Le manuscrit doit pouvoir produire :

- PDF professionnel couleur ;
- édition imprimée grand format adaptée aux diagrammes ;
- EPUB lorsque la mise en page le permet ;
- futures éditions versionnées.

Le nombre de pages restera une **conséquence du contenu**, pas une contrainte.

## État

**V1.0 MANUSCRIPT — READY_FOR_MANUSCRIPT_FREEZE ; contenu I1→I16 terminé, relecture structure/terminologie passée ; PDF/EPUB/print différés.**

Premiers éléments créés :

- cadrage éditorial ;
- sommaire maître ;
- gouvernance et règles de vérité ;
- modèle de travail GitHub + Drive ;
- cartographie des dépôts sources ;
- roadmap de mise à jour sur cinq ans ;
- stratégie de publication ;
- glossaire initial ;
- système de diagrammes ;
- préface ;
- Chapitre 1 — lecture en couches de Wero/EPI ;
- Chapitre 2 — anatomie de bout en bout d'un paiement ;
- Chapitre 3 — acteurs, responsabilités et frontières de confiance ;
- premier diagramme Mermaid maintenable.



## V1.0 — état de couverture

Le cycle **I1→I16** est terminé au niveau manuscrit :

- sources officielles et baseline publique ;
- Wero/EPI ;
- parcours P2P/C2B/e-commerce/POS ;
- architecture fonctionnelle ;
- ISO 20022 ;
- SCT Inst ;
- TIPS / RT1 / CSM ;
- settlement et liquidité ;
- réseaux et flux ;
- API / event-driven / data ;
- infrastructure / cloud / Kubernetes/OpenShift ;
- sécurité / IAM / fraude / VoP ;
- résilience / DORA ;
- SRE / exploitation ;
- architectures banque / PSP / marchand ;
- interopérabilité / Digital Euro ;
- tests et evidence ;
- réglementation ;
- annexes professionnelles ;
- chaîne de publication préparée mais non exécutée avant le freeze du manuscrit.

Voir :
- `AUDIT_V1.0.md`
- `governance/COVERAGE_MATRIX.md`
- `governance/V1_QUALITY_GATE.md`

Les artefacts **PDF, EPUB et print ne font pas partie de cette étape**. Ils seront produits uniquement après validation/freeze du manuscrit GitHub.



## État du manuscrit V1.0

Le programme I1→I16 est terminé au niveau **contenu GitHub**.

État éditorial vérifié au 29 septembre 2026 :
- 87 fichiers de chapitres canoniques ;
- 97 fichiers dans l'ordre canonique avec annexes/baseline ;
- 36 diagrammes Mermaid maintenables ;
- aucun chemin manquant dans `publishing/book-order.txt` ;
- sources primaires 2026 versionnées ;
- PDF/EPUB non générés à ce stade, conformément à la stratégie éditoriale.

Prochaine phase après le freeze éditorial :
`render SVG des 36 figures → mise en page/typographie → PDF → EPUB → proof papier → publication`.

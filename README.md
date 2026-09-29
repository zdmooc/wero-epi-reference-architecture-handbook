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

**V1.0 — PUBLISHED ; 87 chapitres techniques + note d’édition, 36/36 figures intégrées, PDF V1.0 + EPUB V1.0 validés et publiés dans la GitHub Release `v1.0`.**

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

Le manuscrit a ensuite été gelé puis les artefacts **PDF RC1 et EPUB RC1** ont été produits et validés. Le **print proof** et la release publique restent à décider.



## État du manuscrit V1.0

Le programme I1→I16 est terminé au niveau **contenu GitHub**.

État éditorial vérifié au 29 septembre 2026 :
- 87 fichiers de chapitres canoniques ;
- 97 fichiers dans l'ordre canonique avec annexes/baseline ;
- 36 diagrammes Mermaid maintenables ;
- aucun chemin manquant dans `publishing/book-order.txt` ;
- sources primaires 2026 versionnées ;
- PDF RC1 et EPUB RC1 générés et validés depuis le SHA gelé ; la V1.0 finale est désormais publiée.

État final numérique :
`relecture complète → front matter final → layout proof → freeze final → PDF/EPUB V1.0 → QA + checksums = PASS`.

Publication publique effectuée via GitHub Release `v1.0`.


Visual status — 2026-09-29:
- 8/8 Hero SVG artifacts rendered;
- 8/8 visually inspected;
- FIG-11, FIG-14 and FIG-15 corrected after visual QA;
- Hero gate: **HERO_SVG_QA_PASS**;
- 28/28 secondary figures rendered as SVG and passed vector/geometry QA;
- complete figure corpus: **36/36 SVG_SOURCE_QA_PASS**;
- next: chapter placement, captions/source notes and page-layout proof.


Figure integration status — 2026-09-29:
- 36/36 SVG figures embedded in canonical chapters;
- 34 target chapters;
- Quarto figure IDs + prose cross-references added;
- captions + truth/source/date notes added;
- 0 missing figure/chapter path;
- status: **FIGURE_CHAPTER_INTEGRATION_PASS**;
- étape suivante à ce moment-là : Quarto page-layout proof ; cette étape est désormais terminée.


Layout proof status — 2026-09-29:
- complete Quarto HTML render: PASS;
- complete A4 PDF proof render: PASS;
- 87 chapters / 36 figure IDs / 36 references / 36 embedded SVGs;
- 98 rendered HTML files;
- 0 unresolved figure references;
- 0 missing images;
- current proof: 446 pages A4;
- 0 TeX overfull boxes;
- 36 figure-bearing pages visually reviewed;
- FIG-13-004 corrected and revalidated;
- status: **LAYOUT_PROOF_PASS**.

Cette étape de proof a depuis été superseded par le build RC1 PDF/EPUB validé ci-dessous.


Final manuscript freeze — 2026-09-29:
- successful proof basis: GitHub Actions run `36551667995`;
- proof commit: `ca07815e51f708701f769265801edd99513c1174`;
- 0 render-sensitive changes after proof;
- freeze report: `governance/FINAL_MANUSCRIPT_FREEZE_V1_2026-09-29.md`;
- status: **FINAL_MANUSCRIPT_FREEZE**.

Publication PDF/EPUB V1.0 is now released.


Publication RC1 — 2026-09-29:
- frozen source: `357399fc7bc5dbaf48ae06d3b7e207a47c70193c`;
- PDF RC1: PASS — 446 A4 pages, 0 unresolved figure refs, 0 missing images, 0 overfull boxes;
- EPUB RC1: PASS — 101 XHTML, 36 SVG, 0 missing manifest resources, 0 broken internal links;
- PDF SHA-256: `51a6ceee2bc51b33c833510a58ac8bbe8d1e83ea24000109c2ffe12a269c5e23`;
- EPUB SHA-256: `aa4d61048820381bbcc219325bab43afa30dcb78e557e7c6fd725ecefe535331`;
- successful publication build run: `36558924392`;
- status: **PUBLICATION_RC1_PASS**.

The final V1.0 public GitHub Release has now been performed.


Final release readiness — 2026-09-29:
- RC1 PDF/EPUB QA complete;
- canonical publication metadata aligned in `publishing/metadata.yaml`;
- release-readiness matrix: `governance/FINAL_RELEASE_READINESS_V1.md`;
- print-proof checklist: `publishing/PRINT_PROOF_CHECKLIST_V1.md`;
- l’édition numérique retient désormais **Djamal Zidane — publication indépendante** comme imprint ;
- aucun ISBN n’est attribué à la première édition numérique ;
- la distribution cible est un GitHub Release, sans publication publique automatique ;
- la couverture retail/print et le print proof sont reportés à la filière papier.


Release-readiness decision gate — 2026-09-29:
- cover brief ready;
- back-cover copy draft ready;
- imprint/legal template ready;
- trademark/independence editorial wording prepared from official Wero/EPI public sources;
- print-proof checklist ready;
- final release decision matrix ready;
- ISBN / publisher / distribution / print format remain intentionally undecided;
- state: **DECISION_GATE — NOT PUBLICLY RELEASED**.


## V1.0 numérique finale — 2026-09-29

La finalisation est terminée :

- **87 chapitres techniques** relus de bout en bout ;
- **1 note d’édition / indépendance / droits** intégrée au front matter ;
- **36 figures** maintenables et intégrées ;
- proof final : run `36593144021` ;
- source finale gelée : `freeze/v1.0-digital-final-2026-09-29` ;
- SHA final : `705b13664d9c3783d3d05fae72269648c80bcee8` ;
- PDF final : **448 pages A4**, 0 xref non résolue, 0 overfull box ;
- EPUB final : **102 XHTML**, 36 SVG, 0 lien interne cassé, 0 ressource de manifest manquante ;
- build final : run `36593794049` — **PASS** ;
- PDF SHA-256 : `df2f77e93e10c73edf9331063976a1892d1bacb12c94e61be64bd2ac7c508bb0` ;
- EPUB SHA-256 : `3cf31e01b332c8601327cef9744cdf08c847ae109ae4236331cbda5fb9ac0fd6` ;
- imprint : **Djamal Zidane — publication indépendante** ;
- ISBN : **non attribué** pour cette première édition numérique ;
- canal cible : **GitHub Release** ;
- édition papier : **filière séparée et différée**.

Statut : **V1.0 FINAL DIGITAL BUILD PASS — NOT PUBLICLY RELEASED**.

Le seul acte restant est la création explicite de la release publique lorsque sa diffusion est autorisée.

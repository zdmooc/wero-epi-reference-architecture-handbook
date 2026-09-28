---
status: REVIEWED
last_verified: 2026-09-28
truth_level: PUBLIC_VERIFIED
primary_sources:
  - https://epicompany.eu/members/
  - https://epicompany.eu/media-insights/wero-next-now-e-commerce-accelerates-as-in-store-takes-its-first-steps/
  - https://epicompany.eu/media-insights/epi-initiates-wero-in-luxembourg/
  - https://support.wero-wallet.eu/hc/en-us/articles/46739121212177-What-is-Wero
related_internal_repos:
  - zdmooc/wero-organisme-poc
---

# Wero / EPI — écosystème public et trajectoire 2026

## 1. Positionnement

Wero est la solution de paiement portée par l'European Payments Initiative (EPI). Pour l'architecte, il faut éviter deux raccourcis :

- Wero n'est pas simplement une interface graphique ;
- Wero n'est pas non plus synonyme de SCT Inst, de TIPS ou de RT1.

Wero constitue une couche d'expérience, de règles, de coordination et d'acceptation qui s'appuie sur un écosystème de PSP, d'acquéreurs, de banques et d'infrastructures de paiement.

## 2. Capacités publiques vérifiées au 28 septembre 2026

Les sources publiques Wero indiquent notamment :

- envoi et réception d'argent ;
- demandes de paiement ;
- partage de dépenses ;
- paiement en ligne ;
- paiement en magasin par QR dans les marchés où la fonctionnalité est disponible ;
- gestion de paiements récurrents/abonnements selon disponibilité banque/pays ;
- suivi des transactions.

La disponibilité réelle varie selon le pays et le PSP.

## 3. Expansion géographique

Au 28 septembre 2026, les sources Wero publiques indiquent une disponibilité couvrant la Belgique, la France, l'Allemagne, les Pays-Bas et le Luxembourg, avec des parcours et calendriers variables selon les marchés et les banques.

Points datés importants :

- P2P a constitué le premier cas d'usage de déploiement ;
- e-commerce a été progressivement lancé à partir de 2025/2026 selon les pays ;
- le Luxembourg a engagé en septembre 2026 la migration finale Payconiq → Wero ;
- la transition iDEAL → Wero est engagée aux Pays-Bas ;
- EPI a annoncé en septembre 2026 les premiers cas d'usage in-store sélectionnés en Belgique.

## 4. Marchands

EPI a annoncé le 16 septembre 2026 que plus de **48 000 marchands** en Belgique, France, Allemagne, Luxembourg et Pays-Bas avaient déjà traité des transactions Wero, en ligne et/ou dans des magasins physiques.

Cette valeur doit toujours être présentée comme :

> chiffre EPI publié le 16 septembre 2026.

Elle ne doit jamais devenir un chiffre générique non daté.

## 5. Consumer PSP et Acceptor PSP

L'architecture publique EPI montre une distinction structurante entre :

- **Consumer PSP** : PSP côté consommateur/payer ;
- **Acceptor PSP** : PSP/acquéreur qui permet au marchand d'accepter Wero.

Cela conduit à une chaîne de responsabilité différente d'un simple paiement P2P.

### Vue de référence

```text
Consumer
   |
   v
Consumer PSP
   |
   v
Wero / EPI coordination
   |
   v
Acceptor PSP
   |
   v
Merchant
```

Cette vue représente le plan d'expérience et d'acceptation. Le mouvement financier sous-jacent doit être décrit séparément.

## 6. Trois plans à maintenir distincts

### Plan A — Experience / consent
- application bancaire ou Wero ;
- checkout ;
- QR/deep link ;
- SCA ;
- consentement ;
- UX de retour.

### Plan B — Scheme / coordination
- consumer PSP ;
- acceptor PSP ;
- payment request ;
- routing logique ;
- événements/statuts ;
- merchant notification.

### Plan C — Financial rail
- Payment Hub / compte ;
- instruction financière ;
- SCT Inst ;
- CSM ;
- settlement ;
- bénéficiaire.

Le livre conservera cette séparation dans tous les parcours.

## 7. E-commerce

Le parcours e-commerce public ne doit pas être réduit à un redirect.

Une architecture robuste doit au minimum modéliser :

```text
Merchant order
→ payment request
→ customer authorization
→ financial submission
→ authoritative payment result
→ merchant status
→ fulfilment
```

Le retour navigateur est une information d'expérience, jamais la preuve financière ultime.

## 8. In-store

Les usages in-store annoncés en septembre 2026 ajoutent de nouveaux domaines de panne :

- terminal / navigateur ;
- QR ;
- réseau local marchand ;
- connexion mobile client ;
- délais utilisateur ;
- reprise après perte de connectivité ;
- double présentation ou double clic ;
- perte de callback marchand.

Le chapitre réseau et résilience traite ces sujets séparément.

## 9. Paiements récurrents

Les sources publiques Wero indiquent des capacités/trajectoires d'abonnement. L'architecture ne doit pas modéliser un abonnement comme une seule transaction répétée.

Le modèle de référence distingue :

```text
Mandate / consent
   |
   +--> charge cycle 1 --> payment 1
   +--> charge cycle 2 --> payment 2
   +--> charge cycle 3 --> payment 3
```

Chaque paiement possède son propre état financier, son identifiant et sa propre gestion de l'ambiguïté.

## 10. Règle éditoriale

Tout détail public Wero doit porter :
- date de vérification ;
- pays ;
- type de PSP ;
- capacité réellement annoncée ;
- distinction LIVE / ROLLOUT / ROADMAP.

Une fonctionnalité annoncée pour le futur ne doit jamais être présentée comme déjà disponible partout.

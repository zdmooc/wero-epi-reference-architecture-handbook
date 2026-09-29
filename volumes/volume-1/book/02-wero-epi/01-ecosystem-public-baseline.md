---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - epi-wero-launch-germany-2024
  - epi-wero-launch-france-2024
  - epi-wero-ecommerce-belgium-2026
  - epi-wero-commerce-2026-09
  - wero-merchants
  - wero-faq-overview
related_internal_repos:
  - zdmooc/wero-organisme-poc
---

# Partie I — Wero / EPI : écosystème, rôles et périmètre public

## Pourquoi Wero doit être étudié comme un écosystème

Wero n'est pas seulement une interface mobile. Pour l'architecte, il faut distinguer au minimum :

1. **l'expérience de paiement** visible du consommateur ;
2. **les règles de participation et de service** ;
3. **les PSP côté payeur et côté bénéficiaire** ;
4. **le scheme de virement instantané utilisé pour transporter la valeur lorsqu'il est applicable** ;
5. **les mécanismes de clearing, routing et settlement** ;
6. **l'infrastructure technique des participants**, qui n'est pas publiquement déductible de la marque Wero.

Cette séparation permet d'éviter une erreur fréquente : dessiner une « architecture Wero » comme si EPI opérait nécessairement chaque composant bancaire, chaque base de données et chaque rail.

## Chronologie publique utile à l'architecture

### 2024 — démarrage P2P

EPI a lancé Wero en Allemagne en juillet 2024, avec les transactions P2P comme premier service. Le lancement français de septembre 2024 a présenté un paiement compte-à-compte instantané, utilisable depuis les applications bancaires participantes ou, selon le cas, l'application Wero.

Le P2P introduit déjà plusieurs capabilities structurantes :

- enrolment ;
- alias / annuaire ;
- résolution d'un destinataire ;
- consentement ;
- authentification ;
- initiation de paiement ;
- statut ;
- notification ;
- historique ;
- fraude ;
- réconciliation.

### 2025–2026 — commerce

Les communications publiques EPI décrivent ensuite l'entrée dans l'e-commerce, puis les premiers usages in-store.

Au 16 septembre 2026, EPI indique que plus de 48 000 commerçants répartis entre Belgique, France, Allemagne, Luxembourg et Pays-Bas ont traité des transactions Wero, en ligne ou dans des magasins physiques.

Cette évolution change fortement l'architecture. Un transfert P2P peut être représenté principalement comme une relation payeur/bénéficiaire. Le commerce introduit :

- merchant order ;
- checkout ;
- Acceptor PSP / acquirer ;
- payment request ;
- statuts commerciaux distincts des statuts financiers ;
- callback/webhook ;
- refund ;
- reconciliation commande/paiement/règlement ;
- support, dispute et opérations ;
- disponibilité du parcours marchand.

## Modèle quatre coins public pour le commerce

Le matériel officiel Wero destiné aux professionnels décrit un **modèle à quatre coins** et indique que le commerçant travaille avec Wero via son acquéreur.

Une vue conceptuelle cohérente est :

```text
Consumer
   |
Consumer PSP
   |
Wero / EPI ecosystem
   |
Acceptor PSP / Acquirer
   |
Merchant
```

Cette vue est **PUBLIC_VERIFIED au niveau des rôles**, mais elle ne décrit pas :

- la topologie interne EPI ;
- la nature des brokers ;
- le moteur de workflow ;
- la base de données ;
- la technologie API gateway ;
- la plateforme conteneur ;
- les sites physiques.

Ces éléments restent inconnus publiquement sauf source explicite.

## Wero et SCT Inst

Le site Wero pour les professionnels indique que Wero combine le paiement compte-à-compte avec SCT Inst.

L'architecte doit néanmoins séparer :

```text
Wero
= expérience / produit / règles de service

SCT Inst
= scheme de virement instantané

ISO 20022
= standard de messages

TIPS / RT1 / autre CSM pertinent
= infrastructure de traitement/règlement selon la route
```

Le fait que Wero utilise SCT Inst ne permet pas d'affirmer que toutes les transactions Wero traversent un unique CSM ou une seule architecture technique.

## Canaux visibles publiquement

### P2P

Le lancement français décrit l'usage du numéro de téléphone ou de l'adresse e-mail pour envoyer de l'argent, sans saisie manuelle d'IBAN.

### E-commerce desktop

Le parcours public Wero décrit :

1. sélection de Wero au checkout ;
2. affichage d'un QR code ;
3. scan depuis l'application bancaire ou l'application Wero ;
4. confirmation mobile ;
5. retour vers le site marchand.

Conséquence architecturale : **le navigateur n'est pas la source de vérité financière**. Un redirect final doit être distingué d'une confirmation autoritative côté PSP/merchant integration.

### In-store

La FAQ Wero décrit le scan d'un QR code affiché par un terminal/écran ou d'un QR statique selon le scénario, avec confirmation dans le wallet.

Conséquences :

- nécessité de corréler QR / merchant / amount / payment request ;
- expiration ou réutilisabilité selon le type de QR ;
- protection contre substitution de QR ;
- authentification locale ;
- retour du statut au terminal ou système marchand.

### Subscriptions / recurring

Wero liste les abonnements parmi les capacités actuelles, avec disponibilité dépendante du pays et de la banque. Le livre traite donc le recurring comme un domaine fonctionnel, tout en versionnant les détails de disponibilité.

## Acteurs de référence

| Acteur | Responsabilité conceptuelle |
|---|---|
| Consumer / Payer | initie et consent |
| Wallet / Bank App | expérience, authentification, présentation |
| Consumer PSP | porte le compte payeur et l'exécution côté payeur |
| Wero / EPI ecosystem | règles et orchestration du service Wero selon le modèle public |
| Acceptor PSP / Acquirer | intégration marchand et acceptation |
| Merchant | commande, délivrance de bien/service, statut commercial |
| Beneficiary PSP | compte bénéficiaire |
| CSM / settlement infrastructure | traitement inter-PSP et règlement selon la route |
| Central bank / TARGET context | actif de règlement central-bank-money lorsque applicable |

## Frontières de responsabilité

Une bonne architecture doit répondre, pour chaque étape :

- qui possède l'état ?
- qui peut le modifier ?
- qui peut déclencher un effet financier ?
- qui peut confirmer la finalité ?
- qui réconcilie en cas de divergence ?
- qui doit être disponible pour que le parcours reste acceptable ?
- quel acteur est responsable du retry ?
- quel acteur ne doit surtout pas réessayer à l'aveugle ?

## Carte de capabilities Wero de référence

```text
Customer & Wallet
├── Enrollment
├── Alias / Directory
├── Consent
├── SCA
├── History
└── Notifications

Payment
├── Payment Request
├── Initiation
├── Orchestration
├── Routing
├── Status
├── Refund
├── Return / Recall
└── Reconciliation

Merchant
├── Checkout
├── Order correlation
├── Acceptor integration
├── Callback / Webhook
├── Refund
└── Settlement reconciliation

Risk & Trust
├── Fraud
├── VoP
├── AML / sanctions
├── IAM
├── PKI / certificates
└── Audit
```

Cette capability map est **REFERENCE_ARCHITECTURE**. Elle aide à raisonner sans prétendre reproduire les composants EPI.

## Ce qui doit être versionné dans chaque édition

Les éléments suivants sont volatils :

- pays disponibles ;
- banques participantes ;
- PSP/acquéreurs partenaires ;
- types de parcours activés ;
- e-commerce / in-store / subscriptions ;
- modes QR/NFC ;
- roadmap ;
- volumes et nombre de marchands.

Ils ne doivent jamais être imprimés comme des vérités intemporelles sans date.

## Conclusion architecte

Wero doit être analysé comme un **service de paiement européen multi-acteurs**. Le cœur de l'ouvrage ne cherchera pas à deviner ses composants internes. Il cherchera à expliquer les **contrats, responsabilités, états, flux, rails et invariants** que doit maîtriser toute architecture bancaire ou PSP participant à ce type d'écosystème.

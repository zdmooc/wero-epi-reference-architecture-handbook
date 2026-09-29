---
status: REVIEWED
last_verified: 2026-09-29
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/wero-organisme-poc
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Chapitre 2 — Anatomie de bout en bout d'un paiement

## 2.1 Le parcours maître

La totalité du livre peut être lue à partir d'un seul parcours conceptuel :

```text
CLIENT
  │
  │ action utilisateur
  ▼
APP / WALLET / CHECKOUT
  │
  │ HTTPS
  ▼
EDGE / API
  │
  ▼
PAYMENT ORCHESTRATION
  │
  ├── IAM / SCA
  ├── Fraud / Risk
  ├── VoP
  └── Consent
  │
  ▼
PAYMENT HUB / CORE BANKING
  │
  ├── account checks
  ├── ledger / reservation
  └── reconciliation state
  │
  ▼
SCT INST GATEWAY
  │
  │ ISO 20022
  ▼
CSM / RAIL
  │
  ▼
SETTLEMENT
  │
  ▼
BENEFICIARY PSP
  │
  ▼
BENEFICIARY / MERCHANT
  │
  └── status / notification / webhook
```

Il s'agit d'une **architecture de référence**, non d'une représentation d'un SI Wero/EPI interne.

## 2.2 Les trois états qu'il ne faut pas mélanger

Un paiement moderne possède au minimum trois dimensions d'état.

### État commercial

Exemples :

- panier créé ;
- commande acceptée ;
- marchandise livrable ;
- refund demandé.

### État de scheme / orchestration

Exemples :

- payment created ;
- pending ;
- submitted ;
- rejected ;
- expired.

### État financier

Exemples :

- instruction non envoyée ;
- instruction acceptée ;
- règlement confirmé ;
- résultat inconnu ;
- fonds retournés.

Un système robuste ne doit jamais déduire automatiquement l'état financier d'un état d'interface.

## 2.3 Le cas le plus important : UNKNOWN

Le scénario critique est simple :

1. une instruction est envoyée ;
2. le système distant peut l'avoir traitée ;
3. la réponse disparaît ;
4. le système local ne sait pas si l'opération financière a eu lieu.

La mauvaise réaction est :

```text
pas de réponse
→ retry aveugle
→ risque de deuxième opération financière
```

La réaction de référence est :

```text
pas de réponse
→ UNKNOWN
→ inquiry / investigation / reconciliation
→ résultat établi
→ reprise contrôlée
```

Ce principe sera réutilisé dans les chapitres ISO 20022, API, Kafka, base de données, réseau et résilience.

## 2.4 Couche réseau du même paiement

```text
Mobile / Browser
      │
   Internet
      │
 DNS / Anti-DDoS
      │
     WAF
      │
 Load Balancer
      │
 API Gateway
      │
 Application Zone
      │
 Payment Zone
      │
 Banking Connectivity
      │
 CSM / Settlement
```

Une panne peut donc se produire alors que l'application elle-même fonctionne parfaitement :

- DNS indisponible ;
- certificat expiré ;
- MTLS cassé ;
- firewall mal configuré ;
- connectivité CSM coupée ;
- timeout réseau ;
- réponse perdue après exécution.

Le réseau fait donc partie de la logique de paiement, pas seulement de l'infrastructure.

## 2.5 Couche événementielle

Une architecture de référence peut publier des événements :

```text
PaymentCreated
PaymentAuthorized
PaymentSubmitted
PaymentSettled
PaymentRejected
PaymentUnknown
PaymentReconciled
PaymentReturned
PaymentRefunded
```

Ces événements ne doivent pas créer une deuxième vérité financière. Ils diffusent un état dont la source de vérité doit rester clairement identifiée.

## 2.6 Couche résilience

Le même parcours sera testé contre :

- perte pod ;
- perte node ;
- perte AZ ;
- perte site ;
- perte DB leader ;
- perte Kafka ;
- perte IAM ;
- perte DNS ;
- perte HSM ;
- perte CSM ;
- délai réseau ;
- duplicate callback ;
- duplicate user action ;
- perte du statut final.

Le but n'est pas seulement de redémarrer des composants. Le but est de préserver les invariants :

1. pas de double paiement ;
2. pas de succès fictif ;
3. pas de perte silencieuse ;
4. état réconciliable ;
5. audit complet ;
6. reprise contrôlée.

## 2.7 Ce que nous allons construire

Les parties suivantes détailleront progressivement chaque bloc :

```text
Wero/EPI
   ↓
Payment journeys
   ↓
ISO 20022
   ↓
SCT Inst
   ↓
TIPS / RT1 / CSM / settlement
   ↓
Network
   ↓
Application / API / Event
   ↓
Data
   ↓
Security
   ↓
Infrastructure
   ↓
Resilience / DORA
   ↓
Operations / SRE
```

À la fin, le lecteur devra pouvoir partir d'un paiement visible par un client et expliquer jusqu'à sa finalité financière, ses dépendances physiques, ses risques de panne et son cadre réglementaire.

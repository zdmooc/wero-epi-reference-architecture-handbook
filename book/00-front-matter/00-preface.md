---
status: REVIEWED
last_verified: 2026-09-29
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/wero-organisme-poc
  - zdmooc/payment-hub-iso20022-opf-reference
  - zdmooc/mayabank-instant-payments-resilience-platform
  - zdmooc/dora-operational-resilience-architecture-masterbook
---

# Préface — Du clic au règlement final

Un paiement numérique paraît simple au client : choisir Wero, s'authentifier, confirmer, puis voir apparaître un succès.

Pour l'architecte, cette simplicité est trompeuse.

Entre le geste du client et le règlement financier interviennent des applications, des API, des mécanismes d'identité, des moteurs de fraude, des composants de paiement, des messages ISO 20022, des réseaux, des systèmes de clearing et de settlement, des comptes de liquidité, des bases de données, des mécanismes de réconciliation et des dispositifs de résilience.

Ce livre part d'un principe : **on ne comprend pas un paiement en étudiant une seule couche**.

Une vue uniquement fonctionnelle oublie le réseau et le settlement.  
Une vue uniquement infrastructure oublie la finalité financière.  
Une vue uniquement ISO 20022 oublie l'expérience client et l'état métier.  
Une vue uniquement réglementaire ne montre pas comment concevoir le système.  
Une vue uniquement Kubernetes ne répond pas à la question la plus importante après un incident : **le paiement a-t-il réellement eu lieu ?**

L'objectif de cet ouvrage est donc de suivre la transaction de bout en bout :

```text
Client
  ↓
Canal / Wallet
  ↓
Wero / orchestration
  ↓
Consumer PSP
  ↓
Payment Hub / Core / Risk
  ↓
SCT Inst gateway
  ↓
CSM / rail
  ↓
Settlement
  ↓
Beneficiary PSP
  ↓
Merchant / bénéficiaire
```

Puis de reprendre exactement le même parcours sous les vues :

- métier ;
- fonctionnelle ;
- applicative ;
- données ;
- API ;
- événements ;
- réseau ;
- infrastructure ;
- rails de paiement ;
- liquidité ;
- sécurité ;
- résilience ;
- exploitation ;
- réglementation.

L'ouvrage est conçu comme une **référence vivante**. Certaines notions — finalité, idempotence, cohérence, RTO/RPO, fencing, séparation des responsabilités — sont durables. D'autres — versions de rulebooks, fonctionnalités Wero, échéances réglementaires — évolueront. Elles seront donc datées, sourcées et versionnées.

Le lecteur ne doit jamais avoir à deviner si un diagramme représente un fait public, une déduction ou une architecture proposée. Cette distinction fait partie du contenu.

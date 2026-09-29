---
status: COLLECTION_V2_REVIEWED
last_verified: 2026-09-29
truth_level: REFERENCE_ARCHITECTURE
primary_sources:
  - wero-merchants
---

# E-commerce mobile — app-to-app

## 1. Différence avec le desktop

Le paiement reste conceptuellement le même, mais le changement d'application crée une frontière UX différente : l'utilisateur quitte l'application marchande, autorise le paiement dans le wallet/application bancaire, puis revient éventuellement vers le marchand.

## 2. Séquence de référence

```text
Merchant App
  | create order + payment context
  v
Merchant Backend / Acceptor
  | opaque or signed hand-off context
  v
Wallet / Bank App
  | authenticate + approve
  v
Consumer PSP
  | execute payment
  v
Payment rail
  | outcome
  v
Merchant Backend
  | persist authoritative status
  v
Merchant App
  | callback / refresh / resume
```

## 3. Invariants

- le callback applicatif est une navigation, pas une preuve financière ;
- l'identité du `orderId` doit survivre au changement d'application ;
- le hand-off ne doit pas permettre de modifier silencieusement merchant ou amount ;
- le retry réutilise le même paiement logique ;
- l'application marchande peut être tuée sans perdre la transaction ;
- le backend peut reconstruire le résultat sans dépendre de l'état local du terminal.

## 4. Menaces fonctionnelles à transmettre au Volume IV

- callback falsifié ;
- deep link détourné ;
- ancien payment context rejoué ;
- retour vers le mauvais order ;
- double approbation apparente ;
- perte réseau après consentement.

## 5. Critère de fermeture commerciale

La commande est fermée sur un statut backend autoritatif réconcilié avec le paiement, jamais sur le simple retour de l'utilisateur dans l'application.

---
status: COLLECTION_V2_REVIEWED
last_verified: 2026-09-29
truth_level: MIXED
primary_sources:
  - wero-faq-desktop
  - wero-merchants
---

# E-commerce desktop + QR

## 1. Pourquoi ce parcours est un parcours maître

Le desktop sépare physiquement deux contextes : le navigateur marchand et le wallet/application bancaire utilisé pour autoriser le paiement. Cette séparation rend visible une règle structurante de toute la collection : **le canal de présentation n'est pas la source de vérité financière**.

## 2. Séquence de référence

```text
Customer
  |
Merchant Browser
  | create checkout(orderId)
  v
Merchant Backend
  | create payment request
  v
Acceptor PSP / Acquirer
  | paymentRequestId
  v
Desktop QR
  | scan
  v
Wallet / Bank App
  | merchant + amount presentation
  | consent + SCA
  v
Consumer PSP
  | payment execution
  v
Instant-payment processing
  | authoritative outcome
  v
Acceptor side / Merchant Backend
  | order/payment reconciliation
  v
Browser presentation
```

## 3. Identifiants canoniques

Le parcours réutilise :
- `orderId` pour la commande ;
- `paymentRequestId` pour le contexte de paiement ;
- `paymentId` pour le paiement logique ;
- `idempotencyKey` pour les retries contrôlés ;
- identifiants scheme/rail du Volume II ;
- `correlationId` pour l'observabilité du Volume III/IV.

## 4. Invariants

1. Le QR doit identifier un contexte de paiement, pas constituer lui-même une preuve de paiement.
2. Le retour navigateur ne valide jamais seul la vente.
3. Un refresh ou un double clic ne crée pas un second effet financier.
4. Le merchant backend obtient un statut autoritatif via son intégration PSP/acquéreur.
5. Une divergence entre état commande et état paiement déclenche rapprochement, pas une nouvelle exécution automatique.
6. L'expiration du payment request est distincte d'un timeout de paiement après soumission.

## 5. États à ne pas fusionner

Commercial : `ORDER_CREATED / PAYMENT_PENDING / PAID / CANCELLED`.

Customer/consent : `PRESENTED / AUTHORISED / DECLINED / EXPIRED`.

Payment/scheme : `CREATED / SUBMITTED / ACCEPTED / REJECTED / UNKNOWN`.

Financial : `NOT_SUBMITTED / IN_FLIGHT / SETTLED / NOT_SETTLED / UNKNOWN`.

## 6. Défaillances caractéristiques

- navigateur fermé après approbation ;
- QR expiré ;
- webhook retardé ;
- callback dupliqué ;
- PSP indisponible avant soumission ;
- timeout après soumission ;
- paiement réglé mais statut marchand non observé.

## 7. Passage aux autres volumes

- Volume II : messages, timing, UNKNOWN, rail et settlement.
- Volume III : APIs, webhook, stockage, events et idempotency.
- Volume IV : fraude, sécurité du QR, SLO et recovery.

---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - wero-faq-overview
  - wero-faq-desktop
  - wero-faq-instore
  - wero-merchants
related_internal_repos:
  - zdmooc/wero-organisme-poc
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Partie II — Parcours Wero de bout en bout

## 1. Règle de modélisation

Chaque parcours est décrit avec quatre lignes de vie indépendantes :

```text
COMMERCIAL STATE
CUSTOMER / CONSENT STATE
PAYMENT / SCHEME STATE
FINANCIAL / SETTLEMENT STATE
```

Un système robuste ne fusionne pas ces états.

## 2. P2P — parcours conceptuel

```text
Payer
  |
  | choose contact / alias
  v
Wallet / Bank App
  |
  | resolve recipient
  v
Directory / Eligibility
  |
  | consent + SCA
  v
Consumer PSP
  |
  | create / execute payment
  v
SCT Inst processing
  |
  | inter-PSP / settlement
  v
Beneficiary PSP
  |
  | credit + status
  v
Beneficiary
```

### Invariants

- l'alias ne doit pas être considéré comme le compte lui-même ;
- la résolution d'alias doit produire une identité/route suffisamment stable pour l'exécution ;
- un retry UI doit réutiliser une clé logique de paiement ;
- le statut affiché doit être corrélé au même paiement ;
- un timeout après soumission ne doit pas produire automatiquement un nouveau paiement.

## 3. E-commerce desktop

Le parcours public Wero montre un QR affiché dans le navigateur et une validation sur mobile.

Architecture de référence :

```text
Browser
  |
  | checkout(orderId)
  v
Merchant Backend
  |
  | create paymentRequest
  v
Acceptor PSP
  |
  | Wero payment context
  v
Wero / Consumer-side flow
  |
  | QR/deep-link context
  v
Consumer Wallet
  |
  | authenticate + approve
  v
Consumer PSP
  |
  | financial execution
  v
Instant-payment rail
  |
  v
Beneficiary / Acceptor side
  |
  | authoritative status
  v
Merchant Backend
  |
  | render result
  v
Browser
```

### Point critique : redirect ≠ règlement

Le navigateur peut :
- être fermé ;
- perdre le réseau ;
- être redirigé avant la réception du statut marchand ;
- revenir tardivement ;
- rejouer une URL.

Le merchant backend doit donc s'appuyer sur un statut de paiement autoritatif via son PSP/intégration, pas uniquement sur le redirect.

## 4. E-commerce mobile / app-to-app

Le principe est semblable mais la frontière UX change :

```text
Merchant App
   |
   | universal/deep link
   v
Wallet / Bank App
   |
   | approval
   v
Payment
   |
   | status
   v
Merchant backend
   |
   | app callback / refresh
   v
Merchant App
```

Risques :
- callback d'application falsifié ;
- retour au mauvais orderId ;
- double clic ;
- reprise après kill de l'app ;
- statut marchand en retard.

Contrôles :
- contexte signé ou opaque ;
- correlation IDs ;
- authoritative backend status ;
- idempotency ;
- timeout avec refresh actif.

## 5. In-store QR dynamique

Le QR dynamique est associé à une transaction précise.

```text
POS
  |
  | amount + order
  v
Merchant/Acquirer
  |
  | paymentRequestId
  v
QR displayed
  |
Consumer scans
  |
Wallet validates merchant + amount
  |
Consumer approves
  |
Payment executes
  |
Acquirer/merchant receives final status
  |
POS closes sale
```

### Invariants

- montant et merchant identity liés au payment request ;
- QR à durée de vie courte ;
- impossibilité de réutiliser le même payment request pour un second effet financier ;
- POS ferme la vente sur statut backend, pas sur capture visuelle côté client.

## 6. QR statique

Le QR statique peut référencer un marchand ou point d'acceptation et déclencher ensuite la saisie/récupération du montant.

Il augmente l'importance de :
- l'authenticité du QR ;
- l'affichage du nom marchand dans le wallet ;
- la validation du montant ;
- la détection de substitution de sticker ;
- la géographie ou le contexte si utilisé comme signal antifraude.

## 7. Refund

Le refund est un **nouveau mouvement financier lié au paiement initial**.

```text
Original payment SETTLED
        |
Merchant requests refund
        |
Refund object created
        |
Financial return execution
        |
Refund status
        |
Merchant + consumer notified
```

Invariants :
- `refundId != paymentId` ;
- montant cumulé remboursé contrôlé ;
- même idempotency key → même refund ;
- audit séparé ;
- pas de modification rétroactive du ledger initial.

## 8. Return vs Recall

Le livre sépare strictement :

- **return** : mouvement de retour des fonds ;
- **recall/request for recall** : demande visant une opération déjà traitée selon les règles du scheme ;
- **refund marchand** : logique commerciale liée à l'achat.

Ces notions ne sont pas interchangeables.

## 9. Recurring / subscription

Un recurring payment exige de séparer :

```text
Consent / mandate lifecycle
        |
Payment plan / schedule
        |
Individual payment execution
        |
Per-payment status
        |
Revocation / expiry / pause
```

Le consentement n'est pas un paiement. La révocation du consentement ne réécrit pas les paiements déjà finalisés.

## 10. Modèle d'état de référence

```text
CREATED
  |
  v
PENDING_AUTH
  |
  v
AUTHORIZED
  |
  v
SUBMITTED
  |  | ----> REJECTED
  |
  +------> UNKNOWN
  |          |
  |          v
  |      INVESTIGATING
  |       /       \
  |      v         v
  |   SETTLED    FAILED
  |
  v
SETTLED
  |
  +------> RETURNED
  |
  +------> REFUND_PENDING --> REFUNDED
```

Cette machine est une **REFERENCE_ARCHITECTURE**. Les codes et états de scheme exacts restent distincts.

## 11. Idempotence de bout en bout

Une idempotency key API ne suffit pas si :
- le canal perd son commit local ;
- le service redémarre ;
- la requête descendante est déjà effective ;
- plusieurs réplicas traitent la même clé.

Le livre retient l'invariant suivant :

```text
same business intent
+ same key
+ same semantic payload
= same logical payment
```

Une même clé avec un payload financier différent doit être rejetée comme conflit.

## 12. UNKNOWN : le scénario de référence

```text
submit
  |
remote may execute
  |
response lost
  |
local UNKNOWN
  |
NO BLIND FINANCIAL RETRY
  |
status/inquiry/reconciliation
  |
authoritative resolution
```

C'est l'un des invariants centraux de l'ouvrage et du companion lab.

## 13. Corrélation

Un parcours marchand devrait pouvoir relier :

```text
merchantOrderId
paymentRequestId
acceptorPaymentId
consumerPaymentId
paymentId
EndToEndId
rail instruction id
settlement/reconciliation id
callback eventId
refundId
traceId
correlationId
```

Tous ne sont pas nécessairement présents dans chaque implémentation. L'architecture doit néanmoins définir clairement quelles références survivent à chaque frontière.

## 14. Matrice de vérité

| Événement visible | Ce qu'il prouve | Ce qu'il ne prouve pas |
|---|---|---|
| QR affiché | contexte de paiement créé | paiement exécuté |
| SCA réussie | client authentifié/consentant | settlement |
| HTTP 201 create payment | objet créé | finalité |
| redirect succès | retour UX | finalité |
| webhook reçu | événement partenaire reçu | exactitude sans validation |
| pacs.002 positif applicable | statut scheme correspondant | état commercial marchand |
| settlement authoritative | effet financier final selon rail | livraison du bien |
| order CLOSED | décision marchand | rail exact si non corrélé |

## 15. Conclusion

Le parcours Wero n'est pas une seule flèche. Il est la synchronisation contrôlée de plusieurs machines d'état. La résilience consiste autant à préserver cette cohérence qu'à maintenir des pods disponibles.

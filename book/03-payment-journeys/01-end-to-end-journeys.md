---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - https://support.wero-wallet.eu/hc/en-us/articles/46739121212177-What-is-Wero
  - https://epicompany.eu/media-insights/wero-next-now-e-commerce-accelerates-as-in-store-takes-its-first-steps/
related_internal_repos:
  - zdmooc/wero-organisme-poc
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Parcours Wero de bout en bout

## 1. Principe

Les parcours suivants sont des **architectures de référence** construites à partir des capacités publiques Wero et des invariants paiement éprouvés dans les labs du portefeuille. Ils ne représentent pas l'architecture interne d'EPI.

## 2. P2P

```text
Payer
→ Wero / bank app
→ resolve beneficiary alias
→ payer authorization
→ Consumer PSP / payment processing
→ instant-payment rail
→ beneficiary PSP
→ beneficiary account
→ notification
```

### Invariants
- alias et compte bancaire sont deux objets différents ;
- l'alias ne devient jamais l'identifiant de settlement ;
- l'autorisation utilisateur ne vaut pas settlement ;
- les identifiants de bout en bout doivent rester corrélables.

## 3. E-commerce / C2B

```text
Merchant
→ Acceptor PSP / gateway
→ Payment Request
→ Wero customer journey
→ Consumer PSP
→ financial payment
→ rail / settlement
→ authoritative result
→ Acceptor status
→ signed webhook
→ merchant order
```

### Identifiants minimaux
- merchantOrderId ;
- paymentRequestId ;
- acceptorPaymentId ;
- scheme/wallet payment ID ;
- consumer-side payment ID ;
- EndToEndId / TxId selon rail ;
- settlement reference ;
- correlationId / traceId.

## 4. Mobile commerce

Le mobile commerce ajoute :
- app-to-app/deep link ;
- perte de contexte lors du changement d'application ;
- callback mobile non garanti ;
- reprise après retour tardif ;
- risque de double action utilisateur.

Le serveur marchand doit toujours pouvoir récupérer l'état du paiement indépendamment du retour mobile.

## 5. POS / QR

```text
POS creates payment intent
→ QR displayed
→ customer scans
→ Wero/bank app authorizes
→ payment submitted
→ merchant actively obtains result
→ POS closes order
```

Le terminal ne doit pas déduire un échec financier d'un timeout de réseau.

## 6. Refund

Le refund est une **nouvelle opération financière corrélée** au paiement initial.

```text
Original payment SETTLED
→ Refund requested
→ Refund operation created
→ Financial return/refund path
→ Refund SETTLED
→ Commercial order REFUNDED
```

Règle : ne jamais modifier l'historique pour faire croire que le paiement initial n'a pas existé.

## 7. Recurring / subscription

Trois objets distincts :

```text
Mandate
Charge occurrence
Financial payment
```

État de référence :

```text
MANDATE_CREATED
→ ACTIVE
→ CHARGE_DUE
→ PAYMENT_SUBMITTED
→ SETTLED
→ NEXT_CYCLE
```

Exceptions :
- SUSPENDED ;
- REVOKED ;
- EXPIRED ;
- CHARGE_UNKNOWN.

## 8. Request-to-Pay

Une demande de paiement n'est pas elle-même un paiement.

```text
Request created
→ presented
→ accepted / rejected / expired
→ if accepted: create payment
→ independent financial lifecycle
```

## 9. Trois états

Le livre impose trois state machines indépendantes.

### Commercial
```text
CREATED → PAYMENT_PENDING → PAID → REFUND_PENDING → REFUNDED
```

### Scheme / coordination
```text
REQUEST_CREATED → AUTH_PENDING → AUTHORIZED → COMPLETED
                         └──────→ REJECTED / EXPIRED
```

### Financial
```text
SUBMITTED → SETTLED
SUBMITTED → REJECTED
SUBMITTED → UNKNOWN → RECONCILING → SETTLED | REJECTED | RECOVERY_REQUIRED
```

## 10. UNKNOWN

Le statut le plus important du livre.

```text
instruction sent
→ remote effect may have occurred
→ final response lost
→ local system cannot prove outcome
→ UNKNOWN
```

La réaction sûre :

```text
UNKNOWN
→ inquiry/status
→ reconciliation
→ authoritative result
→ controlled convergence
```

Jamais :

```text
timeout
→ create a brand-new financial payment
```

## 11. Preuve du portefeuille

Le companion lab a démontré sur CRC mono-nœud :
- idempotence concurrente 10/50/100 requêtes ;
- crash window après effet downstream ;
- récupération du même paiement ;
- status inquiry externe générique ;
- C2B avec récupération après callback perdu ;
- déduplication de callback ;
- refund comme mouvement distinct.

Ces preuves sont `RUNTIME_PROVEN` uniquement dans leur scope applicatif local, pas en production multi-AZ.

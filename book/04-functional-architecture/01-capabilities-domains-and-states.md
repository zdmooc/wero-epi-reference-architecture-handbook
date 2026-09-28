---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/wero-organisme-poc
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Architecture fonctionnelle de référence

## 1. Capability map

```text
Customer / Merchant Experience
├── Enrollment / Eligibility
├── Alias / Directory
├── Payment Request
├── Consent / SCA
├── Payment Initiation
├── Payment Status
├── Refund / Return / Recall
└── Support / Dispute

Payment Control
├── Payment Orchestration
├── Fraud / Risk
├── VoP
├── AML / Sanctions
├── Limits
├── Routing
├── Idempotency
└── State Management

Financial Processing
├── Account Validation
├── Funds Availability
├── Ledger
├── Payment Hub
├── ISO 20022 Adapter
├── SCT Inst Gateway
├── CSM Connectivity
└── Settlement Reconciliation

Operations
├── Observability
├── Investigation
├── Reconciliation
├── Incident Management
├── Reporting
└── Audit
```

## 2. Domain boundaries

### Customer / Identity
Responsabilités :
- identité utilisateur ;
- appareil ;
- authentification ;
- consentement.

### Wallet / Experience
Responsabilités :
- parcours ;
- demande ;
- interaction ;
- affichage de statut.

### Merchant / Acceptor
Responsabilités :
- commande ;
- payment request ;
- webhook ;
- refund ;
- rapprochement marchand.

### Payment
Responsabilités :
- intent ;
- idempotence ;
- état financier ;
- lifecycle.

### Risk
Responsabilités :
- fraude ;
- règles ;
- limites ;
- signaux temps réel.

### Rail
Responsabilités :
- transformation vers le message du rail ;
- connectivité ;
- status ;
- reason codes ;
- inquiry.

### Reconciliation
Responsabilités :
- comparaison de vérités ;
- traitement des écarts ;
- recovery contrôlé.

## 3. Source of truth

Chaque domaine doit avoir une autorité explicite.

| Objet | Source de vérité de référence |
|---|---|
| Merchant order | Merchant |
| Payment request | Acceptor PSP |
| User consent | Consumer PSP / wallet context |
| Financial payment | Payment processing domain |
| Rail status | authoritative rail/participant response |
| Settlement | settlement infrastructure/participant records |
| Refund | dedicated refund/payment operation |
| Audit | append-only controlled audit store |

## 4. Idempotence

La clé d'idempotence est liée à **l'intention métier stable**, pas à la requête HTTP physique.

Même intention :
```text
retry HTTP
→ same idempotency identity
→ same payment
```

Nouvelle intention :
```text
new purchase / new charge
→ new idempotency identity
→ new payment
```

## 5. Corrélation

Aucun identifiant ne remplace tous les autres.

La plateforme maintient une relation :

```text
merchantOrderId
↔ paymentRequestId
↔ acceptorPaymentId
↔ wallet/schemePaymentId
↔ internalPaymentId
↔ MsgId / InstrId / EndToEndId / TxId
↔ settlementReference
↔ correlationId / traceId
```

## 6. Architecture de statut

Un modèle interne robuste stocke :
- état commercial ;
- état scheme ;
- état financier ;
- dernier événement ;
- source du statut ;
- timestamp ;
- reason code ;
- version/concurrency token.

## 7. Contrôle des transitions

Exemples d'invariants :

- `SETTLED` ne retourne pas vers `SUBMITTED` ;
- `UNKNOWN` ne devient pas `FAILED` par simple timeout ;
- un replay ne crée pas un second settlement ;
- un refund ne supprime pas le paiement original ;
- un callback dupliqué ne déclenche pas deux fulfilments ;
- un événement hors ordre ne doit pas écraser un état plus autoritatif.

## 8. Functional architecture vs implementation

Le capability model reste portable.

Une capacité `Event Streaming` peut être implémentée par Kafka/Redpanda/équivalent.  
Une capacité `Payment Database` peut être PostgreSQL/Oracle/équivalent.  
Une capacité `Container Platform` peut être OpenShift/Kubernetes.

Le livre nomme le produit uniquement lorsque le produit lui-même est le sujet.

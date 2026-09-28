---
status: DRAFT
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/wero-organisme-poc
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Chapitre 3 — Acteurs, responsabilités et frontières de confiance

## 3.1 Pourquoi commencer par les frontières

Une architecture de paiement ne peut pas être comprise uniquement en listant des composants.

Il faut savoir :
- qui opère quoi ;
- qui fait confiance à qui ;
- qui possède quelle donnée ;
- qui décide quel statut ;
- qui peut réessayer ;
- qui peut constater la finalité ;
- qui est responsable lorsqu'un résultat reste ambigu.

## 3.2 Modèle d'acteurs de référence

```text
Payer / Consumer
      │
      ▼
Channel / Wallet
      │
      ▼
Consumer PSP
      │
      ▼
Wero / payment ecosystem
      │
      ▼
Payment processing / SCT Inst boundary
      │
      ▼
CSM / Settlement infrastructure
      │
      ▼
Beneficiary PSP / Acceptor PSP
      │
      ▼
Merchant / Beneficiary
```

Cette représentation est volontairement générique. Les implémentations exactes et les responsabilités contractuelles doivent être décrites à partir des sources publiques et contrats applicables.

## 3.3 Trust boundaries

### Boundary A — Client device → external service

Risques :
- device compromis ;
- session hijacking ;
- phishing ;
- replay ;
- credential theft.

Contrôles possibles :
- SCA ;
- device binding ;
- secure session ;
- signed challenge ;
- anti-fraud.

### Boundary B — Internet → provider edge

Risques :
- DDoS ;
- TLS failure ;
- DNS attack ;
- bot traffic ;
- malformed payload.

Contrôles possibles :
- anti-DDoS ;
- WAF ;
- TLS ;
- rate limiting ;
- API validation.

### Boundary C — Edge → payment domain

Risques :
- over-privileged API ;
- lateral movement ;
- forged identity ;
- service impersonation.

Contrôles possibles :
- mTLS ;
- workload identity ;
- OAuth2 ;
- network policy ;
- least privilege.

### Boundary D — Bank/payment domain → external payment infrastructure

Risques :
- connectivity outage ;
- certificate expiry ;
- message duplication ;
- timeout ;
- unknown result ;
- scheme rejection.

Contrôles possibles :
- dual connectivity ;
- monitored certificates ;
- unique identifiers ;
- idempotency ;
- inquiry/reconciliation ;
- runbooks.

### Boundary E — Payment status → merchant fulfilment

Risques :
- merchant treats redirect as settlement ;
- webhook duplicated ;
- webhook lost ;
- status arrives out of order.

Contrôles possibles :
- authoritative status endpoint ;
- webhook signature ;
- idempotent consumer ;
- polling/inquiry fallback ;
- explicit commercial vs financial state.

## 3.4 Responsibility matrix — reference

| Concern | Consumer side | Payment ecosystem | Bank/payment processing | CSM/settlement | Merchant side |
|---|---|---|---|---|---|
| User interaction | primary | supporting | no | no | checkout |
| Authentication | primary/shared | depending on model | shared | no | no |
| Fraud controls | shared | shared | shared | limited/system-specific | merchant fraud |
| Payment state | partial | orchestration | financial processing | rail/settlement status | commercial state |
| Settlement | no | no | participant | primary infrastructure role | no |
| Reconciliation | local | ecosystem | primary | source of external truth | local |
| Customer notification | primary | supporting | supporting | no | merchant notification |

This table is a **reference model**, not a contractual allocation for EPI participants.

## 3.5 Architectural consequence

Every API, event and message in later chapters will be annotated with:

- source actor ;
- destination actor ;
- trust boundary crossed ;
- authentication mechanism ;
- business effect ;
- financial effect ;
- retry policy ;
- source of truth ;
- reconciliation path.

That turns a sequence diagram into an architecture document rather than a simple flow drawing.

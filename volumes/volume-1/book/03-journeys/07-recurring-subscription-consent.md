---
status: COLLECTION_V2_REVIEWED
last_verified: 2026-09-29
truth_level: MIXED
primary_sources:
  - wero-faq-overview
---

# Recurring / Subscription et cycle de consentement

La récurrence est une capacité de cycle de vie, pas un simple retry du paiement initial.

## Objets distincts

- abonnement / relation commerciale ;
- consentement ou mandat selon modèle applicable ;
- occurrence de facturation ;
- paiement individuel ;
- statut financier de chaque occurrence.

## Invariants

1. Chaque occurrence financière possède sa propre identité.
2. Le consentement actif n'implique pas qu'une occurrence a été réglée.
3. Révocation, expiration et suspension doivent être modélisées.
4. Un échec d'occurrence ne recrée pas silencieusement un consentement.
5. Disponibilité fonctionnelle et détails d'implémentation restent versionnés par pays/PSP lorsque les sources publiques le requièrent.

## États conceptuels

Consentement :
`PROPOSED → ACTIVE → SUSPENDED / REVOKED / EXPIRED`

Occurrence :
`SCHEDULED → DUE → PAYMENT_PENDING → PAID / FAILED / UNKNOWN`

## Limite de vérité

Le handbook ne déduit pas une implémentation interne Wero/EPI de la seule existence publique d'une capacité subscription.

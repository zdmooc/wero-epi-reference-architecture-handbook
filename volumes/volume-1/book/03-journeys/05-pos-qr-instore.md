---
status: COLLECTION_V2_REVIEWED
last_verified: 2026-09-29
truth_level: MIXED
primary_sources:
  - wero-faq-instore
  - epi-wero-commerce-2026-09
---

# In-store / POS + QR

## Parcours maître

Le paiement en magasin relie un contexte physique de vente, un POS, le système marchand/acquéreur et le wallet du client.

## QR dynamique

```text
POS
  | order + amount
  v
Merchant / Acquirer
  | create paymentRequestId
  v
Dynamic QR
  | scan
  v
Wallet / Bank App
  | trusted merchant + amount
  | consent + SCA
  v
Consumer PSP
  | payment execution
  v
Acceptor side
  | authoritative result
  v
Merchant Backend
  | reconcile
  v
POS closes sale
```

Invariants :

- merchant, amount et payment request sont liés ;
- durée de vie courte ;
- réutilisation financière impossible ;
- vente fermée sur statut backend.

## QR statique

Lorsque le scénario public applicable autorise un QR statique, celui-ci représente plutôt un marchand ou point d'acceptation qu'une transaction complète.

Contrôles fonctionnels :

- identité marchande affichée clairement ;
- montant confirmé ;
- protection contre substitution du QR ;
- nouveau `paymentRequestId` pour chaque intention financière.

## Cas de panne

- POS disponible, wallet indisponible ;
- QR affiché mais payment request expiré ;
- paiement exécuté mais POS déconnecté ;
- double scan ;
- statut financier reçu après abandon de l'écran marchand.

Le recovery est traité sans créer automatiquement un nouveau paiement.

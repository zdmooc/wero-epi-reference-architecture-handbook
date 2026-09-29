---
status: COLLECTION_V2_REVIEWED
last_verified: 2026-09-29
truth_level: MIXED
primary_sources:
  - wero-faq-overview
---

# Request Money et Bill Split — variantes fonctionnelles

Ces capacités sont importantes mais ne constituent pas deux nouvelles architectures de paiement complètes. Elles préparent ou organisent une intention qui converge ensuite vers les mêmes primitives de paiement.

## 1. Request Money

```text
Requester
→ request context
→ recipient notification
→ recipient review
→ consent/SCA
→ logical payment
→ normal payment execution
```

La demande doit rester distincte du paiement :
- `requestId` ≠ `paymentId` ;
- expiration de la demande ≠ échec financier ;
- une demande peut être refusée sans paiement ;
- l'acceptation doit créer ou référencer une intention financière unique.

## 2. Bill Split

Le partage introduit un agrégat commercial/social :
- une dépense ;
- plusieurs participants ;
- plusieurs montants attendus ;
- plusieurs paiements indépendants ;
- un état d'agrégat dérivé.

Une part réglée ne signifie pas que l'ensemble est réglé.

## 3. Règle d'architecture

Request Money et Bill Split réutilisent P2P pour l'exécution financière. Le Volume I possède leur logique fonctionnelle ; les Volumes II–IV réutilisent les mêmes primitives d'exécution, de plateforme et de résilience.

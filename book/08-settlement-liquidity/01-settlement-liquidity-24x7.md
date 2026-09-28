---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - https://www.ecb.europa.eu/paym/target/tips/html/index.en.html
  - https://www.ebaclearing.eu/services-instant-payments/rt1/
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Settlement et liquidité 24/7/365

## 1. Pourquoi la liquidité est une partie de l'architecture

Une plateforme de paiement instantané peut être :
- disponible ;
- performante ;
- correctement connectée ;
- sans bug ;

et pourtant ne pas pouvoir régler un paiement faute de liquidité disponible au bon endroit.

La liquidité est donc une dépendance fonctionnelle.

## 2. Settlement

Le settlement est la décharge de l'obligation financière par transfert de l'actif de règlement.

Dans TIPS, la BCE décrit :
- règlement temps réel ;
- monnaie banque centrale ;
- finalité immédiate et irrévocable.

RT1 décrit également un modèle de real-time gross settlement en fonds banque centrale immédiatement disponibles.

## 3. DCA

Dans TIPS, un participant peut disposer d'un **Dedicated Cash Account** pour le règlement instantané.

Le DCA doit être traité comme un objet opérationnel critique :
- solde ;
- seuils ;
- mouvements ;
- accès ;
- surveillance ;
- disponibilité ;
- contrôles.

## 4. AS technical account

Les architectures d'ancillary system / CSM peuvent utiliser des comptes techniques selon le modèle TARGET/TIPS applicable.

Le handbook ne généralise pas un schéma de compte à tous les participants. Chaque modèle est documenté à partir des règles de participation du système.

## 5. 24/7/365

Un rail instantané ne s'arrête pas lorsque :
- les équipes trésorerie sont hors bureau ;
- les marchés de liquidité traditionnels sont fermés ;
- c'est le week-end ;
- c'est un jour férié.

Cela implique une architecture d'exploitation continue.

## 6. Modèle de liquidité

```text
Central liquidity
      |
      v
Liquidity transfer / allocation
      |
      v
Instant-payment settlement account
      |
      +--> outgoing instant payments
      |
      <-- incoming instant payments
```

## 7. Indicateurs

- balance ;
- available liquidity ;
- minimum threshold ;
- warning threshold ;
- critical threshold ;
- projected outflow ;
- incoming/outgoing ratio ;
- net position ;
- rejected-for-liquidity ;
- time-to-depletion.

## 8. Prévision

Une architecture mature estime :

```text
expected outgoing flow
+ retry / peak factor
+ merchant campaigns
+ salary dates
+ weekend profile
+ incident buffer
= liquidity need
```

## 9. Scénarios de stress

### S1 — Peak commerce
Volume x5 pendant une campagne commerciale.

### S2 — Incoming flow disappears
Le flux entrant diminue brutalement tandis que le sortant continue.

### S3 — Liquidity transfer unavailable
Le mécanisme permettant de réalimenter le compte est indisponible.

### S4 — Weekend depletion
Le buffer du vendredi est insuffisant.

### S5 — Retry storm
Une dégradation réseau augmente les tentatives techniques et la pression sur les systèmes.

### S6 — Multi-rail imbalance
Une route reçoit beaucoup plus de trafic que prévu.

## 10. Guardrails

- alertes avant seuil critique ;
- prévision ;
- transfert automatique contrôlé lorsque le modèle le permet ;
- runbook d'escalade ;
- séparation des rôles ;
- limites ;
- audit ;
- dashboard 24/7.

## 11. Liquidity vs application retry

La liquidité ne justifie jamais un retry aveugle.

Un paiement rejeté ou ambigu pour une raison de liquidité reste soumis aux règles de statut/idempotence/reconciliation.

## 12. RTO/RPO

Pour la liquidité :
- RTO concerne la capacité à rétablir la gestion/visibilité ;
- RPO concerne les données/positions locales ;
- la vérité settlement ne doit pas être recréée uniquement depuis une base applicative.

## 13. Réconciliation

Après incident :

```text
local ledger
vs
rail/settlement records
vs
account reports/statements
→ differences
→ investigation
→ controlled correction
```

La question centrale est toujours :

> quels paiements ont réellement été réglés ?

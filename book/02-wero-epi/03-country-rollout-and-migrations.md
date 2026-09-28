---
status: REVIEWED
last_verified: 2026-09-28
truth_level: PUBLIC_VERIFIED_AND_REFERENCE
primary_sources:
  - epi-wero-launch-germany-2024
  - epi-wero-launch-france-2024
  - epi-wero-ecommerce-belgium-2026
  - epi-wero-commerce-2026-09
  - epi-wero-luxembourg-2026
  - wero-faq-overview
related_internal_repos: []
---

# Déploiement par pays et architecture de migration

## 1. Un lancement européen n'est pas un big bang

Les sources publiques montrent un déploiement progressif :
- pays ;
- banques ;
- cas d'usage ;
- canaux ;
- marchands ;
- migrations depuis des solutions existantes.

L'architecture doit donc gérer une longue période de coexistence.

## 2. Chronologie utile

### Allemagne — 2024
Le lancement public démarre avec le P2P.

### France — 2024
Wero est introduit comme service de paiement account-to-account dans les applications participantes et/ou via l'expérience Wero selon les établissements.

### Belgique — 2026
L'e-commerce est publiquement annoncé comme live en mars 2026, puis les premiers usages in-store apparaissent dans les communications de septembre.

### Luxembourg — 2026
La migration Payconiq → Wero fournit un exemple concret de transition d'un service domestique vers Wero.

### Pays-Bas
La transition iDEAL → Wero représente une migration particulièrement structurante car iDEAL est déjà largement intégré dans l'écosystème marchand.

## 3. Dimensions d'une migration

~~~text
Customer
Merchant
PSP / Acquirer
APIs
Checkout
QR / deep links
Brand
Directory
Fraud
Reconciliation
Reporting
Contracts
Operations
Support
Settlement path
~~~

Elle ne se réduit pas à changer l'API.

## 4. Coexistence

~~~text
Legacy Scheme / Wallet
       |\
       | \__ existing merchants
       |
       +---- migration adapter / routing
       |
       +---- Wero
                |
                +-- migrated merchants
                +-- new merchants
~~~

Questions :
- combien de temps les deux solutions coexistent ?
- le même marchand accepte-t-il les deux ?
- comment éviter une double présentation ?
- comment traiter les remboursements d'anciennes transactions ?
- quelle solution est source de reporting historique ?

## 5. Merchant migration

Étapes de référence :
1. inventory des intégrations ;
2. classify redirect / QR / API / plugin / mobile ;
3. map credentials ;
4. map order/payment identifiers ;
5. implement new checkout ;
6. dual-run contrôlé ;
7. reconcile old/new ;
8. cutover ;
9. monitor ;
10. retire legacy after refund/dispute tail.

## 6. Customer migration

Le client doit retrouver :
- enrolment ;
- contacts/aliases selon règles ;
- historique pertinent ;
- nouveaux consentements lorsque nécessaires ;
- information claire ;
- support.

Ne jamais supposer qu'une migration technique autorise automatiquement la migration de tous les consentements.

## 7. Alias migration

Un alias doit être traité comme donnée à cycle de vie :
- create ;
- verify ;
- bind ;
- update ;
- revoke ;
- reassign ;
- expire.

Risque critique : un numéro de téléphone réattribué ne doit pas conduire à un paiement vers le mauvais compte.

## 8. QR migration

Si un écosystème domestique possédait déjà un QR :
- identifier format ;
- backward compatibility ;
- dynamic vs static ;
- merchant identifier ;
- amount encoding ;
- signature ;
- expiration ;
- routing.

Un QR est une entrée vers un contexte de paiement ; il ne doit pas contenir plus de données sensibles que nécessaire.

## 9. Observabilité de migration

Dashboards :
- adoption rate ;
- legacy vs Wero volume ;
- conversion ;
- failure rate ;
- abandoned checkout ;
- refund success ;
- merchant incidents ;
- alias errors ;
- duplicate attempts.

## 10. Cutover

Un cutover doit inclure :
- decision authority ;
- freeze ;
- rollback ;
- settlement/reconciliation checkpoint ;
- support desk ;
- participant contacts ;
- communication ;
- incident threshold.

## 11. Tail management

Après arrêt de l'ancien parcours, il reste :
- refunds ;
- returns ;
- disputes ;
- statements ;
- audits ;
- investigations ;
- data retention.

Le legacy doit être retiré seulement lorsque cette queue métier est maîtrisée.

## 12. Leçon d'architecture

Une migration de moyen de paiement est un programme écosystème. Les risques réels se situent souvent dans :
- coexistence ;
- identité ;
- merchant operations ;
- reconciliation ;
- support ;
- historical truth.

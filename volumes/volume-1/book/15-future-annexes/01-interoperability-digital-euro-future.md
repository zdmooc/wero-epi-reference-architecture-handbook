---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - ecb-digital-euro-pilot-2026
  - ecb-digital-euro-fit-2026
  - ecb-digital-euro-pilot-page-2026
  - ecb-payments-strategy-2026
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Partie XIV — Interopérabilité, Digital Euro et architecture européenne future

## 1. Deux transformations simultanées

L'architecture des paiements européens évolue sur deux axes :

1. montée en puissance des solutions privées paneuropéennes et domestiques ;
2. préparation d'une forme numérique de monnaie banque centrale pour les paiements de détail.

Le livre refuse le faux dilemme « Wero ou digital euro ». Les rôles économiques et techniques sont différents.

## 2. Wero

Wero est une solution privée européenne de paiement portée par EPI.

Son architecture publique s'appuie sur :
- PSP participants ;
- services Consumer / Merchant ;
- paiements account-to-account ;
- SCT Inst pour les usages concernés ;
- intégrations avec acquéreurs/merchants.

## 3. Digital euro

Le digital euro est un projet Eurosystème de monnaie banque centrale numérique de détail.

Au 28 septembre 2026 :
- 36 PSP ont été sélectionnés pour participer au pilote ;
- le pilote est prévu au second semestre 2027 pour douze mois ;
- la BCE vise une préparation permettant une éventuelle première émission en 2029 sous hypothèse d'adoption du règlement européen ;
- la décision finale d'émettre n'est prise qu'après adoption de la législation correspondante.

Le livre ne le présente donc pas comme déjà émis.

## 4. Complémentarité public / privé

La BCE décrit explicitement une stratégie de complémentarité entre digital euro et moyens de paiement privés européens.

Axes évoqués publiquement :
- standards communs ;
- co-badging dans certains contextes ;
- réutilisation de standards européens ;
- possibilité pour les acteurs privés de s'appuyer sur des infrastructures/standards communs afin d'étendre leur portée.

Le livre traduit cela en **hypothèses d'architecture**, pas en intégration Wero confirmée.

## 5. Architecture conceptuelle 2030

```text
Customer / Merchant
       |
Multi-service wallet / banking app
       |
Payment choice / policy
       |
+----------------------+----------------------+
| Private A2A schemes  | Public digital money |
| Wero / others        | Digital euro         |
+----------------------+----------------------+
       |
Common acceptance / standards where applicable
       |
Bank / PSP / Acquirer
       |
Settlement / central bank infrastructure
```

Cette vue exprime une coexistence possible ; elle ne préjuge pas du modèle final.

## 6. Interopérabilité entre solutions européennes

L'interopérabilité peut exister à plusieurs niveaux :

### Acceptance
Un même marchand accepte plusieurs moyens de paiement.

### Wallet
Un wallet présente plusieurs instruments.

### Routing
Un PSP choisit un rail accessible.

### Alias/directory
Des mécanismes de résolution peuvent être fédérés ou interconnectés.

### Standards
QR, request-to-pay, API, ISO, identity.

### Settlement
Différents instruments peuvent finir dans des mécanismes distincts tout en partageant certaines infrastructures.

## 7. Ce que signifie « interoperable »

Ne pas réduire à :
“les deux apps parlent directement”.

Interopérabilité peut signifier :
- common acceptance ;
- common technical standard ;
- directory federation ;
- cross-scheme routing ;
- shared settlement capability ;
- co-badging ;
- merchant terminal compatibility.

## 8. Cross-border instant payments

SCT Inst fournit déjà une base paneuropéenne pour les virements instantanés en euro.

Les architectures futures doivent traiter :
- reachability ;
- multi-CSM ;
- participant routing ;
- beneficiary verification ;
- sanctions/AML ;
- FX pour non-euro ;
- one-leg-out scenarios lorsque scheme adapté ;
- global fast-payment interlinking.

## 9. One-Leg-Out

Les use cases One-Leg-Out Instant Credit Transfer appartiennent à un cadre scheme distinct.

Le livre les présente comme extension cross-border et ne mélange pas automatiquement leurs règles avec SCT Inst intra-SEPA.

## 10. FX

Lorsqu'un paiement traverse des devises :

```text
payment initiation
→ rate quotation
→ FX lock / expiry
→ compliance
→ payment execution
→ settlement
→ reconciliation
```

L'FX introduit :
- rate risk ;
- quote expiry ;
- spread/fees ;
- multiple settlement assets ;
- additional timeouts.

## 11. Digital identity

Le cadre européen d'identité numérique peut fournir à terme des building blocks d'identité utilisables par les PSP et wallets.

Mais :
- identité numérique ≠ consentement paiement ;
- wallet identité ≠ wallet paiement ;
- authentification ≠ autorisation financière.

## 12. Agentic commerce

Une tendance future est l'usage d'agents logiciels pour rechercher, négocier ou initier des achats.

Le core financier doit rester contrôlé :

```text
AI Agent
  |
policy / budget / consent
  |
deterministic payment API
  |
fraud / VoP / SCA
  |
financial execution
```

L'agent ne reçoit pas un droit illimité de déplacer des fonds.

## 13. Programmable services

La programmabilité pertinente peut concerner :
- règles de consentement ;
- recurring ;
- conditional merchant flow ;
- escrow-like business logic selon cadre ;
- automated reconciliation ;
- corporate treasury.

Le livre évite le terme “programmable money” lorsqu'il s'agit seulement d'une règle applicative autour d'un paiement.

## 14. Tokenisation et wholesale

Les travaux Eurosystème sur tokenisation/wholesale sont une trajectoire distincte des paiements retail Wero.

Les architectures futures peuvent néanmoins converger sur :
- digital identity ;
- programmable settlement ;
- central bank money ;
- interoperability ;
- common standards.

## 15. Post-quantum

La durée de vie de certains certificats et signatures impose de suivre :
- standards PQC ;
- crypto-agility ;
- inventory ;
- migration ;
- HSM support ;
- partner compatibility.

Le livre classe ce sujet WATCH tant que les exigences opérationnelles Wero/SCT Inst ne l'imposent pas directement.

## 16. Green IT

L'instant payment 24/7 doit être performant sans surprovisionnement aveugle.

Principes :
- rightsizing ;
- autoscaling contrôlé ;
- efficient logging ;
- storage lifecycle ;
- carbon-aware non-critical batch ;
- capacity based on peak/failure ;
- measure cost/carbon per business unit.

La résilience ne doit pas être sacrifiée au Green IT ; le bon objectif est supprimer le gaspillage sans réduire les safety margins indispensables.

## 17. Architecture européenne 2030 — principes

Le livre retient dix principes durables :

1. instant by default where appropriate ;
2. pan-European reach ;
3. central-bank-money settlement where infrastructure provides it ;
4. open standards ;
5. strong identity ;
6. beneficiary verification ;
7. fraud-aware design ;
8. 24/7 operational resilience ;
9. public/private complementarity ;
10. interoperability without collapsing all schemes into one system.

## 18. Watchlist annuelle

Chaque édition revalide :
- Wero country/capability coverage ;
- EPI participant/acquirer announcements ;
- EPC SCT Inst / VoP ;
- TARGET/TIPS ;
- RT1 ;
- PSD3/PSR ;
- digital euro legislation/pilot ;
- Open Finance ;
- EU identity ;
- cross-border fast-payment links ;
- tokenised settlement ;
- PQC.

## 19. Conclusion

La meilleure architecture future n'est pas celle qui prédit un produit gagnant. C'est celle qui garde les couches découplées : expérience, instrument, scheme, message, rail, settlement, identity et infrastructure peuvent évoluer sans imposer une réécriture complète.

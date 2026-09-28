---
status: REVIEWED
last_verified: 2026-09-28
truth_level: PUBLIC_VERIFIED_AND_REFERENCE
primary_sources:
  - ecb-tips-overview
  - ecb-tips-facts-2026
  - ecb-tips-udfs-2026
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# TIPS — modèle de service et conséquences d'architecture

## 1. Rôle de TIPS

TIPS est un service de l'Eurosystème pour le règlement instantané en monnaie banque centrale.

Caractéristiques publiques :
- 24/7/365 ;
- real-time settlement ;
- finalité immédiate et irrévocable ;
- plusieurs devises supportées au 28 septembre 2026 ;
- participation encadrée dans TARGET ;
- comptes dédiés au règlement instantané.

## 2. TIPS n'est pas Wero

~~~text
Wero / Channel
→ Consumer PSP
→ Payment Hub
→ SCT Inst Gateway
→ TIPS
→ Beneficiary PSP
~~~

TIPS intervient au niveau du settlement/rail, pas au niveau de l'expérience utilisateur.

## 3. DCA

Un TIPS Dedicated Cash Account porte les fonds dédiés au règlement instantané.

Questions d'architecture :
- qui possède le compte ?
- qui l'alimente ?
- qui peut initier les instructions ?
- quels seuils de liquidité ?
- qui surveille le solde ?
- quelles règles d'accès et de délégation ?

## 4. Participant, Reachable Party, Instructing Party

Les rôles TIPS doivent être distingués.

### Participant
Détient le compte TIPS selon le modèle applicable.

### Reachable Party
Peut être adressé dans TIPS via un participant.

### Instructing Party
Peut transmettre des instructions au nom d'un participant ou acteur selon le modèle et les accords applicables.

~~~text
Business PSP
→ optional Instructing Party / service provider
→ TIPS
~~~

La délégation technique ne transfère pas automatiquement les obligations métier du participant.

## 5. Settlement interface

Le système local doit séparer :
- préparation du message ;
- connectivité ;
- authentification/certificats ;
- envoi ;
- réception ;
- status ;
- reconciliation.

## 6. Continuous processing

La documentation TIPS décrit un traitement continu 24/7/365 sans downtime planifié pour les instructions.

Conséquence : opérations, supervision, liquidité, certificats, support et incident response doivent être conçus hors modèle heures ouvrées.

## 7. Currency model

TIPS est conçu pour plusieurs devises. Le livre traite l'euro comme scope principal de Wero/SCT Inst mais conserve currency, settlement account, scheme et central bank comme attributs explicites.

## 8. Finality

Une fois le règlement TIPS réalisé selon le modèle applicable :
- ne pas rétrograder localement l'état sur un simple timeout ;
- traiter une réponse perdue comme problème d'observation/reconciliation ;
- préserver la référence externe.

## 9. Availability dependency

Le PSP peut avoir applications, DB et rail adapter disponibles, mais si sa connectivité TIPS ou ses credentials sont indisponibles, l'exécution financière est affectée.

Le SLI doit donc inclure le chemin complet.

## 10. Network

À documenter séparément :
- provider/connectivity model ;
- route ;
- certificates ;
- firewall ;
- endpoint ;
- active/standby links ;
- monitoring.

Ne jamais inventer les détails réseau d'un établissement spécifique.

## 11. Message lifecycle

~~~text
prepare instruction
→ durable local intent
→ submit
→ receive processing/settlement outcome
→ persist
→ publish downstream status
~~~

En cas de rupture après submit :
- UNKNOWN ;
- inquiry/reconciliation.

## 12. Liquidity

Le paiement peut être techniquement valide mais impossible à régler si la liquidité disponible est insuffisante.

Le TIPS adapter doit donc exposer au moins :
- payment health ;
- account/liquidity visibility ;
- connection health ;
- operational alerts.

## 13. Operations

Runbooks :
- lost connectivity ;
- certificate problem ;
- DCA low balance ;
- message reject spike ;
- delayed status ;
- reconciliation break.

## 14. Evidence

Production claims require :
- actual participant model ;
- account model ;
- network evidence ;
- failover evidence ;
- measured latency ;
- operational ownership.

Le handbook reste au niveau PUBLIC_VERIFIED + REFERENCE_ARCHITECTURE.

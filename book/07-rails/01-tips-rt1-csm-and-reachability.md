---
status: REVIEWED
last_verified: 2026-09-28
truth_level: PUBLIC_VERIFIED
primary_sources:
  - https://www.ecb.europa.eu/paym/target/tips/html/index.en.html
  - https://www.ebaclearing.eu/services-instant-payments/rt1/
  - https://www.europeanpaymentscouncil.eu/what-we-do/epc-payment-schemes/sepa-instant-credit-transfer/sepa-instant-credit-transfer-rulebook
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Rails, CSM, TIPS et RT1

## 1. Pourquoi les termes sont souvent confondus

Un paiement Wero peut traverser plusieurs couches :

```text
Wero experience
→ payment orchestration
→ SCT Inst scheme
→ ISO 20022 messages
→ CSM / routing
→ settlement
→ liquidity
```

Aucune de ces couches n'est synonyme des autres.

## 2. Scheme vs infrastructure

### SCT Inst
Définit les règles du scheme.

### TIPS
Service de l'Eurosystème qui fournit le règlement de paiements instantanés en monnaie banque centrale, en temps réel, 24/7/365.

### RT1
Système d'EBA CLEARING pour l'exécution des SCT Inst/OCT Inst avec real-time gross settlement en fonds banque centrale immédiatement disponibles.

## 3. TIPS

Faits publics BCE au 28 septembre 2026 :

- règlement temps réel ;
- monnaie banque centrale ;
- 24/7/365 ;
- finalité immédiate et irrévocable ;
- DCA pour le règlement instantané ;
- participation structurée dans TARGET ;
- support de plusieurs devises dans TIPS au moment de la vérification.

## 4. RT1

Faits publics EBA CLEARING :

- pan-European ;
- real-time gross settlement ;
- 24/7 ;
- fonds banque centrale immédiatement disponibles ;
- SCT Inst et OCT Inst ;
- règlement certain ;
- pas de risque de crédit lié au settlement entre participants ;
- outils de liquidité ;
- interopérabilité avec autres CSM SCT Inst ;
- interface permettant des transactions se réglant dans RT1 et TIPS ;
- options de settlement via TIPS DCA / AS technical account selon le modèle public décrit.

## 5. Correction d'une confusion fréquente

Incorrect :

```text
TIPS = central bank money
RT1  = commercial bank money / deferred settlement
```

Correct :

```text
TIPS
= Eurosystem instant settlement service
= real-time settlement in central bank money

RT1
= EBA CLEARING pan-European instant-payment system
= real-time gross settlement
= immediately available central-bank funds
```

La différence porte sur le modèle de service, la gouvernance, la participation, la connectivité et le fonctionnement, pas sur une opposition simpliste central/commercial money.

## 6. Reachability

L'architecture doit pouvoir répondre :

- le beneficiary PSP est-il reachable ?
- via quel CSM ?
- direct ou indirect ?
- quelles règles de participant ?
- quelle route primaire ?
- quelles routes alternatives ?
- quelles contraintes de liquidity ?

## 7. Multi-CSM

Architecture de référence :

```text
Payment Hub
    |
    v
Rail / CSM Router
    |
    +--> Adapter A
    |
    +--> Adapter B
    |
    +--> Adapter C
```

Le routage peut considérer :
- reachability ;
- participant membership ;
- coût ;
- capacité ;
- disponibilité ;
- policy ;
- maintenance ;
- liquidité.

## 8. Fallback

Le fallback n'est **pas** :

```text
timeout on CSM-A
→ resend same financial payment on CSM-B
```

Cela peut créer un double paiement.

Le fallback sûr nécessite d'abord de déterminer si l'effet a eu lieu.

## 9. STET

Le livre conserve STET comme CSM européen pertinent lorsqu'un service/participant utilise sa connectivité.

Les détails STET doivent être vérifiés sur les sources officielles propres au service avant toute affirmation de mode de settlement, participants ou SLA.

## 10. Architecture de connexion

```text
Payment Hub
→ ISO adapter
→ CSM gateway
→ secure connectivity
→ CSM
→ settlement mechanism
→ status
→ reconciliation
```

La couche network/PKI est donc directement liée au rail.

## 11. Observabilité multi-rail

Par rail :
- connected / disconnected ;
- reachable parties ;
- latency ;
- reject rate ;
- UNKNOWN rate ;
- liquidity position ;
- queue/backlog ;
- certificate expiry ;
- reconciliation gap.

## 12. Principe de publication

Toute comparaison TIPS/RT1/STET doit :
- dater les faits ;
- utiliser sources primaires ;
- distinguer scheme / CSM / settlement ;
- éviter les raccourcis marketing ;
- expliquer les implications architecturales.

---
status: REVIEWED
last_verified: 2026-09-28
truth_level: PUBLIC_VERIFIED_AND_REFERENCE
primary_sources:
  - eba-clearing-rt1
  - eba-clearing-rt1-access
  - eba-clearing-rt1-pfmi
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# RT1 — service, participation et settlement

## 1. Rôle

RT1 est un système pan-européen d'EBA CLEARING pour les paiements instantanés, notamment SCT Inst, opérant 24/7.

Les sources publiques le décrivent comme :
- real-time gross settlement ;
- en fonds banque centrale immédiatement disponibles ;
- avec finalité et sans risque de crédit lié au settlement entre participants ;
- interopérable avec d'autres CSM SCT Inst ;
- doté d'outils de liquidité 24/7.

## 2. Modèle de fonds

Le PFMI disclosure RT1 décrit une funds balance par participant, alimentée en monnaie banque centrale via le modèle de compte technique applicable.

Invariant :
- une position ne peut pas devenir négative ;
- une transaction qui dépasserait la liquidité disponible est rejetée selon le fonctionnement du système.

## 3. RT1 et TIPS

RT1 est distinct de TIPS mais utilise l'infrastructure TIPS dans son modèle de compte technique et propose des capacités d'interaction avec TIPS.

~~~text
RT1 payment system
→ participant positions / processing
→ TIPS technical-account settlement context
~~~

## 4. Access models

Les sources EBA CLEARING décrivent plusieurs modes :
- participant connecté directement ;
- serviced participant ;
- addressable PSP ;
- technical service provider ;
- liquidity provider.

~~~text
PSP
├─ direct connection
├─ technical provider
└─ serviced model
      ├─ connectivity provider
      └─ liquidity provider
~~~

## 5. Serviced participant

Conséquences :
- responsabilité métier reste au PSP selon contrat/règles ;
- dépendance à un fournisseur ;
- RTO/RPO fournisseur ;
- concentration risk ;
- DORA third-party mapping ;
- exit plan.

## 6. Addressable PSP

Un PSP peut être reachable via un participant.

Le routing doit donc distinguer :
- participant direct ;
- addressable/reachable PSP ;
- intermediary relationship.

## 7. Reachability

RT1 annonce une reachability pan-européenne via plusieurs mécanismes.

Le moteur de route doit maintenir :
- destination ;
- preferred CSM ;
- addressability ;
- route health ;
- fallback rules.

## 8. Liquidity provider

Si un participant dépend d'un liquidity provider :
- contractual SLA ;
- limits ;
- operating model ;
- monitoring ;
- emergency contact ;
- fallback ;
- concentration.

## 9. Single interface capabilities

EBA CLEARING décrit des options permettant aux participants d'utiliser l'interface RT1 pour des transactions se réglant dans RT1 et TIPS.

Conséquence :
- ne pas déduire que le backend financier est identique ;
- conserver destination et settlement context explicites.

## 10. Routing data

~~~text
participantDirectory
- pspId
- directRt1
- addressableRt1
- tipsReachable
- technicalProvider
- liquidityProvider
- routePriority
- effectiveFrom
- effectiveTo
~~~

## 11. Operational availability

24/7 implique :
- active monitoring ;
- certificate management ;
- support on-call ;
- liquidity supervision ;
- participant directory updates ;
- change windows controlled.

## 12. Testing

L'intégration requiert :
- connectivity tests ;
- message validation ;
- negative paths ;
- failover tests ;
- regression pack.

## 13. Incident

Examples :
- RT1 connection down ;
- technical provider down ;
- liquidity provider unavailable ;
- participant addressability wrong ;
- reject spike ;
- position low ;
- TIPS-related technical dependency issue.

## 14. Reconciliation

Store :
- RT1 reference ;
- SCT Inst identifiers ;
- participant ;
- settlement evidence ;
- local ledger ;
- merchant/customer status.

## 15. Rule

RT1 ne doit jamais être résumé à un autre réseau. C'est un système de paiement avec modèle de participation, reachability, liquidité, exploitation et settlement.

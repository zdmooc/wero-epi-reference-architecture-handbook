---
status: REVIEWED
last_verified: 2026-09-28
truth_level: PUBLIC_VERIFIED
primary_sources:
  - https://www.europeanpaymentscouncil.eu/document-library/rulebooks/2025-sepa-instant-credit-transfer-rulebook-version-11
  - https://www.europeanpaymentscouncil.eu/what-we-do/epc-payment-schemes/sepa-instant-credit-transfer/sepa-instant-credit-transfer-rulebook
  - https://eur-lex.europa.eu/eli/reg/2024/886/oj
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# SCT Inst — cycle de vie, timeout et exceptions

## 1. Baseline 2026

Au 28 septembre 2026 :

- le Rulebook SCT Inst courant est le **2025 SCT Inst Rulebook v1.1** ;
- il est effectif depuis le 5 octobre 2025 ;
- l'EPC indique qu'il reste le rulebook courant jusqu'au 21 novembre 2027 à 03:30 CET ;
- le format d'adresse non structuré n'est plus permis à partir du 15 novembre 2026 ;
- le scheme est aligné sur les obligations pertinentes de l'Instant Payments Regulation.

## 2. Objectif

SCT Inst fournit un scheme pan-européen de virement instantané en euros avec disponibilité permanente et fonds rendus disponibles dans les délais du scheme/réglementation applicable.

## 3. Flux normal conceptuel

```text
Payer
→ Payer PSP
→ validations / funds / controls
→ SCT Inst instruction
→ CSM / settlement infrastructure
→ Payee PSP
→ beneficiary account credited
→ confirmation
→ payer informed
```

## 4. Les 10 secondes

Regulation (EU) 2024/886 fixe des exigences légales autour de la mise à disposition des fonds et de la confirmation dans un délai de 10 secondes pour le périmètre concerné.

Le livre distingue :
- limite légale ;
- timeout interne ;
- budget réseau ;
- budget CSM ;
- SLO applicatif.

Ces notions ne sont pas interchangeables.

## 5. Timeout

Un timeout local peut correspondre à plusieurs réalités :

```text
A. instruction jamais reçue
B. instruction reçue mais non traitée
C. instruction traitée, réponse perdue
D. settlement fait, notification perdue
E. dépendance externe indisponible
```

Conclusion :

> absence de réponse ≠ preuve d'échec financier.

## 6. UNKNOWN

État de référence :

```text
SUBMITTED
→ timeout / connection loss
→ UNKNOWN
→ inquiry / status / reconciliation
→ SETTLED | REJECTED | RECOVERY_REQUIRED
```

## 7. Codes de raison

Les codes précis doivent être interprétés dans le contexte du rulebook/IG.

Exemple important :
- `AB05` et `AB06` peuvent représenter des familles de timeout dans des contextes SCT Inst ;
- ne jamais transformer un code générique en un scénario universel sans vérifier la documentation applicable.

## 8. Recall / cancellation

Le recall est séparé du timeout.

```text
payment already submitted/settled
→ recall/cancellation request
→ counterparty/scheme processing
→ accepted / rejected / investigation
```

Le `camt.056` est une demande d'annulation/rappel, pas une stratégie de retry.

## 9. Return

Un return :
- référence l'opération originale ;
- crée une opération financière de retour ;
- préserve l'audit.

## 10. R-transactions

Le modèle doit distinguer :
- reject ;
- return ;
- recall ;
- cancellation request ;
- investigation ;
- status request.

Ces objets ont des causes, timings et conséquences différentes.

## 11. Idempotence

La protection anti-doublon doit exister :
- canal ;
- orchestration ;
- Payment Hub ;
- rail adapter ;
- consumer de callback/event.

Une clé stable d'intention évite qu'un retry transport devienne un deuxième paiement.

## 12. VoP avant autorisation

L'Instant Payments Regulation impose un service de verification of payee dans le périmètre prévu. Le résultat de VoP doit être présenté avant l'autorisation du crédit transfer selon le cadre applicable.

Le détail de VoP est traité dans la partie sécurité/fraude.

## 13. Observabilité

Métriques minimales :
- initiation → submission ;
- submission → rail acknowledgment ;
- submission → final result ;
- p95/p99/p99.9 ;
- UNKNOWN rate ;
- reject rate by reason ;
- inquiry rate ;
- duplicate rate ;
- reconciliation backlog.

## 14. Test matrix

```text
success
reject
timeout-before-effect
timeout-after-effect
delayed-status
duplicate-message
duplicate-callback
out-of-order-callback
participant-unavailable
CSM-unavailable
reconciliation-recovery
```

---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - epc-sct-inst-2025-v1.1
  - epc-sct-inst-igs-2025-v1.0
  - epc-sct-inst-reason-codes-2025-v7
  - eu-ipr-2024-886
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Partie V — SCT Inst : cycle de vie, erreurs et investigation

## Scheme, pas moteur technique

SCT Inst définit des règles communes pour un virement instantané en euro. Le scheme n'impose pas l'architecture applicative interne de chaque PSP.

Il faut donc distinguer :

```text
EPC scheme rules
    |
PSP implementation
    |
CSM / settlement path
```

## Baseline temporelle 2026

L'EPC indique pour le rulebook 2025 :

- disponibilité permanente du scheme ;
- un budget total de neuf secondes pour le traitement scheme décrit ;
- possibilité d'accords bilatéraux/multilatéraux plus courts.

Un SLA applicatif interne ne doit pas consommer la totalité de ce budget.

### Latency budget de référence

Exemple d'allocation architecturale, non normative :

```text
Channel / SCA             1000 ms
Risk / VOP                 800 ms
Payment orchestration      300 ms
Core / ledger              400 ms
Rail adapter               200 ms
Network / CSM / peer      4500 ms
Safety margin             1800 ms
-------------------------------
Total                     9000 ms
```

Ce budget est un exercice de design, pas une distribution EPC officielle.

## Happy path

```text
Payer
 |
Originator PSP
 | pacs.008
 v
CSM / settlement path
 |
 v
Beneficiary PSP
 | credit beneficiary
 | pacs.002 positive confirmation
 v
Originator PSP
 |
Payer status
```

## Rejet

Un rejet doit être distingué selon son moment :

- avant soumission ;
- validation scheme ;
- PSP bénéficiaire ;
- infrastructure ;
- timeout ;
- compte destinataire.

L'application doit stocker :

- reason code ;
- actor/failure domain ;
- timestamp ;
- external references ;
- retryability ;
- customer-safe message.

## Timeout n'est pas un seul cas

### Timeout before effect

Le système peut établir que l'opération n'a pas été acceptée ou n'existe pas.

Recovery possible :

- retry contrôlé du même logical payment selon contrat.

### Timeout after possible effect

Le système ne peut pas savoir si le paiement a été exécuté.

State :
`UNKNOWN`.

Recovery :

- inquiry ;
- status investigation ;
- reconciliation ;
- jamais nouveau paiement aveugle.

## Codes timeout

Les IG 2025 incluent notamment :

- `AB05 TimeoutCreditorAgent` ;
- `AB06 TimeoutInstructedAgent`.

Le code doit être traité selon son contexte exact. Le livre évite la fausse règle « tout timeout = AB04 » ou « tout timeout = recall ».

## UNKNOWN ≠ FAILED

```text
FAILED
= résultat négatif connu

UNKNOWN
= résultat financier non établi localement
```

La distinction change :

- UI ;
- retry ;
- accounting ;
- operations ;
- incident response ;
- customer support.

## Investigation

Le scheme prévoit un dataset de status investigation utilisant `pacs.028.001.03`.

Architecture :

```text
UNKNOWN
  |
create InvestigationCase
  |
pacs.028 / rail inquiry
  |
receive status / external evidence
  |
reconcile
  |
close case
```

Le case management peut être technique ou outillé ; le besoin fonctionnel reste le même.

## Duplicate protection

Deux niveaux :

### Transport/message duplicate
Exemple : même message reçu deux fois.

### Business duplicate
Exemple : utilisateur appuie deux fois et crée deux requêtes différentes pour la même intention.

Contrôles :

- MsgId uniqueness ;
- business idempotency key ;
- semantic payload hash ;
- durable intent ;
- ledger uniqueness ;
- outbox dedup.

## Recall

Un recall est une demande postérieure au paiement suivant les règles du scheme.

Il ne doit pas être utilisé comme mécanisme automatique de compensation de tous les timeouts.

Flow simplifié :

```text
Originator PSP
  |
  | camt.056
  v
Beneficiary side
  |
  +--> negative response -> camt.029
  |
  +--> positive return -> pacs.004
```

## Request for Recall by the Originator

Le rulebook distingue les use cases de recall et de Request for Recall by the Originator. Le livre conserve cette différence au lieu de tout appeler « annulation ».

Conséquence :

- UI client ;
- droits ;
- délais ;
- reason ;
- acceptation côté bénéficiaire ;
- états opérationnels
doivent être modélisés explicitement.

## Return

Un return est un mouvement financier de retour.

Ledger :

```text
PAYMENT +100
RETURN  -100
```

On ne modifie pas rétroactivement le paiement original en `FAILED`.

## Reconciliation

Trois niveaux :

### Intraday
Résoudre rapidement UNKNOWN et mismatches.

### End-of-day / periodic
Comparer volumes, montants, statuts et comptes.

### Incident recovery
Reconstituer une vérité après panne.

Minimum reconciliation key set :

- EndToEndId ;
- TxId ;
- paymentId ;
- amount/currency ;
- originator/beneficiary references ;
- timestamps ;
- final status.

## 24/7/365 operational impact

Instant payment means :

- astreinte ;
- certificate monitoring ;
- no overnight batch dependency for critical path ;
- always-on fraud/risk ;
- always-on reconciliation ;
- liquidity monitoring outside classical business hours ;
- controlled maintenance.

## Change 15 November 2026

Le rulebook 2025 v1.1 fixe au 15 novembre 2026 la fin de l'utilisation de l'adresse non structurée dans les messages EPC concernés.

Pour l'architecte :

- data model ;
- validation ;
- API ;
- mapping ISO ;
- migration ;
- test de non-régression
doivent être alignés avant la date applicable.

## Rulebook upgrade strategy

Chaque upgrade suit :

```text
new rulebook
-> impact analysis
-> message diff
-> data diff
-> validation rules
-> operational rules
-> compatibility window
-> test pack
-> deployment
-> evidence
```

## Conclusion

Le vrai défi SCT Inst n'est pas uniquement d'envoyer un `pacs.008` vite. C'est de maintenir une vérité financière cohérente face aux délais, duplications, pertes de réponse, retours et investigations.

---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - epc-sct-inst-igs-2025-v1.0
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Partie IV — ISO 20022 de bout en bout

## 1. ISO 20022 n'est pas un rail

ISO 20022 fournit un modèle de messages financiers. Il ne décide pas à lui seul :
- quel scheme est utilisé ;
- quel CSM route ou traite le paiement ;
- où a lieu le settlement ;
- quelle liquidité est disponible ;
- quelle application bancaire orchestre la transaction.

Dans ce livre :

```text
Business intent
  -> scheme rules
  -> ISO 20022 message
  -> CSM / settlement path
  -> financial outcome
```

Chaque couche garde son vocabulaire et sa responsabilité.

## 2. Baseline SCT Inst 2025

Les Implementation Guidelines EPC SCT Inst 2025 utilisent la version 2019 du standard ISO 20022 et définissent notamment les messages inter-PSP suivants :

| Usage | Message SCT Inst 2025 |
|---|---|
| Instruction inter-PSP | `pacs.008.001.08` |
| Confirmation positive/négative | `pacs.002.001.10` |
| Recall | `camt.056.001.08` |
| Réponse négative au recall | `camt.029.001.09` |
| Retour / réponse positive au recall | `pacs.004.001.09` |
| Status investigation | `pacs.028.001.03` |

Ces numéros de version sont **version-sensitive**. Une future édition doit les revalider contre le rulebook et les IG applicables.

## 3. pacs.008 — l'instruction

Le `pacs.008` transporte une instruction FI-to-FI Customer Credit Transfer.

Pour l'architecte, les questions essentielles ne sont pas seulement XML :

- quel identifiant métier est transporté ?
- quel identifiant de message est unique ?
- comment relier le message au paiement du canal ?
- quels agents payeur/bénéficiaire sont identifiés ?
- quel montant et quelle devise ?
- quelle information de remittance ?
- quels contrôles ont déjà été effectués ?
- que se passe-t-il si le message est dupliqué ?

### Modèle canonique simplifié

```xml
<Document>
  <FIToFICstmrCdtTrf>
    <GrpHdr>
      <MsgId>...</MsgId>
      <CreDtTm>...</CreDtTm>
      <NbOfTxs>1</NbOfTxs>
    </GrpHdr>
    <CdtTrfTxInf>
      <PmtId>
        <InstrId>...</InstrId>
        <EndToEndId>...</EndToEndId>
        <TxId>...</TxId>
      </PmtId>
      <IntrBkSttlmAmt Ccy="EUR">...</IntrBkSttlmAmt>
      ...
    </CdtTrfTxInf>
  </FIToFICstmrCdtTrf>
</Document>
```

Cet extrait est pédagogique, pas un XML complet conforme aux IG.

## 4. Identifiants : ne pas tout mettre dans correlationId

Une architecture robuste distingue :

| Identifiant | Usage |
|---|---|
| `paymentId` | identifiant interne du paiement |
| `businessIntentKey` | idempotence métier |
| `EndToEndId` | référence de bout en bout |
| `InstrId` | instruction |
| `TxId` | transaction inter-PSP |
| `MsgId` | message ISO |
| `paymentRequestId` | demande marchand |
| `eventId` | événement asynchrone |
| `traceId` | trace technique |
| `correlationId` | corrélation technique/application |

Un `traceId` ne doit pas devenir la seule clé d'audit financier.

## 5. pacs.002 — confirmation et statut

Dans les IG SCT Inst 2025 :
- le même message `pacs.002.001.10` sert à transporter les confirmations ;
- `RJCT` est utilisé pour une confirmation négative ;
- `ACCP` est utilisé pour la confirmation positive du use case SCT Inst décrit par les IG.

### ACCP

Dans ce contexte, **ACCP signifie AcceptedCustomerProfile**.

Le livre ne doit pas inventer d'autres expansions. Il ne faut pas non plus interpréter automatiquement ACCP comme une garantie commerciale de commande livrée.

## 6. Reason codes

Une erreur technique devient exploitable seulement si :
- elle est correctement classifiée ;
- le système sait si l'effet financier a pu se produire ;
- une politique de recovery est associée.

Exemples présents dans les IG :

| Code | Sens |
|---|---|
| `AB05` | TimeoutCreditorAgent |
| `AB06` | TimeoutInstructedAgent |
| `AB07` | OfflineAgent |
| `AB08` | OfflineCreditorAgent |
| `AM05` | Duplication |
| `AC01` | IncorrectAccountNumber |

La présence d'un timeout scheme ne justifie pas la règle simpliste « pas de pacs.002 → camt.056 ». L'investigation et le recall sont des processus distincts.

## 7. pacs.028 — investigation de statut

Le `pacs.028.001.03` est utilisé dans les IG pour des demandes de statut, notamment :
- investigation du statut d'une transaction SCT Inst ;
- demande de mise à jour de statut sur un recall/request for recall.

Le pattern architectural général :

```text
local UNKNOWN
  |
  v
status investigation
  |
  v
authoritative response/reconciliation
  |
  +--> SETTLED
  +--> FAILED / REJECTED
  +--> still pending investigation
```

## 8. camt.056, camt.029, pacs.004

### camt.056
FI-to-FI Payment Cancellation Request. Dans les IG SCT Inst, il porte les processus de recall/request for recall prévus.

### camt.029
Resolution of Investigation. Il peut porter une réponse négative au recall.

### pacs.004
Payment Return. Dans les IG, il porte la réponse positive/retour financier correspondant.

Pattern :

```text
request recall
  camt.056
     |
     v
decision beneficiary side
     |
     +--> refuse -> camt.029
     |
     +--> accept -> pacs.004 / return
```

## 9. Cash-management messages

`camt.052`, `camt.053`, `camt.054` appartiennent à la famille cash-management/reporting.

Le livre les traite dans la réconciliation et le reporting bancaire. Il ne les place pas artificiellement dans le cœur SCT Inst `pacs.008 → pacs.002`.

Le marchand Wero n'est pas supposé recevoir directement un `camt.054`. Dans une architecture merchant moderne, il reçoit plus probablement un statut API/webhook de son PSP, tandis que les messages bancaires restent derrière cette frontière.

## 10. Business Application Header

Le BAH, lorsqu'il est utilisé dans le contexte cible, sépare l'enveloppe/application header du payload métier.

Questions d'architecture :
- identité expéditeur/destinataire ;
- identifiant de message ;
- service ;
- date/heure ;
- signature/transport selon infrastructure.

Le header n'annule pas le besoin d'identifiants métier dans le document.

## 11. Validation en couches

```text
XML well-formed
  != XSD valid
  != ISO model valid
  != EPC IG compliant
  != scheme-valid
  != business-valid
  != financially successful
```

Pipeline conseillé :

1. parsing ;
2. namespace/version ;
3. XSD/TVS ;
4. règles IG ;
5. règles scheme ;
6. données métier ;
7. risque/compliance ;
8. exécution ;
9. reconciliation.

## 12. Versioning

Une plateforme ne doit pas disperser les versions ISO dans le code.

Catalogue recommandé :

```text
scheme
rulebook-version
message-function
iso-message
namespace
effective-from
effective-until
xsd
validation-rules
migration-notes
```

## 13. Mapping API ↔ ISO

L'API du canal ne doit pas exposer mécaniquement chaque champ ISO.

Exemple :

```json
{
  "paymentRequestId": "PR-...",
  "amount": {"value": "42.50", "currency": "EUR"},
  "creditor": {"alias": "..."},
  "idempotencyKey": "..."
}
```

Le payment domain enrichit ensuite le modèle canonique avant génération du message ISO.

Avantages :
- isolation du canal ;
- versioning ;
- contrôle ;
- meilleure testabilité ;
- remplacement possible du rail.

## 14. Contrats de test

Un test ISO sérieux couvre :
- message nominal ;
- champ obligatoire absent ;
- format invalide ;
- code non autorisé ;
- duplicate MsgId ;
- duplicate business intent ;
- mismatch identifiants ;
- status inconnu ;
- timeout ;
- recall ;
- investigation ;
- changement de version.

## 15. Règle d'or

**Le XML est un contrat, pas l'architecture entière.**

L'architecte doit comprendre à la fois le message, son contexte de scheme, l'effet financier, le transport, le settlement et la recovery.

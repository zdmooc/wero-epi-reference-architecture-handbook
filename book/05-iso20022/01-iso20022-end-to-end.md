---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - https://www.europeanpaymentscouncil.eu/what-we-do/epc-payment-schemes/sepa-instant-credit-transfer/sepa-instant-credit-transfer-rulebook
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# ISO 20022 de bout en bout

## 1. ISO 20022 n'est pas « du XML »

ISO 20022 fournit :
- un modèle métier ;
- une méthodologie de modélisation ;
- un catalogue de messages ;
- des structures de données riches ;
- des identifiants et relations utiles à l'automatisation.

XML est une syntaxe de représentation fréquemment utilisée.

## 2. Familles principales

| Famille | Usage |
|---|---|
| pain | customer-to-PSP initiation / mandates |
| pacs | inter-PSP / financial institution payment messages |
| camt | cash management, reporting, investigation |
| admi | administration |
| acmt | account management |
| reda | reference data |

## 3. SCT Inst et version ISO

Au 28 septembre 2026, l'EPC indique que les Implementation Guidelines du SCT Inst Rulebook 2025 v1.1 sont basées sur la **version ISO 20022 de 2019**.

Règle éditoriale : les numéros exacts de messages utilisés par le scheme sont validés contre l'Implementation Guideline applicable, jamais déduits uniquement du catalogue ISO global.

## 4. pacs.008

Rôle :
**FIToFICustomerCreditTransfer**.

Contenu conceptuel :
- identification message ;
- debtor / debtor agent ;
- creditor / creditor agent ;
- montant ;
- devise ;
- identifiants transaction ;
- remittance ;
- service level ;
- purpose lorsque applicable.

Le message représente l'instruction interbancaire. Il ne prouve pas seul que le settlement est terminé.

## 5. pacs.002

Rôle :
**FIToFIPaymentStatusReport**.

Il transporte le statut du traitement d'un message financier.

Le sens précis d'un statut dépend :
- du scheme ;
- du moment ;
- de l'agent ;
- des Implementation Guidelines.

Le handbook interdit de traduire un code en une promesse métier sans contexte.

## 6. pacs.004

Rôle :
**PaymentReturn**.

Utilisé pour retourner des fonds conformément aux règles applicables après une opération initiale.

Un return est une nouvelle opération corrélée à l'original, pas un effacement de l'historique.

## 7. pacs.028

Rôle :
status request / investigation selon le contexte d'usage défini par le scheme.

Architecture :
```text
local UNKNOWN
→ status request / inquiry
→ authoritative response
→ reconciliation
```

## 8. camt.056

Rôle :
**FIToFIPaymentCancellationRequest**.

Important :
- ce n'est pas un mécanisme générique de timeout ;
- envoyer `camt.056` ne garantit pas l'annulation ;
- l'état du paiement original et les règles de scheme déterminent la suite.

## 9. camt.029

Rôle :
**ResolutionOfInvestigation**.

Il peut transporter la résolution d'une investigation, par exemple une réponse liée à une demande d'annulation/recall selon le contexte.

## 10. camt.052 / .053 / .054

Ces messages servent au reporting/cash management :

- `camt.052` : account report intraday ;
- `camt.053` : account statement ;
- `camt.054` : debit/credit notification.

Ils sont essentiels pour :
- rapprochement ;
- comptabilité ;
- investigation ;
- audit.

Ils ne doivent pas être présentés comme le cœur du transport instantané `pacs.008/pacs.002`.

## 11. Business Application Header

Le BAH fournit des métadonnées applicatives :
- expéditeur ;
- destinataire ;
- BizMsgIdr ;
- MsgDefIdr ;
- service métier ;
- création ;
- priorité lorsque applicable.

Le header et le message doivent rester cohérents.

## 12. Chaîne d'identifiants

| Niveau | Identifiants |
|---|---|
| API | idempotencyKey, correlationId |
| Merchant | merchantOrderId |
| Acceptor | paymentRequestId, acceptorPaymentId |
| Payment Hub | paymentId |
| ISO | MsgId, InstrId, EndToEndId, TxId |
| Return/investigation | OrgnlMsgId, OrgnlEndToEndId, OrgnlTxId |
| Settlement | infrastructure-specific reference |
| Observability | traceId/spanId |

## 13. Exemple conceptuel pacs.008

```xml
<Document>
  <FIToFICstmrCdtTrf>
    <GrpHdr>
      <MsgId>MSG-20260928-00001</MsgId>
      <CreDtTm>2026-09-28T10:15:30Z</CreDtTm>
    </GrpHdr>
    <CdtTrfTxInf>
      <PmtId>
        <InstrId>INS-00001</InstrId>
        <EndToEndId>E2E-ORDER-45821</EndToEndId>
        <TxId>TX-RAIL-93822</TxId>
      </PmtId>
      <IntrBkSttlmAmt Ccy="EUR">42.50</IntrBkSttlmAmt>
    </CdtTrfTxInf>
  </FIToFICstmrCdtTrf>
</Document>
```

Cet exemple est volontairement incomplet et pédagogique. Il ne remplace jamais un XSD ou une Implementation Guideline EPC.

## 14. Validation

Pipeline recommandé :

```text
syntactic XML validation
→ XSD
→ ISO structural rules
→ scheme implementation rules
→ participant/business rules
→ sanctions/fraud/control rules
```

Un XML valide peut donc rester invalide au niveau scheme ou business.

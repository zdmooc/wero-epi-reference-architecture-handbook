---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - epc-sct-inst-igs-2025-v1.0
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# pacs.008 et pacs.002 — instruction et confirmation

## Le couple principal

Dans la baseline EPC SCT Inst 2025 :

- pacs.008.001.08 porte l'instruction inter-PSP ;
- pacs.002.001.10 porte la confirmation/statut prévu par le profil.

Les règles exactes de champs proviennent des Implementation Guidelines.

## pacs.008 — structure conceptuelle

~~~xml
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
      <IntrBkSttlmAmt Ccy="EUR">42.50</IntrBkSttlmAmt>
      ...
    </CdtTrfTxInf>
  </FIToFICstmrCdtTrf>
</Document>
~~~

Extrait pédagogique seulement.

## Group Header

Architecture concerns :

- uniqueness MsgId ;
- timestamp ;
- number of transactions ;
- settlement context ;
- agents lorsque requis.

Même si le scheme limite certains messages à une transaction, l'implémentation doit suivre l'IG et non une supposition générique.

## Payment Identification

InstrId :

- instruction identifier.

EndToEndId :

- end-to-end business correlation.

TxId :

- transaction identifier.

Le mapping interne doit survivre aux retries et investigations.

## Amount

Contrôles :

- decimal precision ;
- currency ;
- positive amount ;
- limits ;
- no binary floating point ;
- immutable after authorization.

## Parties and agents

Concepts :

- debtor ;
- creditor ;
- debtor agent ;
- creditor agent.

Data minimisation :

- seulement les données requises ;
- structured address rules selon version applicable ;
- privacy.

## pacs.002

Purpose :

- communiquer le résultat/statut du traitement.

Conceptual fields :

- original message reference ;
- transaction reference ;
- status ;
- reason ;
- agent/context.

## Positive confirmation

Un statut positif doit être interprété exactement selon le scheme et la position dans le flow.

Le livre évite de traduire tout code positif en simple SUCCESS UX sans vérifier finalité et contexte.

## Negative confirmation

Store :

- external status ;
- reason code ;
- actor ;
- timestamp ;
- original refs ;
- customer-safe mapping.

## ACCP

Dans ISO 20022, ACCP correspond à AcceptedCustomerProfile dans le catalogue de statuts concerné.

Règle importante :
ne pas inventer d'expansion de code.

Dans le contexte SCT Inst, l'interprétation du statut doit être celle de l'Implementation Guideline.

## Duplicate pacs.008

Le receiving side doit pouvoir détecter les doublons selon scheme/identifiers.

Côté application :

- ne pas générer un nouveau EndToEndId pour contourner un duplicate ;
- traiter la reprise à partir du même logical payment.

## Lost pacs.002

Cas :

~~~text
pacs.008 accepted
→ payment processed
→ pacs.002 lost / network failure
→ originator UNKNOWN
~~~

Recovery :

- status investigation ;
- reconciliation ;
- external authoritative evidence.

## Error mapping

Do not expose raw reason directly.

Three levels :

- scheme code ;
- internal reason category ;
- customer message.

## XML security

Controls :

- disable unsafe XML external entity resolution ;
- schema validation ;
- size limits ;
- namespace validation ;
- canonical logging policy ;
- protect sensitive payload.

## Testing

For pacs.008:

- nominal ;
- invalid amount ;
- duplicate ;
- missing mandatory field ;
- bad BIC/IBAN data ;
- wrong namespace ;
- unsupported version.

For pacs.002:

- positive ;
- negative ;
- unknown reason ;
- duplicate ;
- delayed ;
- out of order.

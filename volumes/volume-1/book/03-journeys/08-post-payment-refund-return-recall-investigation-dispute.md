---
status: COLLECTION_V2_REVIEWED
last_verified: 2026-09-29
truth_level: MIXED
primary_sources:
  - epc-sct-inst-2025-v1.1
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Après-paiement : Refund, Return, Recall, Investigation et Dispute

Ces notions ne doivent pas être présentées comme cinq use cases équivalents au P2P.

## Refund — contexte commercial

Un refund est une décision commerciale produisant un nouveau mouvement financier lié au paiement initial.

```text
originalPaymentId
→ refundRequest
→ refundPaymentId
→ execution
→ merchant/customer reconciliation
```

Le paiement original reste historiquement réglé ; le remboursement est un mouvement distinct.

## Return — processus financier/scheme

Le return correspond à un retour de fonds selon le mécanisme applicable. Le détail normatif et les messages appartiennent au Volume II.

## Recall

Le recall est une **demande** de récupération d'un transfert antérieur selon les règles applicables. Une demande de recall ne permet pas de réécrire localement le paiement original comme s'il n'avait jamais existé.

## Investigation

L'investigation traite un état incertain ou une divergence de preuve.

Exemple :
`SUBMITTED → local timeout → UNKNOWN → inquiry/reconciliation → SETTLED or NOT_SETTLED`.

Pendant `UNKNOWN`, la création automatique d'un paiement de remplacement est interdite.

## Dispute

Le dispute peut impliquer support client, règles de service, responsabilité et processus juridique/opérationnel. Il est plus large qu'un message ISO 20022 ou une R-transaction.

## Taxonomie canonique

| Concept | Nature | Le paiement original disparaît ? |
|---|---|---|
| Refund | commercial + nouveau mouvement | non |
| Return | scheme/financial | non |
| Recall | demande de récupération | non |
| Investigation | résolution de preuve/statut | non |
| Dispute | processus métier/opérationnel | non |

## Frontière avec Volume II

Le Volume I définit l'intention, les acteurs et l'expérience. Le Volume II est l'autorité pour les messages, règles SCT Inst et séquences normatives.

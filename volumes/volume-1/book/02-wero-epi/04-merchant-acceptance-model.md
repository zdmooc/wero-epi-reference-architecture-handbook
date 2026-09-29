---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - wero-merchants
  - epi-wero-commerce-2026-09
  - wero-faq-desktop
  - wero-faq-instore
related_internal_repos:
  - zdmooc/wero-organisme-poc
---

# Acceptation marchand et modèle Acceptor

## 1. L'acceptation est un domaine d'architecture

Passer du P2P au commerce ajoute :
- commande ;
- panier ;
- merchant identity ;
- Acceptor PSP ;
- checkout ;
- terminal/POS ;
- QR/deep link ;
- refund ;
- merchant reporting ;
- reconciliation.

Le statut de paiement doit être raccordé à un statut commercial sans les confondre.

## 2. Onboarding marchand

Capabilities :
- KYB / contractual checks ;
- merchant identifier ;
- settlement account ;
- credentials ;
- channel configuration ;
- callback configuration ;
- refund permissions ;
- reporting ;
- support.

## 3. Merchant profile

~~~text
Merchant
- merchantId
- legalIdentity
- tradeName
- acceptorPspId
- settlementReference
- channels[]
- credentials[]
- callbackProfile
- limits
- status
~~~

## 4. Payment request

Le payment request relie la commande au paiement :

~~~text
paymentRequestId
merchantOrderId
merchantId
amount
currency
channel
expiry
status
financialPaymentId
~~~

L'identifiant financier peut n'exister qu'après l'autorisation ou la soumission.

## 5. Desktop

Pattern public :
- checkout navigateur ;
- sélection Wero ;
- QR ou transition vers mobile selon parcours ;
- validation côté client ;
- statut côté marchand.

Risque : le navigateur et le téléphone sont deux contextes différents. Le backend doit maintenir le lien stable.

## 6. Mobile

App-to-app :
- universal/deep link ;
- app context ;
- return URI ;
- state/nonce ;
- timeout ;
- app killed/restarted.

Le retour mobile reste un canal UX, pas une preuve de settlement.

## 7. POS

Le POS doit gérer :
- payment request ;
- QR ;
- expiration ;
- active status polling ;
- cancel avant exécution lorsque possible ;
- duplicate scan ;
- retry ;
- receipt.

Le terminal peut être temporairement déconnecté. Le design doit empêcher qu'un cashier relance un nouveau paiement alors que le premier est UNKNOWN.

## 8. Merchant callback

Envelope de référence :

~~~json
{
  "eventId": "evt-001",
  "paymentRequestId": "pr-001",
  "paymentId": "pay-001",
  "status": "SETTLED",
  "occurredAt": "2026-09-28T12:00:00Z",
  "signature": "..."
}
~~~

Contrôles :
- signature ;
- timestamp ;
- replay window ;
- eventId unique ;
- delivery history ;
- exponential/bounded retry ;
- dead-letter operations ;
- status API fallback.

## 9. Fulfilment

~~~text
authoritative payment result
→ merchant payment state
→ fulfilment decision
~~~

Un redirect navigateur ne suffit pas.

## 10. Reconciliation marchand

Comparer :
- orders ;
- payment requests ;
- payment final states ;
- refunds ;
- settlement/credit records ;
- fees si applicables.

Exceptions :
- order without payment ;
- payment without order ;
- amount mismatch ;
- settled but merchant pending ;
- refunded but order not updated ;
- duplicate notification.

## 11. Refund

Un refund nécessite :
- autorisation ;
- référence du paiement original ;
- montant <= reliquat remboursable ;
- idempotence ;
- motif ;
- audit ;
- état indépendant.

Pour les remboursements partiels, contrôler le cumul.

## 12. Availability model

Merchant availability dépend de :
- merchant frontend ;
- Acceptor PSP ;
- Wero service path ;
- Consumer PSP ;
- financial rail ;
- callback/status retrieval.

Donc un simple indicateur Wero up ne suffit pas comme SLI marchand.

## 13. Merchant SLOs

SLIs utiles :
- payment-request creation success ;
- time to customer-presentable context ;
- payment completion ;
- callback latency ;
- callback success ;
- active-status availability ;
- refund completion ;
- reconciliation age.

Les valeurs sont des décisions contractuelles/métier, pas des nombres inventés par ce livre.

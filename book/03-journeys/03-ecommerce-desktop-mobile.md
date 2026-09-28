---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - wero-faq-desktop
  - wero-merchants
  - epi-wero-commerce-2026-09
related_internal_repos:
  - zdmooc/wero-organisme-poc
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# E-commerce desktop et mobile

## 1. Deux parcours, une même vérité financière

Desktop et mobile diffèrent surtout dans la transition d'expérience. Le backend doit conserver une logique paiement commune.

## 2. Desktop QR pattern

~~~text
Browser
→ Merchant Backend
→ Acceptor PSP: create Payment Request
← paymentRequestId + QR/context
Browser displays QR
Customer scans with phone
→ Wallet/Bank App
→ authorize
→ Consumer PSP
→ financial payment
→ Acceptor status
→ Merchant Backend
→ Browser refresh/status
~~~

## 3. QR content

Le QR peut encoder :
- URL/token ;
- payment request reference ;
- merchant reference ;
- expiry ;
- context.

Principes :
- token opaque pour limiter exposition ;
- expiration courte ;
- binding au merchant/order ;
- intégrité/signature si nécessaire ;
- pas de données sensibles inutiles.

## 4. Polling

Le navigateur peut poller le backend avec :
- backoff ;
- max rate ;
- terminal states ;
- cache ;
- timeout UX indépendant de la vérité financière.

Après timeout UX, la commande peut rester PAYMENT_PENDING.

## 5. Mobile app-to-app

~~~text
Merchant App
→ Backend creates Payment Request
→ deep/universal link
→ Wero/Bank App
→ consent/SCA
→ payment
→ backend status
→ app return
~~~

## 6. State parameter

Le handoff doit résister à :
- wrong app session ;
- replay ;
- open redirect ;
- context substitution.

Références utiles :
- state ;
- nonce ;
- requestId ;
- return context ;
- expiry.

## 7. App killed during payment

Cas :
1. customer approves ;
2. merchant app is killed ;
3. payment settles ;
4. callback UI context is lost.

Recovery :
- merchant backend owns paymentRequestId ;
- on restart, app queries order/payment status ;
- same order is rendered PAID ;
- no new payment.

## 8. User presses back

Back est un événement UX. Il ne prouve ni cancellation ni payment failure.

Si l'instruction est déjà soumise, seul un statut autoritatif résout le cas.

## 9. Browser redirect race

Ordres possibles :

~~~text
SETTLED → redirect → webhook
SETTLED → webhook → redirect
SETTLED → webhook only
~~~

Le merchant state doit converger indépendamment de l'ordre.

## 10. Push + pull

~~~text
push = webhook
pull = status API
~~~

Push réduit la latence. Pull assure la récupération.

## 11. Expiry

Distinguer :
- payment request expiry avant autorisation ;
- checkout/session expiry ;
- financial instruction déjà soumise.

Ne pas créer un nouveau paiement si l'ancien peut encore avoir un effet non résolu.

## 12. Amount changes

Si le panier change :
- invalider/recréer le payment request ;
- préserver le lien d'audit ;
- ne pas réutiliser silencieusement un montant autorisé différent.

## 13. Multiple tabs/devices

Risques :
- même commande payée deux fois ;
- sessions concurrentes.

Contrôle :
- stable merchant-order payment identity ;
- one active logical payment policy ;
- atomic transition.

## 14. Observability

Dimensions :
- merchantOrderId ;
- paymentRequestId ;
- paymentId ;
- EndToEndId ;
- correlationId.

Metrics :
- request creation ;
- QR display ;
- authorization conversion ;
- time to finality ;
- callback delay ;
- active-status recovery ;
- duplicate prevention.

## 15. Security

- HTTPS ;
- secure redirect/deep links ;
- signed callback ;
- anti-CSRF/state ;
- no secrets in browser logs ;
- CSP where applicable ;
- merchant credentials server-side.

## 16. Commercial completion

Fulfil only when the merchant backend has an authoritative payment result mapped to the same order and amount.

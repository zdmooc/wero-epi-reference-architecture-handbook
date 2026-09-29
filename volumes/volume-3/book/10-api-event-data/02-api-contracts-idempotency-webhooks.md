---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/mayabank-api-management-architecture
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# API contracts, idempotence et webhooks

## 1. Une API paiement est un contrat métier

Le contrat doit définir :
- ressource ;
- intention ;
- identifiants ;
- états ;
- erreurs ;
- sécurité ;
- idempotence ;
- timeout ;
- versioning ;
- recovery.

## 2. Création d'un paiement

Référence :

~~~http
POST /payments
Idempotency-Key: order-45821-payment-1
X-Correlation-Id: corr-...
Authorization: Bearer ...
~~~

Payload :
- payer context ;
- payee/payment request ;
- amount ;
- currency ;
- merchant references.

## 3. Idempotency-Key

Le serveur associe la clé à :
- caller ;
- endpoint/use case ;
- canonical immutable payload ;
- resulting resource.

Same key + same payload:
- return same logical result.

Same key + different immutable payload:
- conflict.

## 4. Response design

Possible patterns :
- 201 Created when resource created ;
- 200 replay of existing result ;
- 202 processing if asynchronous ;
- 409 idempotency conflict ;
- 4xx validation/business rejection ;
- 5xx only for technical conditions.

Do not use HTTP code alone as financial state.

## 5. Resource status

~~~http
GET /payments/{paymentId}
~~~

Returns:
- logical state ;
- financial state ;
- latest authoritative source ;
- reason ;
- timestamps ;
- references appropriate to caller.

## 6. Error envelope

~~~json
{
  "code": "PAYMENT_STATUS_UNKNOWN",
  "category": "PROCESSING",
  "message": "Payment outcome is being verified",
  "correlationId": "..."
}
~~~

Never expose stack traces or raw scheme internals to external clients by default.

## 7. Versioning

Strategies:
- URI version ;
- header/media type ;
- additive compatible changes.

For payment APIs:
- avoid breaking field semantics ;
- define deprecation ;
- keep old version long enough for merchants ;
- monitor usage.

## 8. Webhook contract

Fields:
- eventId ;
- eventType ;
- paymentId/paymentRequestId ;
- state ;
- occurredAt ;
- version ;
- signature.

## 9. Webhook security

Controls:
- signature ;
- timestamp ;
- replay window ;
- TLS ;
- endpoint allow/registration ;
- key rotation.

## 10. Webhook retry

Retry is acceptable because notification is not the financial effect.

Policy:
- exponential backoff ;
- max attempts ;
- durable delivery record ;
- DLQ/manual queue ;
- active status fallback.

## 11. Ordering

Do not assume webhooks arrive in order.

Merchant compares:
- event version ;
- state monotonicity ;
- authoritative timestamp.

## 12. Pagination and history

For operations:
- payment history ;
- event history ;
- webhook history.

Use stable pagination/cursors.

## 13. API rate limits

Different limits for:
- create payment ;
- status ;
- webhook registration ;
- reconciliation export.

Status API should remain usable during degraded mode when possible.

## 14. OpenAPI

Publish:
- schema ;
- examples ;
- error codes ;
- auth ;
- idempotency semantics ;
- callbacks/webhooks ;
- version.

## 15. Contract testing

Consumer/provider tests:
- duplicate POST ;
- timeout ;
- replay ;
- old client ;
- unknown fields ;
- new enum value ;
- webhook duplicate ;
- webhook out-of-order.

## 16. SLO

API SLO must reflect safe service:
not merely HTTP 2xx, but correct idempotent behavior and ability to recover status.

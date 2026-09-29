---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Contrat Rail Adapter et sémantique de panne

## Pourquoi un adapter

Le Payment Domain ne doit pas connaître tous les détails de TIPS, RT1 ou d'un autre CSM.

Contract :
~~~text
submit
getStatus
inquire
requestRecall
getReachability
getLiquidityContext
getHealth
~~~

## Submit

Input :

- payment identity ;
- amount ;
- parties ;
- route ;
- ISO message context ;
- idempotency context.

Output :

- accepted for processing ;
- rejected ;
- settled/final if known ;
- unknown ;
- external references.

## No generic retry

Examples :

- connection failed before bytes sent : retry same logical submission may be safe ;
- response lost after send : UNKNOWN ;
- explicit reject : no transport retry to bypass business reject.

## Error taxonomy

### VALIDATION
Local mapping invalid.

### AUTHENTICATION
Certificate/auth issue.

### CONNECTIVITY
No channel.

### BUSINESS_REJECT
External rule reject.

### LIQUIDITY
Insufficient position.

### TIMEOUT_BEFORE_KNOWN_EFFECT
No effect proven by contract/evidence.

### UNKNOWN_AFTER_POSSIBLE_EFFECT
Must reconcile.

## External reference

Persist before returning success upstream whenever available.

Never rely only on transient logs.

## Status

The status operation should return :

- authority level ;
- raw status ;
- normalized status ;
- reason ;
- timestamp ;
- source.

## Inquiry

Used when :

- local UNKNOWN ;
- delayed result ;
- incident recovery.

Inquiry itself must be idempotent and auditable.

## Health

Health is not simply TCP up.

Dimensions :

- network ;
- authentication ;
- application session ;
- message processing ;
- latency ;
- reject anomaly ;
- liquidity context.

## Circuit breaker

Use carefully.

Opening a breaker can protect a failing dependency, but :

- don't drop durable financial intent ;
- don't convert queued payment to failed ;
- surface degraded mode.

## Backpressure

If downstream slows :

- bounded queues ;
- slow/reject new intake according to policy ;
- preserve already accepted intents ;
- alert before saturation.

## Ordering

No global ordering of all payments is required.

Ordering may matter for :

- same logical payment ;
- refund after settlement ;
- state transitions.

## Security

Adapter owns :

- mTLS cert ;
- scheme credentials ;
- secrets ;
- endpoint allowlist ;
- payload validation ;
- audit.

## Test doubles

Provide :

- success simulator ;
- reject simulator ;
- timeout-before-effect ;
- timeout-after-effect ;
- delayed status ;
- duplicate response ;
- malformed response.

## Runtime evidence

Companion lab can prove adapter contract behavior with a mock external scheme.

This is application evidence, not proof of a real TIPS/RT1 connection.

## Production readiness

Before go-live :

- certification ;
- endpoint inventory ;
- cert rotation ;
- failover ;
- throughput ;
- timeout ;
- reconciliation ;
- operator contacts ;
- disaster recovery.

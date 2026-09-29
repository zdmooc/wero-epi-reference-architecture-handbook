---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/openshift-platform-blueprints
  - zdmooc/wero-organisme-poc
---

# Edge Internet : DNS, anti-DDoS, WAF et Load Balancing

## Le edge est une dépendance métier

Un paiement peut échouer avant d'atteindre le moindre service métier.

Chemin de référence :

~~~text
Client
→ DNS
→ CDN / Anti-DDoS
→ WAF
→ External Load Balancer
→ Reverse Proxy / Ingress
→ API Gateway
~~~

Chaque maillon a ses propres failure modes.

## DNS

Questions d'architecture :

- authoritative DNS provider ;
- multi-provider ou single-provider ;
- TTL ;
- health-based records ;
- DNSSEC selon politique ;
- split-horizon ;
- cache behavior ;
- failover convergence.

Failure modes :

- NXDOMAIN ;
- stale cache ;
- wrong target ;
- provider outage ;
- propagation delay.

## Anti-DDoS

Objectifs :

- absorber volumétrie ;
- filtrer trafic malveillant ;
- protéger WAF/LB/backend ;
- conserver suffisamment de télémétrie.

Ne pas confondre :

- DDoS protection ;
- application rate limiting ;
- fraud prevention.

## WAF

Contrôles :

- OWASP-type attacks ;
- malformed requests ;
- bot patterns ;
- request size ;
- IP reputation ;
- geo/risk rules selon politique.

Risque :
une règle trop agressive peut bloquer les paiements légitimes.

Il faut :

- staged rollout ;
- monitor false positive ;
- emergency bypass encadré ;
- audit.

## Load Balancer

Responsibilities :

- distribute traffic ;
- health check ;
- TLS termination or pass-through according to design ;
- preserve client context where required ;
- fail unhealthy target.

## Health checks

A TCP 200-like check is insufficient if:

- app cannot reach DB ;
- app cannot reach IAM ;
- payment hub disconnected.

Use layered health:

- liveness ;
- readiness ;
- dependency-aware synthetic checks where safe.

## TLS termination

Possible patterns:

- TLS terminates at edge, re-encrypt internally ;
- TLS pass-through ;
- mTLS on selected internal hops.

Document:

- certificate owner ;
- key location ;
- cipher policy ;
- rotation ;
- trust boundary.

## Session affinity

Avoid requiring sticky sessions for stateless payment APIs.

If stateful component exists:

- justify ;
- replicate state ;
- design failover ;
- test lost affinity.

## Rate limiting

Dimensions:

- per IP ;
- client/app ;
- merchant ;
- customer ;
- endpoint ;
- risk level.

Rate limit must not cause silent duplicate retry from clients.

## API Gateway

Responsibilities:

- authentication ;
- authorization ;
- quota/rate ;
- schema validation ;
- routing ;
- correlation ;
- observability.

Gateway must not become the source of financial truth.

## Edge failover

Test:

- one POP unavailable ;
- one LB instance down ;
- certificate rotation ;
- DNS switch ;
- WAF rule rollback ;
- DDoS mode.

Measure actual client recovery time, not only backend recovery.

## Observability

KPIs:

- DNS resolve success ;
- WAF blocks ;
- LB target health ;
- TLS handshake failures ;
- HTTP status ;
- p95/p99 latency ;
- request rate ;
- rate-limit events.

## Security logs

Keep:

- source context ;
- request ID ;
- rule ID ;
- decision ;
- timestamp.

Avoid storing full sensitive payment payload at edge unless strictly required.

## Capacity

Edge capacity must consider:

- legitimate peak ;
- retries ;
- bot traffic ;
- DDoS ;
- TLS handshake CPU ;
- large merchant campaigns.

## Architecture review

- can DNS fail independently ?
- can WAF rollback safely ?
- can LB fail across zones ?
- can certificate rotate without outage ?
- can gateway preserve idempotency headers ?
- is correlation propagated end to end ?

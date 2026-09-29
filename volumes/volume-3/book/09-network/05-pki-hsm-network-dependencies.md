---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# PKI, certificats et dépendances HSM

## La crypto a une disponibilité

Un certificat expiré ou un HSM inaccessible peut arrêter un paiement aussi sûrement qu'une panne DB.

## Certificate inventory

For every certificate:

- owner ;
- use ;
- endpoint ;
- issuer ;
- serial ;
- SAN ;
- expiry ;
- private-key location ;
- rotation process ;
- emergency contact.

## Certificate lifecycle

~~~text
request
→ approve
→ issue
→ deploy
→ validate
→ monitor
→ rotate
→ revoke
→ archive evidence
~~~

## Expiry alerts

Recommended bands:

- D-90 ;
- D-60 ;
- D-30 ;
- D-15 ;
- D-7 ;
- D-1.

Exact operational policy is institution-specific.

## Rotation

Test:

- new + old overlap ;
- truststore updated ;
- peer accepts new cert ;
- rollback ;
- no restart if possible.

## Truststore

Risks:

- missing intermediate ;
- expired CA ;
- wrong truststore ;
- stale bundle ;
- global CA removal.

Treat truststore as versioned configuration.

## mTLS

Both sides need:

- valid cert ;
- trusted issuer ;
- allowed identity ;
- private key ;
- protocol compatibility.

An open TCP port is not sufficient health.

## HSM use cases

- private key protection ;
- signing ;
- TLS client key operations ;
- token/crypto operations ;
- key generation.

## HSM HA

Questions:

- cluster ?
- dual appliance ?
- multi-site ?
- key replication ?
- quorum ?
- failover time ?
- capacity ?

## Network dependency

HSM reachable over network introduces:

- latency ;
- connection pool ;
- firewall ;
- route ;
- DNS ;
- TLS ;
- capacity.

Monitor HSM network independently.

## Key loss

RPO for keys may effectively be zero for critical identity.

Controls:

- secure backup ;
- replicated HSM ;
- documented restore ;
- dual control ;
- recovery test.

## Revocation incident

If credential compromised:

1. identify scope ;
2. revoke ;
3. issue replacement ;
4. deploy ;
5. restore peer trust ;
6. reconcile payments affected.

## Certificate pinning

Can improve control but complicates rotation.

Use only with explicit lifecycle support.

## Secrets management

Certificate/key references may live in:

- secret manager ;
- Kubernetes Secret with external management ;
- HSM integration.

Never store private keys in Git.

## Metrics

- expiry days ;
- handshake failure ;
- HSM latency ;
- HSM error rate ;
- key operation rate ;
- connection saturation ;
- revocation events.

## Chaos tests

- revoke test cert ;
- expire cert ;
- remove intermediate ;
- HSM node down ;
- HSM network block ;
- rotate under load.

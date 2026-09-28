---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# PKI, certificats et dépendances HSM

## 1. La crypto a une disponibilité

Un certificat expiré ou un HSM inaccessible peut arrêter un paiement aussi sûrement qu'une panne DB.

## 2. Certificate inventory

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

## 3. Certificate lifecycle

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

## 4. Expiry alerts

Recommended bands:
- D-90 ;
- D-60 ;
- D-30 ;
- D-15 ;
- D-7 ;
- D-1.

Exact operational policy is institution-specific.

## 5. Rotation

Test:
- new + old overlap ;
- truststore updated ;
- peer accepts new cert ;
- rollback ;
- no restart if possible.

## 6. Truststore

Risks:
- missing intermediate ;
- expired CA ;
- wrong truststore ;
- stale bundle ;
- global CA removal.

Treat truststore as versioned configuration.

## 7. mTLS

Both sides need:
- valid cert ;
- trusted issuer ;
- allowed identity ;
- private key ;
- protocol compatibility.

An open TCP port is not sufficient health.

## 8. HSM use cases

- private key protection ;
- signing ;
- TLS client key operations ;
- token/crypto operations ;
- key generation.

## 9. HSM HA

Questions:
- cluster ?
- dual appliance ?
- multi-site ?
- key replication ?
- quorum ?
- failover time ?
- capacity ?

## 10. Network dependency

HSM reachable over network introduces:
- latency ;
- connection pool ;
- firewall ;
- route ;
- DNS ;
- TLS ;
- capacity.

Monitor HSM network independently.

## 11. Key loss

RPO for keys may effectively be zero for critical identity.

Controls:
- secure backup ;
- replicated HSM ;
- documented restore ;
- dual control ;
- recovery test.

## 12. Revocation incident

If credential compromised:
1. identify scope ;
2. revoke ;
3. issue replacement ;
4. deploy ;
5. restore peer trust ;
6. reconcile payments affected.

## 13. Certificate pinning

Can improve control but complicates rotation.

Use only with explicit lifecycle support.

## 14. Secrets management

Certificate/key references may live in:
- secret manager ;
- Kubernetes Secret with external management ;
- HSM integration.

Never store private keys in Git.

## 15. Metrics

- expiry days ;
- handshake failure ;
- HSM latency ;
- HSM error rate ;
- key operation rate ;
- connection saturation ;
- revocation events.

## 16. Chaos tests

- revoke test cert ;
- expire cert ;
- remove intermediate ;
- HSM node down ;
- HSM network block ;
- rotate under load.

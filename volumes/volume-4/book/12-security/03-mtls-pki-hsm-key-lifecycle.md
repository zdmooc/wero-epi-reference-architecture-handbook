---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# mTLS, PKI, HSM et cycle de vie des clés

## 1. Encryption vs identity

TLS encrypts transport and authenticates server.

mTLS authenticates both peers at transport layer.

It does not replace business authorization.

## 2. PKI roles

- Root CA ;
- Intermediate CA ;
- Registration/issuance processes ;
- certificate owner ;
- relying party.

## 3. Certificate profile

Define:
- purpose ;
- SAN ;
- key usage ;
- algorithm ;
- validity ;
- issuer ;
- revocation mechanism.

## 4. Private key storage

Critical keys:
- HSM ;
- managed KMS/HSM ;
- protected secret store depending on risk.

Never in source repository.

## 5. HSM governance

- dual control ;
- key ceremony ;
- role separation ;
- audit ;
- HA ;
- backup/recovery.

## 6. Key lifecycle

~~~text
generate
→ activate
→ use
→ rotate
→ retire
→ revoke/destroy
~~~

Each step has owner and evidence.

## 7. Rotation without outage

Support overlap:
- old cert valid ;
- deploy new ;
- peer trusts both ;
- switch ;
- remove old.

## 8. Emergency rotation

Trigger:
- compromise ;
- CA incident ;
- leaked key ;
- invalid cert.

Runbook:
- revoke ;
- replace ;
- distribute trust ;
- validate connectivity ;
- investigate impact.

## 9. Crypto agility

Avoid hard-coding one algorithm everywhere.

Keep:
- profile version ;
- negotiated policy ;
- upgrade path.

## 10. HSM capacity

Crypto becomes performance dependency.

Measure:
- ops/s ;
- latency ;
- session count ;
- queue ;
- failover.

## 11. Network HSM

If remote:
- dual network ;
- mTLS ;
- firewall ;
- health ;
- pool ;
- timeout.

## 12. Key backup

Critical keys require secure recoverability according to policy.

Backup must not create an easier exfiltration path.

## 13. Audit

Log:
- key create ;
- activate ;
- use of privileged admin functions ;
- rotate ;
- revoke ;
- export attempt.

## 14. Post-quantum watch

The five-year book roadmap should monitor cryptographic transition requirements without claiming premature production mandates.

## 15. Design review

- who owns each cert/key ?
- what happens on expiry ?
- can HSM failover ?
- can peer accept rotation ?
- are emergency contacts known ?

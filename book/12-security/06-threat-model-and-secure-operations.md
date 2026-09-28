---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/maya-secure-agentic-devsecops-platform
---

# Threat model et opérations de sécurité

## 1. Assets

Protect:
- money movement ;
- payment state ;
- customer identity ;
- merchant identity ;
- credentials ;
- keys ;
- settlement connectivity ;
- audit evidence.

## 2. Threat actors

- cybercriminal ;
- fraudster ;
- malicious insider ;
- compromised supplier ;
- botnet ;
- advanced attacker ;
- accidental operator.

## 3. Entry points

- mobile/web ;
- merchant API ;
- webhook ;
- admin UI ;
- CI/CD ;
- supply chain ;
- VPN/bastion ;
- CSM connectivity ;
- third-party API.

## 4. STRIDE-like review

For each boundary consider:
- spoofing ;
- tampering ;
- repudiation ;
- information disclosure ;
- denial of service ;
- elevation of privilege.

## 5. Payment-specific abuse

- duplicate submit ;
- beneficiary substitution ;
- amount tampering ;
- callback forgery ;
- refund abuse ;
- replay ;
- operator override ;
- route manipulation.

## 6. Security controls by layer

Edge:
- DDoS/WAF/rate.

API:
- auth/authz/schema/idempotency.

Service:
- workload identity/mTLS.

Data:
- encryption/RBAC/audit.

Platform:
- policy/image/runtime.

Operations:
- PAM/MFA/segregation.

## 7. Admin plane

Separate from customer plane.

Controls:
- private access ;
- PAM ;
- no shared accounts ;
- session audit ;
- approval for critical action.

## 8. Vulnerability management

Prioritize by:
- exploitability ;
- exposed component ;
- business criticality ;
- compensating control.

## 9. Patch strategy

For 24/7:
- rolling ;
- canary ;
- PDB/topology ;
- compatibility ;
- emergency patch path.

## 10. Supply-chain incident

If compromised image/dependency:
- stop promotion ;
- identify deployments ;
- revoke credentials if needed ;
- replace image ;
- preserve evidence ;
- reconcile payments if runtime integrity impacted.

## 11. Secrets leak

Response:
- revoke ;
- rotate ;
- search usage ;
- block abuse ;
- audit access ;
- validate downstream trust.

## 12. Detection

Signals:
- auth anomaly ;
- unexpected admin ;
- certificate use ;
- API abuse ;
- unusual payment patterns ;
- route/config change.

## 13. Security incident and payment truth

Containment must preserve ability to answer:
- which payments settled ?
- which are UNKNOWN ?
- were any states tampered ?
- which credentials were used ?

## 14. Recovery

Security recovery includes:
- clean environment ;
- trusted artifacts ;
- key rotation ;
- data integrity verification ;
- reconciliation ;
- business validation.

## 15. Evidence

Keep a claim-evidence mapping for security controls rather than declaring generic secure or compliant status.

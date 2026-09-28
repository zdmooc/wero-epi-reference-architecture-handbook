---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# IAM client, workload identity et SCA

## 1. Quatre identités différentes

- customer identity ;
- merchant identity ;
- workload identity ;
- operator identity.

Les fusionner dans un même modèle d'autorisation crée des privilèges excessifs.

## 2. Customer IAM

Capabilities :
- login ;
- MFA/SCA integration ;
- device relation ;
- session ;
- recovery ;
- consent context.

## 3. Authentication vs authorization

Authentication:
who are you?

Authorization:
what may you do?

Payment approval adds:
what transaction are you consenting to?

## 4. SCA

Le design doit supporter :
- facteurs ;
- exemptions lorsque cadre applicable ;
- challenge ;
- consent ;
- evidence ;
- failure/retry.

SCA success does not equal settlement success.

## 5. Session

Controls:
- short idle timeout appropriate to UX ;
- secure cookie/token ;
- device binding if policy ;
- re-auth for sensitive action ;
- logout/revocation.

## 6. OAuth2

Reference:
- authorization server ;
- resource server ;
- client ;
- scopes ;
- audience.

Use short-lived access tokens and explicit audiences.

## 7. OIDC

Provides identity layer:
- issuer ;
- subject ;
- claims ;
- ID token.

Do not send ID token to APIs as generic access token unless designed.

## 8. Workload identity

Prefer:
- service account ;
- short-lived token ;
- certificate ;
- workload-bound identity.

Avoid shared static API keys.

## 9. Operator IAM

Privileged actions:
- payment correction ;
- replay ;
- liquidity ;
- cert/key operations ;
- config.

Require:
- MFA ;
- least privilege ;
- PAM where applicable ;
- approval ;
- audit.

## 10. Token validation

Check:
- signature ;
- issuer ;
- audience ;
- expiry ;
- not-before ;
- scopes ;
- key version.

## 11. JWKS/key rotation

Cache keys but:
- refresh safely ;
- handle overlap ;
- alert unknown kid ;
- no long outage on rotation.

## 12. IAM outage

Design choices:
- existing valid token can continue if validation local ;
- new login may fail ;
- revocation freshness trade-off.

Document degraded mode.

## 13. Account recovery

High-risk flow:
- identity proof ;
- fraud ;
- SIM swap ;
- email compromise.

Recovery must not bypass payment protections.

## 14. Separation of duties

No single operator should be able to:
- change security policy ;
- execute financial correction ;
- hide audit.

## 15. Evidence

Store authentication/payment consent evidence according to legal/policy needs without excessive sensitive retention.

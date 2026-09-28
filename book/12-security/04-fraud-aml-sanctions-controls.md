---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Fraude, AML/CFT et sanctions — contrôles distincts

## 1. Trois objectifs différents

### Fraud
Prevent/detect deceptive or unauthorized loss.

### AML/CFT
Detect/manage money-laundering and terrorism-financing risk under applicable framework.

### Sanctions
Comply with restrictive measures.

They may share data but are not one engine.

## 2. Fraud decision

Signals:
- device ;
- account history ;
- beneficiary novelty ;
- amount ;
- velocity ;
- geo ;
- behavioral pattern ;
- VoP result ;
- merchant risk.

## 3. Decision outputs

- ALLOW ;
- CHALLENGE ;
- BLOCK ;
- REVIEW ;
- DEGRADE according to policy.

Keep reason and model/rule version.

## 4. Real-time budget

Fraud scoring must fit the instant-payment latency budget.

Design:
- precomputed features ;
- low-latency store ;
- bounded dependencies ;
- timeout policy.

## 5. Fail-open vs fail-closed

Must be risk/business decision.

For high-risk payment:
- fail-open can create fraud loss.

For every dependency define:
- timeout ;
- fallback ;
- limit ;
- alert.

## 6. AML controls

May include:
- transaction monitoring ;
- customer risk ;
- patterns ;
- case management ;
- reporting.

Not every AML process is synchronous in payment path.

## 7. Sanctions

Instant Payments Regulation changes the model for certain targeted financial restrictive-measures checks.

The exact legal process must be derived from the current regulation and implementing guidance.

Architecture must version the rule.

## 8. List updates

If screening lists/rules are used:
- source ;
- version ;
- effective time ;
- successful load ;
- rollback ;
- audit.

## 9. False positive

Operational queue:
- case ;
- evidence ;
- review ;
- SLA ;
- release/block decision.

## 10. APP fraud

Authorized push-payment fraud can occur even after valid authentication.

Controls:
- beneficiary warnings ;
- VoP ;
- behavioral analytics ;
- cooling/limits where policy ;
- education ;
- post-event response.

## 11. Mule detection

Network/graph signals:
- rapid pass-through ;
- many originators ;
- new account ;
- unusual velocity.

## 12. Model governance

For ML:
- training data ;
- bias/quality ;
- drift ;
- explainability appropriate to use ;
- champion/challenger ;
- rollback.

## 13. Privacy

Fraud data is sensitive.

Minimise:
- access ;
- retention ;
- unnecessary sharing.

## 14. Incident integration

Fraud spike can be operational incident.

Correlate:
- payment volume ;
- device patterns ;
- beneficiary clusters ;
- merchant ;
- route.

## 15. Metrics

- blocked ;
- challenged ;
- false positive ;
- fraud loss ;
- scoring latency ;
- unavailable rate ;
- case backlog.

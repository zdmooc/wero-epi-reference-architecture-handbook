---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - epc-vop-2026-v1.1
  - eu-ipr-2024-886
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Verification of Payee — sécurité et décision utilisateur

## Position dans le parcours

VoP intervient avant l'autorisation/exécution dans le cadre applicable.

It verifies payee information; it does not move money.

## Data inputs

Depending on scheme:

- payee account identifier ;
- payee name or relevant identifier ;
- requesting/responding PSP context.

Use exact current VOP specifications for implementation.

## Result categories

Preserve scheme result:

- match ;
- close match ;
- no match ;
- check not possible.

Do not collapse check not possible into no match.

## User presentation

UI must:

- be clear ;
- avoid dark patterns ;
- show warning severity ;
- record decision where required.

## Close match

Potentially display corrected/suggested data according to scheme rules.

Risks:

- leakage ;
- enumeration ;
- user confusion.

## Privacy/abuse

Protect against:

- name harvesting ;
- brute-force account queries ;
- enumeration.

Controls:

- authenticated PSP calls ;
- rate ;
- monitoring ;
- minimised response.

## Fraud correlation

VoP result is one signal.

Examples:

- Match + known mule risk = still risky.
- No Match + user continues = stronger monitoring.

## Availability

If VoP service unavailable:

- follow legal/scheme rule ;
- present correct user state ;
- audit ;
- do not fabricate Match.

## Caching

Cache only if explicitly allowed and semantically safe.

Binding:

- exact account ;
- exact name input ;
- scheme/version ;
- short freshness.

## Latency

Monitor:

- total ;
- requesting PSP ;
- responding PSP ;
- timeout.

VoP must not silently consume the entire payment UX budget.

## Audit

Store:

- request reference ;
- result ;
- timestamp ;
- rulebook/spec version ;
- what user saw ;
- continuation decision ;
- paymentId.

## Dispute/support

Support should retrieve VoP evidence without exposing unnecessary underlying personal data.

## Change management

VOP scheme/spec update:

- diff ;
- API update ;
- UX review ;
- tests ;
- participant certification where required ;
- deploy.

## Test matrix

- exact ;
- close ;
- no match ;
- unavailable ;
- timeout ;
- malformed ;
- duplicate ;
- abuse/rate ;
- user continues ;
- user cancels.

## Principle

VoP reduces certain misdirection risks but is not a guarantee that the payment is legitimate or fraud-free.

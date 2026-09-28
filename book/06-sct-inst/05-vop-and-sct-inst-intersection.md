---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - epc-vop-2026-v1.1
  - eu-ipr-2024-886
  - epc-sct-inst-2025-v1.1
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Verification of Payee et SCT Inst

## 1. VoP n'est pas settlement

VoP répond à une question pré-exécution :
> les informations du bénéficiaire correspondent-elles selon le service de verification applicable ?

Il ne :
- réserve pas les fonds ;
- n'exécute pas SCT Inst ;
- ne garantit pas absence de fraude ;
- ne prouve pas settlement.

## 2. Actors

Reference:
- Requesting PSP ;
- Responding PSP ;
- payer/customer ;
- supporting routing/directory services according to scheme.

## 3. Flow

~~~text
payer enters beneficiary details
→ Requesting PSP creates VoP request
→ Responding side verifies
→ Match / Close Match / No Match / Check not possible
→ result presented
→ customer decision/authorization
→ SCT Inst payment if continued
~~~

## 4. Timing

VoP affects UX latency before payment submission.

Design budget:
- request ;
- network ;
- matching ;
- response ;
- UI rendering.

Do not consume payment execution budget by coupling it badly to a later rail timeout.

## 5. Result semantics

Result categories should be preserved as scheme-defined values.

Internal app may map them to:
- green ;
- warning ;
- danger ;
- unavailable.

But must retain raw result/version for audit.

## 6. Close match

UX needs careful design:
- show proposed/corrected name as allowed ;
- avoid confusing customer ;
- capture decision.

No generic automatic overwrite without scheme/product rules.

## 7. No match

Possible actions depend on legal/scheme/product requirements.

Architecture must support:
- explicit warning ;
- customer choice when permitted ;
- audit of presented result.

## 8. Check not possible

Do not convert technical unavailable into No Match.

Separate:
- beneficiary mismatch ;
- service unavailable.

## 9. Cache

VoP result can become stale.

If caching is allowed:
- very clear TTL ;
- input binding ;
- no reuse across different beneficiary data ;
- audit.

## 10. Fraud integration

Fraud engine can consume:
- VoP result ;
- new beneficiary ;
- device ;
- amount ;
- velocity.

But fraud decision remains separate.

Example:
- VoP Match + high-risk device may still be blocked.
- VoP No Match may be warning/decision input according to rules.

## 11. Data minimisation

VoP handles identity data.

Controls:
- transmit only required fields ;
- limit logs ;
- protect response ;
- retention policy ;
- access control.

## 12. Resilience

Failure modes:
- Requesting service down ;
- Responding PSP down ;
- network timeout ;
- stale directory ;
- invalid response ;
- replay.

Define fail behavior based on legal/scheme rule, not developer convenience.

## 13. Observability

Metrics:
- request count ;
- latency ;
- result distribution ;
- unavailable ;
- timeout ;
- downstream payment conversion ;
- fraud correlation.

## 14. Testing

- exact match ;
- close match ;
- no match ;
- check impossible ;
- timeout ;
- malformed request ;
- duplicate ;
- high latency ;
- unauthorized caller.

## 15. Audit chain

Persist:
- input reference ;
- response category ;
- timestamp ;
- scheme version ;
- what was presented ;
- customer continuation decision ;
- resulting paymentId if created.

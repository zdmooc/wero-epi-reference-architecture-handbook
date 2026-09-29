# Terminology & Style Guide — V1.0

**Baseline:** 2026-09-28

## 1. Canonical terminology

Use consistently:

| Canonical term | Avoid / clarify |
|---|---|
| Wero / EPI service layer | do not use Wero as synonym for SCT Inst or a CSM |
| SCT Inst | do not use as synonym for TIPS or RT1 |
| ISO 20022 | do not call it a payment rail |
| CSM | specify actual system when material |
| TIPS | Eurosystem instant settlement service |
| RT1 | EBA CLEARING instant-payment system |
| Settlement | distinguish from clearing/routing |
| Finality | qualify by applicable system/rules |
| UNKNOWN | never silently map to FAILED |
| Refund | merchant/business refund |
| Return | scheme/payment return |
| Recall | request to recall/cancel under scheme rules |
| Payment Request | request object, not the financial payment |
| Merchant Order | commercial state, separate from payment |
| Consumer PSP | payer-side PSP role |
| Acceptor PSP | merchant-side PSP/acquirer role |
| VoP | Verification of Payee |
| DCA | Dedicated Cash Account |
| MCA | Main Cash Account |
| AStA | Ancillary System technical account |
| RTO | service restoration objective, not pod restart time |
| RPO | data-loss objective tied to dataset and failure domain |
| HA | high availability, not backup or DR |
| DR / PRA | disaster recovery / plan de reprise |
| Reconciliation | alignment against authoritative evidence |
| Idempotency | same logical intent does not create another effect |

## 2. Mandatory distinctions

Wero != SCT Inst
SCT Inst != ISO 20022
ISO 20022 != CSM
CSM != settlement asset
TIPS != RT1
Order status != Payment status
HTTP result != Financial finality
UNKNOWN != FAILED
Refund != Return != Recall
HA != Backup != DR
DESIGNED != RUNTIME_PROVEN != COMPLIANT

## 3. Truth wording

### PUBLIC_VERIFIED
Use formulations such as: « Les sources publiques indiquent… », « L'EPC précise… », « La BCE décrit… ».

### REFERENCE_ARCHITECTURE
Use: « Architecture de référence », « Le livre propose », « Modèle conceptuel ».
Do not write « Wero utilise… » unless a public source supports it.

### INFERRED
Use: « On peut en déduire… » or « Conséquence architecturale probable… ».

### RUNTIME_PROVEN
Always state environment, version, test and limitation.

## 4. Payment-state wording

Use SUBMITTED, SETTLED, REJECTED, UNKNOWN and RECONCILING.
Never use FAILED for an outcome that is merely unknown.

## 5. API wording

A transport status is not financial status.
HTTP 202 means accepted for processing, not settlement.
A webhook is a notification transport, not authoritative settlement proof by itself.

## 6. Network wording

Avoid « the network is redundant » without failure-domain evidence.
Prefer precise terms: dual provider, dual path, multi-zone, tested failover.

## 7. Resilience wording

Avoid « zero downtime » or « RPO=0 » without scope and evidence.
Always specify failure domain, service, dataset and tested/measured status.

## 8. Regulatory wording

For law and scheme rules:
- quote regulation/rulebook name and version;
- state applicability/effective date;
- distinguish legal text from operational guidance;
- do not call legislative proposals applicable law.

## 9. Language convention

The book is French-first with precise English architecture terms where they are standard.
Preferred terms include payment request, payment intent, settlement, reachability, routing, failover, fencing and runbook.

## 10. Acronyms

At first occurrence in a major part, write the full term followed by the acronym.

## 11. Tables

Tables should compare one dimension per row and avoid mixing facts, recommendations and future roadmap.

## 12. Diagrams

Every diagram source must contain title, truth level and verification date.

## 13. Numbers

Any public number must include source, date and scope.

## 14. Examples

Examples must be synthetic, non-client, non-production and clearly identified when incomplete.

## 15. Final editorial rule

When uncertain, reduce the strength of the claim rather than increase it.

# Wero & EPI — Collection Architecture V2

Status: WORKING BASELINE  
Branch: `collection-v2-four-volumes`  
Historical baseline: public V1.0 remains unchanged.

## Collection

**Wero & EPI — Architecture de Référence des Paiements Européens**

The collection is reorganised into four autonomous but connected volumes.

1. **Volume I — Wero/EPI: Business & Functional Architecture**
2. **Volume II — Instant Payments: ISO 20022, SCT Inst, TIPS, RT1 & Liquidity**
3. **Volume III — Payment Platform Architecture: API, Event, Data, Network & OpenShift**
4. **Volume IV — Security & Operational Resilience: IAM, DORA, HA/DR & SRE**

## Editorial principle

The collection is not a mechanical split of the 448-page V1.0 PDF.

Each volume must:
- answer one primary architecture question;
- be readable independently;
- reuse the same canonical actors, identifiers, transaction states and evidence vocabulary;
- distinguish public facts from authored reference design and runtime proof;
- reference another volume instead of redefining a canonical concept;
- use the same master payment journeys as recurring examples.

## Canonical ownership

| Topic | Canonical owner |
|---|---|
| Wero actors, customer/merchant journeys, commercial state | Volume I |
| ISO 20022, SCT Inst, CSM, settlement, liquidity | Volume II |
| API, events, data, network, middleware, Kubernetes/OpenShift | Volume III |
| IAM/security, resilience, recovery, DORA, SRE, evidence | Volume IV |
| Glossary, evidence taxonomy, public baseline, global index | Collection |

## Preservation rule

The GitHub Release `v1.0`, its tag, frozen SHA and publication artifacts are historical records and must not be rewritten retroactively.

## Iteration programme

See `ITERATION_STATUS.md`.

# Hero Figures — V1 Preparation Review

**Date:** 2026-09-29  
**Status:** HERO_SVG_QA_PASS  
**Scope:** 8 master figures

## Review result

All eight hero figures now:
- use `visual_system: V1`;
- declare an explicit publication layout;
- carry a truth level;
- carry a verification date;
- point to the canonical related chapter;
- use the common semantic vocabulary defined in `VISUAL_DESIGN_SYSTEM_V1.md`.

## Hero set

| Figure | Editorial role | Layout | Truth | Status |
|---|---|---|---|---|
| FIG-01-001 | mental model for the whole book | hero-portrait | REFERENCE_ARCHITECTURE | PREPARED |
| FIG-03-001 | C2B end-to-end journey | hero-landscape | REFERENCE_ARCHITECTURE | PREPARED |
| FIG-05-001 | ISO 20022 SCT Inst message landscape | hero-landscape | PUBLIC_VERIFIED | PREPARED |
| FIG-07-001 | scheme / message / CSM / settlement separation | hero-portrait | MIXED | PREPARED |
| FIG-09-001 | end-to-end network path | hero-landscape-wide | REFERENCE_ARCHITECTURE | PREPARED |
| FIG-11-001 | multi-zone / multi-site runtime | hero-landscape | REFERENCE_ARCHITECTURE | PREPARED |
| FIG-14-001 | complete bank reference architecture | hero-landscape-wide | REFERENCE_ARCHITECTURE | PREPARED |
| FIG-15-001 | European payments coexistence 2030 | hero-landscape | MIXED | PREPARED |

## Figure-specific decisions

### FIG-01-001
The ten conceptual layers are numbered to make the figure reusable as the book's recurring navigation model.

### FIG-03-001
Commercial/coordination steps and financial execution are visually separated. The return path carries authoritative status back toward the merchant. A note explicitly protects the `UNKNOWN != FAILED` rule.

### FIG-05-001
Normal payment processing, status inquiry and recall/return paths are separated by line style and semantic class. This remains the primary PUBLIC_VERIFIED message figure.

### FIG-07-001
Wero, SCT Inst, ISO 20022, CSM and settlement are deliberately represented as different layers. This is the visual antidote to the most common conceptual confusion in the book.

### FIG-09-001
The network is grouped into External, Edge, Application, Payment, Data and Banking Connectivity zones. The primary critical path remains readable from left to right.

### FIG-11-001
The design now makes writer authority/quorum and fencing visible. The DR site also includes independent banking connectivity, because a site without CSM connectivity is not a payment DR site.

### FIG-14-001
This is the master visual vocabulary for the handbook. It groups Experience, Identity & Trust, Payment Domain, Scheme/Rail Integration and Operations/Evidence.

### FIG-15-001
Current/private payment methods and the potential Digital Euro path are separated. Future Digital Euro components use dashed/future semantics and do not reuse SCT Inst settlement as if it were proven.

## Next production step

The hero sources are ready for:
`Mermaid source → SVG render → visual inspection → typography adjustments → publication placement`.

No PDF or EPUB generation is part of this step.


## SVG QA

The eight SVG artifacts have been rendered, visually inspected and corrected where necessary.

Result: **HERO_SVG_QA_PASS**

See `diagrams/HERO_SVG_QA_V1.md`.

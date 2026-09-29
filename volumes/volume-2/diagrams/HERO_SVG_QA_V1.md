# Hero SVG QA — V1

**Date:** 2026-09-29  
**Status:** HERO_SVG_QA_PASS  
**Scope:** 8 hero figures

## Result

The eight hero figures were rendered to committed SVG artifacts under:

`diagrams/svg/hero/`

All eight passed:
- SVG open/close structure;
- explicit width/height;
- explicit `viewBox`;
- Visual System V1 signature;
- checked date 2026-09-29;
- visual inspection for readability and print-oriented hierarchy.

## Visual QA summary

| Figure | QA result | Notes |
|---|---|---|
| FIG-01-001 | PASS | 10-layer mental model remains readable in portrait |
| FIG-03-001 | PASS | sequence labels readable; authoritative financial return path clear |
| FIG-05-001 | PASS | payment, inquiry, recall and return paths clearly separated |
| FIG-07-001 | PASS | Wero / SCT Inst / ISO 20022 / CSM / settlement separation visually explicit |
| FIG-09-001 | PASS | trust zones and critical network path readable left-to-right |
| FIG-11-001 | PASS after correction | replication and fencing paths rerouted to avoid label/node collisions |
| FIG-14-001 | PASS after correction | observability/audit paths rerouted to remove crossing lines through core labels |
| FIG-15-001 | PASS after correction | current-method selection bus separated from future Digital Euro path |

## Corrections applied during QA

### FIG-11-001
- moved the controlled-DR replication path outside the Zone 3 node;
- rerouted promotion-after-fencing above Banking Connectivity A;
- preserved distinct connectivity for the recovery site.

### FIG-14-001
- reduced crossing diagonals;
- created a clean telemetry/events route above the core architecture;
- routed audit/evidence below the financial path;
- preserved Core/Ledger and Reconciliation as distinct sources of truth/evidence.

### FIG-15-001
- introduced a clean current-method selection bus;
- kept Digital Euro on dashed future semantics;
- removed future labels from box boundaries;
- preserved method-specific settlement wording.

## Technical checks

Every hero SVG:
- starts with a valid SVG root;
- ends with `</svg>`;
- has a stable vector `viewBox`;
- uses text labels rather than colour-only semantics;
- retains truth/source wording in the footer.

## Publication decision

**HERO_SVG_QA_PASS**

The eight hero figures are ready for use in final layout.

Next step:
1. apply the same Visual System V1 to the remaining 28 figures;
2. render their SVG artifacts;
3. run visual QA;
4. then begin book layout/PDF/EPUB production.

# Final Release Decision Matrix — V1.0

**Date:** 2026-09-29  
**Technical state:** V1.0_PUBLISHED  
**Public release:** PUBLISHED — `v1.0`

| Decision | V1.0 digital decision | State |
|---|---|---|
| Digital PDF | final V1.0 | DONE |
| EPUB | final V1.0 | DONE |
| Digital cover | Quarto title page | DONE |
| Publication note / imprint | rendered front matter | DONE |
| Publisher / imprint | Djamal Zidane — publication indépendante | DONE |
| ISBN | not assigned for initial digital edition | DONE |
| Digital distribution target | GitHub Release | DECIDED |
| Final immutable source | freeze branch + SHA | DONE |
| Final PDF/EPUB QA | run 36593794049 | PASS |
| Final checksums | SHA-256 | DONE |
| Public GitHub Release | `v1.0` | DONE |
| Print / retail edition | separate future stream | DEFERRED |

## Final technical gates

- [x] fresh Quarto layout proof after front-matter insertion
- [x] final immutable publication ref
- [x] final PDF V1.0 render + QA
- [x] final EPUB V1.0 render + QA
- [x] final SHA-256 checksums
- [x] promotion to `V1.0 FINAL BUILD PASS`

Final ref:
`freeze/v1.0-digital-final-2026-09-29`

Final SHA:
`705b13664d9c3783d3d05fae72269648c80bcee8`

Final build:
`36593794049`

## Public release action

- [x] public GitHub Release `v1.0` created
- [x] PDF attached
- [x] EPUB attached
- [x] SHA256SUMS attached

Release: `https://github.com/zdmooc/wero-epi-reference-architecture-handbook/releases/tag/v1.0`.

## Separate print gate

If a physical edition is later retained:
- choose trim, binding, paper and colour mode;
- obtain printer cover template;
- produce final wrap/spine artwork;
- calculate spine width;
- order and approve a physical proof;
- decide print ISBN/barcode/price/distribution.

These items do not block the completed digital V1.0.

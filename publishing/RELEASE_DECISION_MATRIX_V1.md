# Final Release Decision Matrix — V1.0

**Date:** 2026-09-29  
**RC1 technical state:** PUBLICATION_RC1_PASS  
**Digital V1.0 configuration:** DECIDED  
**Public release:** NOT YET AUTHORIZED

The manuscript has been reread end to end. The technical content remains frozen; the remaining work is a render-sensitive publication-front-matter pass followed by a final digital build.

| Decision | V1.0 digital decision | Consequence |
|---|---|---|
| Digital PDF | publish as final V1.0 after fresh build + QA | final filename without RC suffix |
| EPUB | publish as final V1.0 after fresh build + QA | final filename without RC suffix |
| Digital cover | Quarto title page approved | no standalone retail artwork required |
| Print / retail cover | deferred | separate print/retail stream |
| Back-cover copy | APPROVED | retained for future print/retail edition |
| Publication note / imprint | inserted into front matter | triggers a fresh layout proof |
| Publisher / imprint | Djamal Zidane — publication indépendante | written into metadata/front matter |
| ISBN | not assigned for initial digital edition | reconsider for retail/print channels |
| Digital distribution | GitHub Release | release asset target |
| Price | no commercial price set for GitHub release | commercial decision deferred |
| Print edition | deferred | does not block digital V1.0 |
| Public GitHub Release | pending explicit authorization | no automatic publication |
| Final V1.0 promotion | after final build + QA | creates the final digital publication state |

## Decisions completed

- [x] digital cover treatment
- [x] back-cover copy
- [x] publication-note wording
- [x] publisher/imprint identity
- [x] ISBN handling for the initial digital edition
- [x] digital distribution target
- [x] separation of digital and print gates

## Technical gates still required

- [ ] fresh Quarto layout proof after front-matter insertion
- [ ] final immutable publication ref
- [ ] final PDF V1.0 render + QA
- [ ] final EPUB V1.0 render + QA
- [ ] final SHA-256 checksums
- [ ] promotion to `V1.0 FINAL`

## Release action kept separate

- [ ] explicit authorization to create a public GitHub Release

A successful build does not automatically publish the book.

## Separate print gate

Only if a physical edition is later retained:
- choose trim, binding, paper and colour mode;
- obtain printer cover template;
- produce final wrap/spine artwork;
- calculate spine width;
- order and approve a physical proof;
- decide retail ISBN/barcode/price/distribution.

These print decisions do not block the digital V1.0.

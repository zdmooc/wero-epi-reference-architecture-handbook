# Publication RC1 QA — V1.0

**Date:** 2026-09-29  
**Status:** PUBLICATION_RC1_PASS  
**Release state:** NOT PUBLICLY RELEASED

## Build provenance

Publication build workflow:
`.github/workflows/publication-build-v1.yml`

Successful GitHub Actions run:
`36558924392`

Frozen manuscript source:
- ref: `freeze/v1.0-final-manuscript-2026-09-29`
- SHA: `357399fc7bc5dbaf48ae06d3b7e207a47c70193c`

The workflow verifies the frozen SHA before rendering.

## Produced release-candidate artifacts

- `wero-epi-reference-architecture-handbook-v1.0-rc1.pdf`
- `wero-epi-reference-architecture-handbook-v1.0-rc1.epub`
- `SHA256SUMS.txt`

GitHub Actions artifact:
`wero-epi-handbook-v1.0-rc1`

Retention: 30 days.

## PDF QA

Result: **PASS**

- pages: **446**
- page format: **A4**
- original build bytes: **1,743,753**
- unresolved figure references: **0**
- missing rendered images: **0**
- TeX overfull boxes: **0**

SHA-256:

`51a6ceee2bc51b33c833510a58ac8bbe8d1e83ea24000109c2ffe12a269c5e23`

Independent visual regression check:
selected publication pages were rendered and compared against the successful layout proof.

Pages checked:
1, 75, 211, 281, 335, 349, 389, 446.

Result:
**8/8 rendered pages pixel-identical to the approved layout proof.**

## EPUB QA

Result: **PASS**

- EPUB MIME type: `application/epub+zip`
- archive integrity: PASS
- package root: `EPUB/content.opf`
- manifest items: **139**
- spine items: **101**
- XHTML/HTML files: **101**
- SVG assets: **36**
- missing manifest resources: **0**
- unresolved figure references: **0**
- broken internal src/href targets: **0**

SHA-256:

`aa4d61048820381bbcc219325bab43afa30dcb78e557e7c6fd725ecefe535331`

## Pipeline correction during RC1

The first RC1 execution produced the expected 446-page PDF but the QA step failed because the workflow regex for literal `??` was over-escaped.

The manuscript and PDF were not changed.

The CI regex was corrected and RC1 was rerun from the same frozen SHA.

Final run: **PASS**.

## Publication decision

Current state:

`FINAL_MANUSCRIPT_FREEZE → PUBLICATION_RC1_PASS`

This means:
- the V1.0 PDF release candidate exists and passes automated + independent QA;
- the V1.0 EPUB release candidate exists and passes structural QA;
- the manuscript remains tied to the frozen SHA;
- no public GitHub Release, ISBN or distribution has been performed.

## Remaining gates

Before public/commercial release:

- physical print proof if a print edition is retained;
- final cover / imprint / legal-publication metadata review;
- ISBN decision;
- distribution channel decision;
- explicit promotion from RC1 to final V1.0;
- GitHub/publication release only after those decisions.

**Verdict: PUBLICATION_RC1_PASS**

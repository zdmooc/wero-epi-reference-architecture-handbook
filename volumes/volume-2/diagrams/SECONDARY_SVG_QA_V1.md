# Secondary SVG QA — V1

**Date:** 2026-09-29  
**Status:** SECONDARY_SVG_QA_PASS  
**Scope:** 28 secondary figures

## Result

The 28 secondary Mermaid figures were migrated to Visual System V1 and rendered as committed SVG artifacts under:

`diagrams/svg/secondary/`

Final corpus:

- 36 Mermaid figure sources;
- 8 Hero SVGs;
- 28 Secondary SVGs;
- 36 total SVG artifacts;
- 0 missing figure IDs;
- 0 duplicate figure IDs.

## QA checks

The 28 secondary SVGs were checked for:

- valid SVG root and closing tag;
- explicit width and height;
- explicit vector `viewBox`;
- Visual System V1 signature;
- verification date `2026-09-29`;
- semantic rectangles inside the viewBox;
- minimum text size of 12 px equivalent or higher;
- semantic node overlap detection.

## QA result

Before correction:

- 27/28 secondary SVGs: PASS;
- 1/28: geometric overlap detected in `FIG-13-004-resilience-testing-pyramid.svg`.

Correction:

- moved the business/financial evidence block below the TLPT level;
- increased the viewBox height;
- preserved the testing ladder hierarchy.

After correction:

- 28/28: PASS;
- 0 semantic overlaps detected;
- 0 out-of-bounds semantic boxes detected.

## Family coverage

### Journeys / states / identifiers
- FIG-02-001
- FIG-03-002
- FIG-03-003
- FIG-03-004
- FIG-04-001
- FIG-04-002
- FIG-05-002

### ISO 20022 / SCT Inst / rails / liquidity
- FIG-05-003
- FIG-06-001
- FIG-06-002
- FIG-07-002
- FIG-07-003
- FIG-07-004
- FIG-08-001

### TARGET / network / event / security
- FIG-08-002
- FIG-09-002
- FIG-09-003
- FIG-10-001
- FIG-12-001
- FIG-12-002
- FIG-13-001

### Resilience / operations / evidence
- FIG-13-002
- FIG-13-003
- FIG-13-004
- FIG-14-002
- FIG-14-003
- FIG-14-004
- FIG-16-001

## Publication boundary

This QA validates the vector source/artifact geometry and design-system consistency.

A final page-layout proof remains required during publication production to validate:

- actual printed size;
- caption placement;
- page breaks;
- greyscale legibility;
- landscape/portrait placement;
- final book typography.

No PDF or EPUB generation is performed at this stage.

## Decision

**SECONDARY_SVG_QA_PASS**

Combined with the Hero gate:

**36/36 FIGURES — SVG_SOURCE_QA_PASS**

Next step:
`chapter placement + caption/source notes + layout proof → final manuscript freeze → PDF/EPUB`.

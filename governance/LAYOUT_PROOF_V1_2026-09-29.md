# Layout Proof — V1.0 Manuscript

**Date:** 2026-09-29  
**Status:** LAYOUT_PROOF_PASS  
**Scope:** complete Quarto manuscript + 36 integrated SVG figures  
**Workflow:** `.github/workflows/layout-proof.yml`  
**Final successful run:** GitHub Actions run #3 — `36551667995`

## 1. Purpose

This proof validates the complete manuscript as a rendered book before the final V1.0 freeze.

It is a **QA artifact**, not the publication PDF and not an EPUB release.

## 2. Source completeness

Pre-render checks passed:

- canonical chapter files scanned: **87**;
- Quarto figure IDs: **36**;
- prose figure references: **36**;
- embedded SVG figures: **36**;
- duplicate figure IDs: **0**;
- missing SVG paths: **0**.

## 3. HTML proof

Quarto HTML rendering passed:

- rendered HTML files: **98**;
- unresolved figure cross-references: **0**;
- missing rendered images: **0**.

## 4. PDF layout proof

A temporary A4 PDF proof was rendered successfully for layout validation.

Metrics:

- pages: **446**;
- format: **A4**;
- PDF bytes: **1,743,753**;
- unresolved `@fig-xx-xxx` markers: **0**;
- missing images: **0**;
- TeX overfull boxes: **0**.

The 446-page count is a property of the current proof layout, not a fixed editorial page target.

## 5. Visual review

All **36 figure-bearing pages** were reviewed through rendered page images.

Dense/high-value pages were additionally inspected at full size, including:

- FIG-03-001 — C2B Wero end-to-end;
- FIG-09-001 — end-to-end network;
- FIG-11-001 — multi-zone / multi-site;
- FIG-14-001 — bank reference architecture;
- FIG-15-001 — European payments 2030.

### Issue found and corrected

One page-level visual issue was identified:

- `FIG-13-004-resilience-testing-pyramid.svg` — overlap between the TLPT level and the evidence block.

Correction applied:

- evidence block moved below the testing ladder;
- SVG viewBox increased;
- an explicit evidence-gate relation added;
- corrected figure re-rendered and visually rechecked.

The final full Quarto proof was then rerun successfully.

## 6. CI hardening

The dedicated non-publishing workflow now runs on changes to:

- `.github/workflows/layout-proof.yml`;
- `_quarto.yml`;
- `book/**`;
- `diagrams/svg/**`.

The runner installs `librsvg2-bin` so Quarto can convert SVG figures for PDF proof rendering.

The workflow does **not** publish releases and does **not** generate an EPUB.

## 7. Final proof verdict

| Gate | Result |
|---|---|
| Manuscript pre-check | PASS |
| 36 figure references | PASS |
| HTML render | PASS |
| HTML xrefs | PASS — 0 unresolved |
| HTML images | PASS — 0 missing |
| PDF proof render | PASS |
| PDF xrefs | PASS — 0 unresolved |
| TeX overflow | PASS — 0 overfull boxes |
| 36 figure-page visual review | PASS |
| Corrective re-render | PASS |

## Decision

**LAYOUT_PROOF_PASS**

No content, figure-integration, cross-reference or page-layout blocker is currently identified.

## Publication boundary

Still not performed:

- final publication PDF release;
- EPUB release;
- physical print proof;
- ISBN/distribution decision.

Next editorial state:

`LAYOUT_PROOF_PASS → FINAL_MANUSCRIPT_FREEZE → publication build`.

The final publication build must start from the frozen Git commit, not from an unreviewed working branch.

# Iteration Status — I0 to I16

**Baseline:** 2026-09-28  
**Editorial state:** V1.0 — PUBLICATION_RC1_PASS

| Iteration | Scope | Status |
|---|---|---|
| I0 | framing / governance | COMPLETE |
| I1 | official sources | COMPLETE |
| I2 | Wero/EPI public ecosystem | COMPLETE — detailed |
| I3 | end-to-end journeys | COMPLETE — detailed |
| I4 | functional architecture | COMPLETE — detailed |
| I5 | ISO 20022 | COMPLETE — detailed |
| I6 | SCT Inst | COMPLETE — detailed |
| I7 | rails / CSM / TIPS / RT1 | COMPLETE — detailed |
| I8 | settlement / liquidity | COMPLETE — detailed |
| I9 | network / flows | COMPLETE — detailed |
| I10 | API / event / data | COMPLETE — detailed |
| I11 | infrastructure / cloud / Kubernetes/OpenShift | COMPLETE — detailed |
| I12 | security / identity / fraud / VoP | COMPLETE — detailed |
| I13 | resilience / DORA / testing | COMPLETE — detailed |
| I14 | operations / SRE / E2E reference architectures | COMPLETE — detailed |
| I15 | future / interoperability / Digital Euro | COMPLETE — detailed |
| I16 | testing / evidence / content quality gate | COMPLETE |

## Verified manuscript structure

- 87 canonical chapter files;
- 97 canonical files including annexes and verified baseline;
- 36 Mermaid diagram sources;
- 0 missing paths in `publishing/book-order.txt`;
- official-source registry maintained with dated/current status.

## Meaning of COMPLETE

`COMPLETE` means the first-edition GitHub manuscript has a coherent, detailed treatment of the full architecture scope and has passed the repository content audit.

It does not mean the subject stops evolving. Wero, EPC rulebooks, TARGET/TIPS, RT1, regulation and Digital Euro remain versioned topics.

## Publication state

The manuscript freeze is complete and the **PDF/EPUB RC1 publication artifacts have passed QA**.

Completed before RC1:
- visual copy-edit / figure placement;
- index/cross-reference integration;
- PDF RC1 render and QA;
- EPUB RC1 render and structural QA.

Still pending:
- physical print proof if retained;
- final cover/imprint/legal-publication metadata;
- ISBN/distribution decisions;
- explicit promotion from RC1 to final V1.0.

This separation is deliberate: first finish the book in GitHub, then manufacture publication artifacts.


## Editorial finishing pass — 2026-09-29

- terminology/style guide added;
- glossary expanded;
- acronym index added;
- subject index added;
- cross-reference map added;
- all foundation DRAFT chapters reviewed;
- 36/36 Mermaid sources contain truth metadata and verification date;
- critical official sources revalidated;
- no TODO/TBD/FIXME content markers found;
- figure numbering and placement review completed;
- 2 redundant diagrams removed and 4 high-value diagrams added;
- final figure source set = 36;
- 8 Hero SVGs = QA PASS;
- 28 Secondary SVGs = QA PASS;
- 36/36 figure SVG corpus = SVG_SOURCE_QA_PASS;
- 36 figures embedded in 34 canonical chapters;
- captions/source notes/cross-references = PASS;
- figure-to-chapter integration = FIGURE_CHAPTER_INTEGRATION_PASS.

Status: **FINAL_MANUSCRIPT_FREEZE**.


## Layout proof pass — 2026-09-29

- Quarto layout proof = PASS;
- HTML render / xrefs / images = PASS;
- PDF layout proof = PASS;
- 446 A4 proof pages;
- 0 unresolved figure references;
- 0 missing images;
- 0 overfull TeX boxes;
- 36 figure-bearing pages reviewed;
- FIG-13-004 corrected and revalidated.

Status: **LAYOUT_PROOF_PASS — READY_FOR_FINAL_MANUSCRIPT_FREEZE**.


## Final manuscript freeze — 2026-09-29

- proof basis: PASS;
- post-proof render-sensitive diff: 0;
- manuscript baseline frozen;
- publication artifacts still deferred.

Status: **FINAL_MANUSCRIPT_FREEZE**.


## Publication RC1 — 2026-09-29

- frozen-source build = PASS;
- PDF RC1 = PASS;
- EPUB RC1 = PASS;
- checksum validation = PASS;
- independent PDF visual regression = PASS.

Status: **PUBLICATION_RC1_PASS**.

Next gate: print/release metadata/distribution decision before final V1.0 public release.


## Final release readiness — 2026-09-29

Prepared:
- canonical RC1 publication metadata;
- final release-readiness gate;
- physical print-proof checklist.

Pending explicit decisions:
- cover;
- imprint/legal metadata;
- publisher;
- ISBN;
- distribution;
- physical print proof;
- final V1.0 promotion/public release.

Status: **PUBLICATION_RC1_PASS — RELEASE_DECISION_PENDING**.

# Audit V1.0 — Wero & EPI Reference Architecture Handbook

Date: 2026-09-29  
Scope: GitHub manuscript V1.0 — content audit

## Executive conclusion

The repository now contains a complete first-edition architecture manuscript spanning the end-to-end payment path from customer experience to interbank settlement, liquidity, network, infrastructure, security, resilience, operations and European regulatory context.

## Strongest characteristics

1. **Layer separation**
   - Wero, SCT Inst, ISO 20022, CSM, settlement and liquidity are not conflated.

2. **Payment correctness**
   - idempotency, UNKNOWN, investigation and reconciliation are treated as core architecture concerns.

3. **Network depth**
   - DNS, DDoS, WAF, LB, ingress, firewall, mTLS, PKI, HSM, banking connectivity and flow matrices are part of the main manuscript.

4. **Rail depth**
   - TIPS and RT1 are represented from current operator material; RT1 is not incorrectly described as deferred/commercial-bank settlement.

5. **Evidence discipline**
   - public facts, reference architectures and runtime evidence remain distinct.

6. **Operational resilience**
   - BIA, failure domains, RTO/RPO, fencing, split brain, cyber recovery, third-party risk and DORA evidence are integrated.

7. **Maintainability**
   - source registry, changelog, diagram source, annual release model and CI publication pipeline exist.

## Primary-source checks completed

- EPI/Wero public service evolution.
- EPC SCT Inst 2025 v1.1.
- EPC SCT Inst Inter-PSP IG 2025 message versions.
- EPC VoP v1.1.
- ECB TIPS/TARGET.
- EBA CLEARING RT1.
- Regulation EU 2024/886.
- DORA EU 2022/2554.
- GDPR/eIDAS2/NIS2 baseline.
- PSD3/PSR political-status baseline.
- ECB digital euro pilot/status.

## Known boundaries

The manuscript does not claim:
- EPI internal architecture;
- a real participant bank's network/topology;
- production performance figures;
- production multi-AZ/site proof;
- legal advice;
- a physical print proof;
- that PDF/EPUB layout has already been validated.

## Delegated references

Detailed specialist depth remains in:
- Payment Hub / ISO repository;
- DORA masterbook;
- OpenShift/Kafka/MQ specialists;
- instant-payments executable lab.

## Manuscript decision

- GitHub manuscript content: **PASS**
- Canonical chapter paths: **PASS — 0 missing**
- Detailed I1→I16 coverage: **PASS**
- Source/evidence governance: **PASS**
- Diagram source catalogue: **PASS**
- PDF/EPUB generation: **DEFERRED BY EDITORIAL DECISION**
- Physical print approval: **NOT STARTED**
- Long-term maintenance: **ACTIVE 2026→2031**

Verified structure on 2026-09-28:
- 87 chapter files;
- 97 canonical files including annexes/baseline;
- 36 Mermaid diagram sources.

## Next maintenance triggers

- EPC rulebook/IG update;
- Wero capability/country changes;
- TIPS/RT1 documentation changes;
- digital euro legislative/pilot changes;
- PSD3/PSR finalisation/application;
- DORA Level 2 updates;
- factual corrections from technical review.


## Editorial review pass — 2026-09-29

PASS:
- no missing canonical paths;
- no TODO/TBD/FIXME markers;
- 4 remaining DRAFT foundation chapters reviewed and promoted to REVIEWED;
- glossary expanded;
- acronym annex added;
- subject index added;
- architecture cross-reference map added;
- all 36 Mermaid diagrams contain truth-level and verification metadata;
- critical public baseline revalidated against current EPC, ECB, EBA CLEARING and EPI pages.

Decision: **READY_FOR_MANUSCRIPT_FREEZE**.

This means the GitHub content has no identified architecture/editorial blocker. It does not mean PDF/EPUB layout has been produced.


## Diagram review pass — 2026-09-29

PASS:
- 36 final Mermaid figures;
- 0 duplicate figure IDs;
- 2 redundant figures removed;
- Parts 03, 09 and 13 renumbered coherently;
- payment-state figure moved to functional architecture Part 04;
- UNKNOWN recovery wording corrected to avoid ambiguous FAILED state;
- POS/QR, recall-return, SCT Inst timing and resilience-testing figures added;
- final placement/layout plan recorded in `diagrams/DIAGRAM_CATALOG.md`.

The manuscript is now ready for SVG rendering and visual production after freeze.


## Hero-figure source preparation — 2026-09-29

PASS:
- Visual Design System V1 created;
- 8/8 hero figures migrated to the common visual grammar;
- 8/8 hero figures declare layout, truth level, verification date and canonical chapter;
- FIG-14-001 established as the master visual vocabulary;
- Digital Euro future semantics remain explicitly separated from current payment rails;
- no PDF/EPUB generation performed.

Status: **HERO_SOURCE_PREPARED**.

Next step: SVG rendering and visual QA of the 8 hero figures.


## Hero SVG visual QA — 2026-09-29

PASS:
- 8/8 hero SVG artifacts rendered;
- 8/8 structurally valid with width/height/viewBox;
- 8/8 visually inspected;
- FIG-11 routing corrected;
- FIG-14 line-crossing density corrected;
- FIG-15 current/future routing corrected;
- footer signatures normalized to Visual System V1.

Decision: **HERO_SVG_QA_PASS**.


## Secondary SVG QA — 2026-09-29

PASS:
- 28/28 secondary Mermaid figures migrated to Visual System V1 metadata;
- 28/28 secondary SVG artifacts rendered;
- 28/28 SVGs structurally valid with width/height/viewBox;
- minimum text size >= 12 px equivalent;
- 0 out-of-bounds semantic boxes;
- 0 semantic overlaps after correction;
- FIG-13-004 evidence block repositioned after geometry QA;
- 0 missing SVG figure IDs;
- 0 duplicate SVG figure IDs.

Combined decision:
**36/36 FIGURES — SVG_SOURCE_QA_PASS**.

Remaining validation belongs to page-layout proof, not source-figure production.


## Figure-to-chapter integration — 2026-09-29

PASS:
- 36/36 SVG figures embedded in canonical chapters;
- 34 canonical target chapters;
- 36 unique Quarto `#fig-xx-xxx` identifiers;
- 36 prose cross-references;
- 36 captions;
- 36 truth/source/date notes;
- 0 missing SVG paths;
- 0 missing chapter paths;
- 0 duplicate figure IDs.

Intentional double-figure chapters:
- SCT Inst timing: FIG-06-001 + FIG-06-002;
- BIA/RTO/RPO: FIG-13-001 + FIG-13-002.

Decision: **FIGURE_CHAPTER_INTEGRATION_PASS**.

Remaining proof is page-level rendering/layout, not content or figure-source completion.

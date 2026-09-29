# Collection transformation — Iteration status

Branch: `collection-v2-four-volumes`

| Iteration | Scope | Status |
|---|---|---|
| I1 | collection editorial architecture | COMPLETE |
| I2 | canonical transaction model | COMPLETE |
| I3 | four master journeys | COMPLETE |
| I4 | Volume I migration | COMPLETE |
| I5 | Volume I enrichment/review | COMPLETE |
| I6 | Volume II migration | COMPLETE |
| I7 | Volume II deepening/review | COMPLETE |
| I8 | Volume III migration | COMPLETE |
| I9 | Volume III technical deepening | COMPLETE |
| I10 | Volume IV migration | COMPLETE |
| I11 | Volume IV deepening/review | COMPLETE |
| I12 | duplicate elimination / canonical ownership | COMPLETE |
| I13 | cross-volume thread consistency | COMPLETE |
| I14 | diagrams and visual corpus | COMPLETE |
| I15 | source/evidence gate | COMPLETE |
| I16 | annexes, glossary, indexes, navigation | COMPLETE |
| I17 | Quarto/build/layout/QA | IN_PROGRESS |
| I18 | freeze, checksums and collection releases | PLANNED |

## I1 acceptance
- four volume questions defined;
- canonical ownership defined;
- V1.0 preservation rule defined;
- passage boundaries between volumes defined.

## I2 acceptance
- canonical actors established;
- canonical identifiers established;
- four independent state dimensions established;
- financial correctness invariants established;
- fictional shared transaction identifiers established.

## I3 acceptance
- four master journeys established;
- variants separated from master journeys;
- post-payment taxonomy established;
- cross-volume replay rule established.

No V1.0 release artifact has been modified.


## I4 acceptance
- 19 V1.0 chapters materialised under `volumes/volume-1/`;
- original V1.0 files remain untouched;
- dedicated Volume I index and Quarto manifest created.

## I5 acceptance
- e-commerce desktop and mobile split into distinct master journeys;
- in-store/POS promoted to master journey;
- Request Money and Bill Split classified as variants;
- recurring/subscription separated from post-payment;
- Refund / Return / Recall / Investigation / Dispute given a canonical taxonomy;
- Volume I Quarto order updated to the recomposed journey structure.


## I6 acceptance
- 22 canonical V1.0 chapters migrated to `volumes/volume-2/`;
- ISO 20022, SCT Inst, rails and liquidity kept together;
- dedicated Volume II landing page and Quarto manifest created.

## I7 acceptance
- financial-correctness synthesis added;
- UNKNOWN / retry / idempotency boundaries made explicit;
- deterministic multi-rail routing decision model added;
- liquidity resilience model added;
- Volume II manifest updated.


## I8 acceptance
- 20 canonical V1.0 chapters migrated to `volumes/volume-3/`;
- network, API/event/data, infrastructure and technical capstones grouped;
- dedicated Volume III landing page and Quarto manifest created.

## I9 acceptance
- concrete Kubernetes/OpenShift payment workload blueprint added;
- probes, topology spread, PDB and NetworkPolicy semantics aligned with current official documentation;
- durable payment-submission pattern added;
- runtime evidence/failure-test ladder added;
- Volume III manifest updated.


## I10 acceptance
- 23 canonical security/resilience/operations/testing/regulation chapters migrated;
- V1.0 release-gate chapter intentionally excluded from reader corpus;
- dedicated Volume IV landing page and Quarto manifest created.

## I11 acceptance
- resilience architecture decision framework added;
- transaction-safe failover/failback runbook added;
- payment incident command model added;
- resilience evidence chain added;
- Volume IV manifest updated.


## I12 acceptance
- canonical concept ownership matrix created;
- reconciliation, PKI/HSM and multi-site overlap boundaries made explicit;
- three superseded combined Volume I journey files removed.

## I13 acceptance
- three canonical cross-volume transaction threads created;
- identifiers remain stable from business journey to rail, platform and operations;
- UNKNOWN and site-failover scenarios explicitly cross all four volumes;
- mandatory consistency checkpoints defined.


## I14 acceptance
- all 36 V1.0 figures assigned to canonical volume owners;
- shared diagram tree exposed to all four volume workspaces;
- collection-only COL-001 four-volume map source added;
- collection-only COL-002 UNKNOWN cross-volume thread source added;
- semantic fork rule defined.

## I15 acceptance
- Wero/EPI, SCT Inst, VoP, TIPS, RT1 and DORA baselines revalidated against current primary sources;
- Kubernetes/OpenShift primary documentation added to source registry;
- VOP 2.0 identified as active watch after the 2026-09-29 baseline;
- source/evidence gate report recorded.


## I16 acceptance
- collection-level navigation and global index created;
- per-volume subject indexes created;
- glossary/acronym snapshots materialised from canonical shared sources;
- ISO 20022 annex assigned to Volume II;
- failure/RTO-RPO/RACI annexes assigned to Volume IV;
- annexes and indexes integrated into all four Quarto manifests.


## I17 editorial normalization pass
- 131 Markdown files normalized conservatively;
- duplicate manual H2+ numbering removed where Quarto already numbers sections;
- Markdown list separation normalized outside fenced code;
- post-normalization build required before I17 closure.

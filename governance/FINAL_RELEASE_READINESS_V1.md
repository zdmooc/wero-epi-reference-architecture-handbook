# Final Release Readiness — V1.0

**Date:** 2026-09-29  
**Current state:** PUBLICATION_RC1_PASS  
**Public release:** BLOCKED pending explicit release decisions

## Provenance locked

- frozen ref: `freeze/v1.0-final-manuscript-2026-09-29`
- frozen SHA: `357399fc7bc5dbaf48ae06d3b7e207a47c70193c`
- successful RC1 build: `36558924392`
- PDF SHA-256: `51a6ceee2bc51b33c833510a58ac8bbe8d1e83ea24000109c2ffe12a269c5e23`
- EPUB SHA-256: `aa4d61048820381bbcc219325bab43afa30dcb78e557e7c6fd725ecefe535331`

## Completed gates

- [x] manuscript content complete
- [x] source / truth governance
- [x] 36 figures designed and integrated
- [x] Quarto layout proof
- [x] final manuscript freeze
- [x] PDF RC1 render
- [x] PDF automated QA
- [x] representative PDF visual-regression QA
- [x] EPUB RC1 render
- [x] EPUB archive/package/resource/internal-link QA
- [x] artifact checksums
- [x] RC1 report

## Decisions still required before public/commercial release

- [ ] final front-cover design approved
- [ ] back-cover / product-description copy approved if needed
- [ ] imprint / legal-publication page approved
- [ ] trademark wording reviewed
- [ ] publisher/imprint identity decided
- [ ] ISBN decision
- [ ] distribution-channel decision
- [ ] print format decided if a physical edition is retained
- [ ] physical print proof approved if print is retained
- [ ] commercial price decision if sold
- [ ] explicit promotion `RC1 → V1.0 FINAL`
- [ ] explicit authorization for public GitHub/publication release

## Legal/editorial boundary

The handbook must continue to:
- identify itself as independent reference material, not official EPI/Wero documentation;
- cite and paraphrase primary sources rather than reproduce protected material at scale;
- distinguish Wero, EPI and other trademarks from the author's publication identity;
- preserve PUBLIC_VERIFIED vs REFERENCE_ARCHITECTURE vs INFERRED vs RUNTIME_PROVEN.

This file does not provide legal advice. Final publication/legal wording should be reviewed before commercial distribution.

## Release rule

No public release is authorized merely because RC1 passed.

Promotion to final V1.0 requires an explicit decision after the pending gates above are resolved.

## Next technical action

When release decisions are complete:
1. add final cover/imprint metadata without altering technical content;
2. rerun the Quarto layout proof if any render-sensitive front matter changes;
3. rebuild final PDF/EPUB from the approved final ref;
4. verify new checksums;
5. promote to V1.0 FINAL;
6. only then create a public release/distribution package.

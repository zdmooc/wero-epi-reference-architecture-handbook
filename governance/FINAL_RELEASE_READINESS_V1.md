# Final Release Readiness — V1.0

**Date:** 2026-09-29  
**Current state:** PUBLICATION_RC1_PASS  
**Release-readiness state:** DECISION_GATE  
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
- [x] PDF RC1 render + QA
- [x] EPUB RC1 render + QA
- [x] artifact checksums
- [x] RC1 report
- [x] cover design brief
- [x] back-cover copy draft
- [x] imprint/legal template
- [x] trademark/independence editorial wording based on official Wero/EPI sources
- [x] print-proof checklist
- [x] final release decision matrix

## Files prepared for the decision gate

- `publishing/COVER_BRIEF_V1.md`
- `publishing/BACK_COVER_COPY_V1.md`
- `publishing/IMPRINT_TEMPLATE_V1.md`
- `publishing/TRADEMARK_INDEPENDENCE_NOTE_V1.md`
- `publishing/PRINT_PROOF_CHECKLIST_V1.md`
- `publishing/RELEASE_DECISION_MATRIX_V1.md`
- `publishing/metadata.yaml`

## Decisions still required before public/commercial release

- [x] front-cover concept approved
- [ ] final front-cover artwork approved
- [x] back-cover copy approved
- [ ] imprint / legal-publication page approved
- [ ] trademark/legal wording reviewed
- [ ] publisher/imprint identity decided
- [ ] ISBN decision
- [ ] distribution-channel decision
- [ ] print format decided if a physical edition is retained
- [ ] physical print proof approved if print is retained
- [ ] commercial price decision if sold
- [ ] explicit promotion `RC1 → V1.0 FINAL`
- [ ] explicit authorization for public release

## Editorial recommendation at this gate

Keep the interior manuscript frozen.

The current A4/446-page RC1 is the lowest-risk baseline for any physical proof because it preserves the already-approved layout. Selecting a different trim size creates a new layout variant and must trigger a fresh proof.

Digital artifacts are technically ready, but no public distribution is authorized by this file.

## Legal/editorial boundary

The handbook must continue to:
- identify itself as independent reference material, not official EPI/Wero documentation;
- cite and paraphrase primary sources rather than reproduce protected material at scale;
- distinguish Wero, EPI and other marks from the author's publication identity;
- preserve PUBLIC_VERIFIED vs REFERENCE_ARCHITECTURE vs INFERRED vs RUNTIME_PROVEN.

Official Wero/EPI public terms were checked on 2026-09-29 for the editorial trademark wording.

This file does not provide legal advice. Final commercial/public wording should receive appropriate review.

## Release rule

No public release is authorized merely because RC1 passed.

Promotion to final V1.0 requires an explicit decision after the pending gates above are resolved.

## Next technical action after decisions

When release decisions are complete:
1. insert approved cover/imprint metadata without altering technical content;
2. rerun the Quarto layout proof because front matter/cover is render-sensitive;
3. rebuild final PDF/EPUB from an approved final ref;
4. verify new checksums;
5. promote to V1.0 FINAL;
6. only then create any public release/distribution package.

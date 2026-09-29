# Final Release Readiness — V1.0

**Date:** 2026-09-29  
**RC1 state:** PUBLICATION_RC1_PASS  
**Current state:** DIGITAL_V1_FINALIZATION  
**Public release:** NOT YET AUTHORIZED

## Technical content

The 87 technical chapters have been reread end to end. No architecture blocker was identified.

The core invariants remain coherent across the book:
- Wero / scheme / ISO 20022 / CSM / settlement are separate layers;
- commercial state is distinct from financial state;
- UNKNOWN is not FAILED;
- no blind financial retry after a possible external effect;
- idempotency and reconciliation are first-class safety mechanisms;
- reference architecture, public facts and runtime evidence remain explicitly separated.

## Volatile-source revalidation

Critical current claims were rechecked on 2026-09-29 against official EPC, ECB, EBA CLEARING and EPI material.

No manuscript-blocking contradiction was identified in the current SCT Inst, VoP, TIPS, RT1, Wero commerce or digital-euro baseline.

## RC1 provenance retained

- frozen ref: `freeze/v1.0-final-manuscript-2026-09-29`
- frozen SHA: `357399fc7bc5dbaf48ae06d3b7e207a47c70193c`
- successful RC1 build: `36558924392`
- PDF RC1 SHA-256: `51a6ceee2bc51b33c833510a58ac8bbe8d1e83ea24000109c2ffe12a269c5e23`
- EPUB RC1 SHA-256: `aa4d61048820381bbcc219325bab43afa30dcb78e557e7c6fd725ecefe535331`

## Completed gates

- [x] manuscript content complete
- [x] end-to-end editorial reread
- [x] source / truth governance
- [x] critical volatile-source revalidation
- [x] 36 figures designed, rendered and integrated
- [x] RC1 Quarto layout proof
- [x] RC1 PDF render + QA
- [x] RC1 EPUB render + QA
- [x] RC1 checksums
- [x] digital cover decision — Quarto title page
- [x] back-cover copy approved
- [x] publisher/imprint selected — Djamal Zidane — publication indépendante
- [x] initial digital ISBN decision — no ISBN assigned
- [x] digital distribution target — GitHub Release
- [x] print work separated from digital release
- [x] publication note prepared and inserted into front matter

## Final digital gates

Because the publication note changes front matter, RC1 cannot simply be renamed.

Required:
1. run a fresh Quarto HTML/PDF layout proof;
2. verify no unresolved references, missing assets or TeX overflow;
3. freeze the resulting publication source;
4. build final PDF + EPUB from that immutable ref;
5. verify checksums and structural QA;
6. record final provenance;
7. promote state to `V1.0 FINAL`.

## Print is no longer a digital blocker

The following are intentionally deferred to a future physical/retail edition:
- standalone retail/print cover artwork;
- trim and binding;
- printer template and spine;
- physical proof;
- print ISBN/barcode;
- print price/distribution.

## Legal/editorial boundary

The front matter identifies the handbook as independent reference material and avoids any claim of official EPI/Wero sponsorship or certification.

No legal-compliance certification is claimed. A dedicated legal review remains advisable before a commercial retail/print edition, but it is not represented as having occurred.

## Public-release rule

The build pipeline may reach `V1.0 FINAL` without automatically creating a public GitHub Release.

Public release remains an explicit user-controlled action.

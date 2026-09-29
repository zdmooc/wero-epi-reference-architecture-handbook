# Final Release Decision Matrix — V1.0

**Date:** 2026-09-29  
**Current technical state:** PUBLICATION_RC1_PASS  
**Public release:** NOT AUTHORIZED

The technical work is complete through RC1. The remaining items are publication decisions.

| Decision | Current state | Options | Technical consequence |
|---|---|---|---|
| Digital PDF | RC1 PASS | release / hold | no manuscript reflow if unchanged |
| EPUB | RC1 PASS | release / hold | secondary digital format |
| Front cover | brief ready | approve design / request revision | final cover must be inserted before final build |
| Back-cover copy | draft ready | approve / edit | affects print cover only |
| Imprint/legal page | template ready | approve wording / legal review | insertion changes rendered front matter |
| Trademark wording | editorial draft ready | approve after review / revise | imprint + possibly cover |
| Publisher/imprint identity | TBD | author/self-published / publishing entity / other | metadata + imprint |
| ISBN | TBD | assign / do not assign where channel allows | metadata + barcode/print distribution |
| Print edition | TBD | none / colour paperback / colour hardback / other | requires physical proof |
| Print trim | TBD | A4 / another large professional format | any trim change requires new layout proof |
| Price | TBD | digital and/or print pricing | commercial metadata only unless printed on cover |
| Distribution | TBD | direct / GitHub asset / website / retailer / print platform | release packaging |
| Public GitHub Release | blocked | authorize / keep private | must be explicit |
| Final V1.0 promotion | blocked | promote RC1 / continue RC cycle | creates final publication state |

## Technical recommendation before any public release

### 1. Keep the approved interior frozen

Do not change technical chapters merely for release packaging.

### 2. Treat A4 as the zero-reflow print-proof baseline

The approved proof and RC1 PDF are currently A4 and 446 pages. A physical A4 proof is the lowest-risk way to validate the current interior without reflow.

If another trim size is selected, it becomes a new layout variant and must pass a new Quarto layout proof.

### 3. Digital-first is technically ready

PDF RC1 and EPUB RC1 have already passed QA. Their public release remains blocked only by publication metadata/authorization, not by technical content.

### 4. Print remains a separate gate

A digital PASS does not validate:
- gutter;
- paper stock;
- colour reproduction;
- physical line weight;
- spine width;
- cover wrap;
- binding.

## Minimum decisions needed to promote RC1 to final digital V1.0

- [ ] approve front-cover design
- [ ] approve imprint/legal/trademark wording
- [ ] decide publisher/imprint identity
- [ ] decide ISBN handling for chosen distribution route
- [ ] decide digital distribution channel(s)
- [ ] explicitly approve `RC1 → V1.0 FINAL`
- [ ] explicitly approve public release

## Additional decisions needed for print

- [ ] choose print format and binding
- [ ] choose paper/interior colour mode
- [ ] obtain printer cover template
- [ ] calculate spine width
- [ ] order physical proof
- [ ] approve physical proof
- [ ] decide print price/distribution

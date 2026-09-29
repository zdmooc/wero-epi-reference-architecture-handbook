# V1.0 Quality Gate

## Editorial
- [x] no fixed page-count constraint
- [x] coherent end-to-end narrative
- [x] network, flows, rails, settlement and liquidity are core domains
- [x] facts separated from reference design
- [x] chapters carry status / verification metadata
- [x] glossary exists
- [x] annexes exist
- [x] diagrams use source format and truth metadata

## Public truth
- [x] Wero/EPI public baseline dated
- [x] EPC SCT Inst current rulebook registered
- [x] EPC ISO message versions verified
- [x] VoP current rulebook registered
- [x] TIPS sourced from ECB
- [x] RT1 sourced from EBA CLEARING
- [x] IPR sourced from EUR-Lex
- [x] DORA sourced from EUR-Lex
- [x] PSD3/PSR described as legislative trajectory, not silently promoted to applicable law
- [x] Digital euro described as conditional/preparatory, not issued

## Anti-invention
- [x] no claimed internal EPI topology
- [x] no claimed bank internal technology
- [x] Kubernetes/OpenShift/Kafka/MQ clearly reference/lab patterns
- [x] CRC scope limitations explicit
- [x] no fake RTO/RPO presented as contractual
- [x] no fake universal API presented as EPI API

## Payment correctness
- [x] UNKNOWN != FAILED
- [x] no blind financial retry
- [x] idempotency and concurrency addressed
- [x] settlement truth separated from UI success
- [x] refund/return/recall separated
- [x] reconciliation first-class
- [x] liquidity first-class

## Network
- [x] zones
- [x] DNS
- [x] DDoS/WAF
- [x] LB/proxy
- [x] API gateway
- [x] firewalls/flow matrix
- [x] banking connectivity
- [x] mTLS/PKI/HSM
- [x] latency/connection failure modes

## Resilience / DORA
- [x] BIA
- [x] RTO/RPO
- [x] failure domains
- [x] fencing/split brain
- [x] degraded modes
- [x] chaos
- [x] third-party/exit
- [x] evidence model

## Manuscript structure
- [x] I1→I16 detailed
- [x] canonical order complete
- [x] no missing canonical file
- [x] source registry current at baseline date
- [x] 36 maintainable Mermaid source diagrams
- [x] claim/evidence governance normalized
- [x] terminology/style guide
- [x] acronym index
- [x] subject index
- [x] cross-reference map
- [x] critical sources revalidated on 2026-09-29

## Publication — deliberately deferred
- [x] figure source selection / numbering / canonical placement
- [x] Visual Design System V1
- [x] 8 hero figures source-prepared
- [x] 8 hero SVGs rendered and visually QA-passed
- [x] 28 secondary SVGs rendered and vector/geometry QA-passed
- [x] 36/36 SVG figure artifacts complete
- [x] 36 figures embedded in 34 canonical chapters
- [x] Quarto figure IDs / captions / source notes / cross-references
- [x] remaining 28 figures: Visual System V1 + SVG vector/geometry QA
- [x] Quarto page-layout render proof
- [x] 0 unresolved figure references / 0 missing images / 0 overfull boxes
- [x] 36 figure-bearing pages reviewed
- [x] FIG-13-004 page-layout issue corrected and revalidated
- [x] final manuscript freeze
- [x] figure-page visual QA / page-layout proof
- [ ] PDF render
- [ ] EPUB render
- [ ] physical print proof
- [ ] ISBN/distribution decision

## Gate decision

**V1.0 GITHUB MANUSCRIPT: PASS — FINAL_MANUSCRIPT_FREEZE**

**PDF/EPUB: NOT STARTED BY EDITORIAL DECISION**

**PRINT-PRODUCTION APPROVAL: NOT STARTED**

The manuscript, 36 SVG artifacts, chapter integration, Quarto layout proof and final manuscript freeze are complete. The next action is a separate publication build.

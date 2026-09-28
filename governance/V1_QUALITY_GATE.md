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

## Publication
- [x] reproducible Pandoc build defined
- [x] PDF target defined
- [x] EPUB target defined
- [x] CI artifact workflow defined
- [ ] physical print proof - requires a physical/professional printer proof and is not claimable from CI

## Gate decision

**V1.0 MANUSCRIPT: PASS**

**V1.0 DIGITAL BUILD: PASS when CI build artifact succeeds.**

**PRINT-PRODUCTION APPROVAL: intentionally pending physical proof.**

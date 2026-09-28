# Roadmap 2026→2031

## V0.1 — Foundation

Objectif : poser le système éditorial.

- [x] README / mission
- [x] scope
- [x] master TOC
- [x] editorial governance
- [x] internal repositories map
- [x] changelog
- [x] preface
- [x] Chapter 1 — layered architecture
- [x] Chapter 2 — end-to-end payment anatomy
- [ ] official sources registry
- [ ] diagram catalogue
- [ ] glossary seed
- [ ] publication toolchain

## V0.2 — Payments foundations

- Wero/EPI public context
- actors and trust boundaries
- wallet vs scheme vs rail vs CSM vs settlement
- full payment lifecycle
- state machine

## V0.3 — ISO 20022 / SCT Inst

- pacs.008 / pacs.002
- pacs.004 / pacs.028
- camt.029 / camt.056
- camt.052/053/054
- reason codes
- annotated XML
- status / timeout / UNKNOWN / reconciliation

## V0.4 — Rails / settlement / liquidity

- T2
- TIPS
- RT1
- STET
- reachability
- Central Bank Money
- prefunding
- liquidity 24/7/365
- stress scenarios

## V0.5 — Network & flows

- edge
- zones
- WAF/LB/API Gateway
- internal and banking networks
- TLS/mTLS
- PKI/HSM
- flow matrix
- latency budgets
- failure modes

## V0.6 — Application / event / data

- API
- payment orchestration
- Kafka
- outbox/inbox
- idempotency
- ledger
- reconciliation
- consistency

## V0.7 — Security

- IAM
- SCA
- OAuth2/OIDC
- workload identity
- fraud
- AML/CFT
- sanctions
- VoP

## V0.8 — Infrastructure / cloud / OpenShift

- DC/cloud
- multi-AZ/region
- K8s/OpenShift
- database HA
- Kafka HA
- GitOps
- backup/PITR

## V0.9 — Resilience / DORA

- BIA
- RTO/RPO
- HA/PRA
- split brain/fencing
- degraded modes
- chaos
- DORA
- TLPT
- third-party risk
- exit strategy

## V1.0 — First publishable edition

Criteria:

- end-to-end completeness ;
- source register ;
- no unresolved high-risk TO_BE_VERIFIED claims ;
- diagrams classified ;
- glossary ;
- index ;
- PDF print proof ;
- technical review ;
- regulatory review.

## Annual major editions

- V2 — 2027
- V3 — 2028
- V4 — 2029
- V5 — 2030
- V6 — 2031

Each major edition:
- revalidates official sources ;
- records scheme/regulatory changes ;
- updates public Wero/EPI capabilities ;
- refreshes diagrams ;
- preserves historical changelog.

## Minor releases

Used when:
- EPC Rulebook changes ;
- EPI/Wero launches a material capability ;
- settlement / CSM documentation changes ;
- EU regulation materially changes ;
- factual correction is required.

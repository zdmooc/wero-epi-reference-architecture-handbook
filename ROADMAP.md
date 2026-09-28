# Roadmap 2026→2031

## V1.0 — First reference manuscript — 2026-09-28

### I0 — Foundation
- [x] mission / scope
- [x] master TOC
- [x] editorial governance
- [x] internal repository map
- [x] GitHub + Drive operating model
- [x] publishing strategy
- [x] diagram system
- [x] preface and foundations

### I1 — Official sources
- [x] EPI/Wero
- [x] EPC SCT Inst
- [x] EPC VoP
- [x] ECB TIPS/TARGET
- [x] EBA CLEARING RT1
- [x] EU regulations
- [x] dated verified baseline

### I2 — Wero/EPI ecosystem
- [x] public baseline
- [x] roles / four-corner merchant model
- [x] staged service evolution
- [x] volatile capability rule

### I3 — End-to-end journeys
- [x] P2P
- [x] e-commerce
- [x] mobile/app-to-app
- [x] POS/QR
- [x] recurring
- [x] refund / return / recall
- [x] payment state model

### I4 — Functional architecture
- [x] capability map
- [x] domains
- [x] orchestration
- [x] merchant / consumer boundaries
- [x] reconciliation

### I5 — ISO 20022
- [x] message model
- [x] pacs.008 / pacs.002
- [x] pacs.004 / pacs.028
- [x] camt.029 / camt.056
- [x] cash-management context
- [x] identifiers / correlation
- [x] versioning

### I6 — SCT Inst
- [x] lifecycle
- [x] time budget
- [x] reject / timeout
- [x] UNKNOWN
- [x] investigation
- [x] duplicate protection
- [x] recall / return
- [x] 24/7 operations

### I7 — Rails
- [x] CSM / reachability
- [x] T2 / TARGET
- [x] TIPS
- [x] RT1
- [x] multi-rail routing
- [x] settlement finality

### I8 — Settlement / liquidity
- [x] central-bank money
- [x] MCA / DCA / CLM
- [x] prefunding
- [x] 24/7 liquidity
- [x] stress scenarios

### I9 — Networks / flows
- [x] zones
- [x] DNS / DDoS / WAF
- [x] LB / ingress / gateway
- [x] firewalls / flow matrix
- [x] banking connectivity
- [x] TLS/mTLS / PKI / HSM
- [x] latency / TCP / MTU
- [x] failure catalogue

### I10 — API / Event / Data
- [x] REST contracts
- [x] idempotency
- [x] durable intent
- [x] Outbox / Inbox
- [x] Kafka / MQ patterns
- [x] ledger
- [x] reconciliation
- [x] consistency / RPO

### I11 — Infrastructure / Cloud
- [x] failure domains
- [x] Kubernetes/OpenShift
- [x] DB/broker HA
- [x] multi-AZ / multi-site
- [x] GitOps
- [x] backup/PITR
- [x] supply chain
- [x] capacity

### I12 — Security
- [x] IAM / SCA
- [x] OAuth2/OIDC
- [x] workload identity
- [x] TLS/mTLS / PKI / HSM
- [x] VoP
- [x] fraud / AML / sanctions
- [x] GDPR context
- [x] threat model

### I13 — Resilience / DORA
- [x] BIA
- [x] RTO / RPO
- [x] active/passive / active/active
- [x] fencing / split brain
- [x] degraded modes
- [x] chaos
- [x] third-party / exit
- [x] DORA evidence

### I14 — Operations / Reference architectures
- [x] SRE / OTel
- [x] logs / metrics / traces
- [x] SLI / SLO / capacity
- [x] runbooks
- [x] bank reference architecture
- [x] PSP/acquirer/merchant reference architecture

### I15 — Future / Annexes / Tests / Regulation
- [x] interoperability
- [x] digital euro
- [x] cross-border / FX
- [x] 50 failure scenarios
- [x] checklists
- [x] RTO/RPO matrix
- [x] ISO catalog
- [x] RACI
- [x] testing/evidence strategy
- [x] regulatory map
- [x] expanded glossary

### I16 — Publication / Quality
- [x] coverage matrix
- [x] V1 quality gate
- [x] final audit
- [x] reproducible PDF/EPUB pipeline
- [x] GitHub Actions artifact workflow
- [ ] physical print proof — external physical step

## V1.x — Maintenance

Minor releases are triggered by:
- Wero/EPI public capability changes;
- EPC rulebook/IG changes;
- [x] TIPS/RT1 material changes;
- EU regulatory changes;
- critical factual corrections.

## Annual editions

- V2 — 2027
- V3 — 2028
- V4 — 2029
- V5 — 2030
- V6 — 2031

Each major edition:
1. revalidates all current primary sources;
2. refreshes volatile Wero/EPI information;
3. rechecks message/rulebook versions;
4. rechecks legal status;
5. updates diagrams;
6. runs quality gate and digital builds;
7. performs a new print proof when a physical edition changes materially.


## v1.0.0-rc1 — 2026-09-28

I1→I16 completed for first-edition architecture/content scope.

Remaining publication-only gates:
- automated build run;
- visual inspection;
- figure expansion/numbering;
- copy edit;
- print proof;
- distribution/ISBN decision.

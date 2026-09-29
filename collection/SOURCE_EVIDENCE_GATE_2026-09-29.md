# Source & Evidence Gate — Collection V2 — 2026-09-29

Status: **PASS WITH ACTIVE WATCH ITEMS**

## Revalidated public baseline

### Wero / EPI
EPI public material dated 16 September 2026 remains the current commerce baseline used by the collection:
- commerce expansion;
- first selected in-store use cases in Belgium;
- more than 48,000 merchants reported across Belgium, France, Germany, Luxembourg and the Netherlands.

### SCT Inst
Current EPC baseline:
- 2025 SCT Inst Rulebook version 1.1;
- effective since 5 October 2025;
- current until 21 November 2027 03:30 CET according to the EPC current-rulebook page;
- 2025 implementation guidelines based on the 2019 ISO 20022 message version;
- unstructured address format no longer permitted from 15 November 2026 under the current rulebook.

### Verification of Payee
- VOP Rulebook version 1.1 effective 20 September 2026.
- EPC has a VOP 2.0 evolution cycle with publication announced for end-November 2026.
- Therefore VOP is an **ACTIVE_WATCH** topic for the next maintenance release.

### TIPS
Current Eurosystem material confirms:
- real-time settlement;
- central bank money;
- 24/7/365;
- final and irrevocable settlement;
- TIPS DCA participation model.

### RT1
Current EBA CLEARING material confirms:
- pan-European real-time gross settlement;
- 24/7;
- immediately available central-bank funds;
- SCT Inst / OCT Inst support;
- interoperability/reachability options and TIPS-related settlement connectivity.

### DORA
Regulation (EU) 2022/2554 remains in force and applies from 17 January 2025.

## Technology source gate

Primary documentation added for:
- Kubernetes startup/readiness/liveness probes;
- Kubernetes topology spread constraints;
- Kubernetes disruptions/PDB;
- OpenShift Container Platform 4.22 NetworkPolicy.

## Evidence rules

1. Current public claims require a dated primary source.
2. Reference architecture may use primary technology documentation without becoming a claim about Wero/EPI internals.
3. Runtime evidence states the environment and tested failure domain.
4. A local/single-node lab cannot prove multi-node, AZ, site or production throughput.
5. A release/build PASS is publication evidence, not production-resilience evidence.

## Active watch list

- Wero country/capability changes;
- VOP 2.0 publication;
- next SCT Inst scheme-rulebook release after the 2026 change cycle;
- TIPS/RT1 material service changes;
- PSD3/PSR final legal status/application dates;
- Digital Euro pilot/legislative changes;
- OpenShift/Kubernetes version-specific semantics used by Volume III.

Decision: **I15 source/evidence gate can close for the 2026-09-29 collection baseline.**

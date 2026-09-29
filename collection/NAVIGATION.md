# Collection Navigation

## Read by question

- **What is Wero/EPI and how do customer/merchant journeys work?** → Volume I.
- **How is the payment encoded, processed, routed and settled?** → Volume II.
- **How is the payment platform built on APIs, events, data, network and OpenShift?** → Volume III.
- **How is it secured, recovered, operated and evidenced?** → Volume IV.

## Recommended reading paths

### Payment architect
V1 → V2 → selected V3 data/API chapters → V4 resilience.

### Platform/OpenShift architect
V1 foundations → V2 financial correctness → V3 complete → V4 BIA/fencing/SRE.

### Resilience architect
V1 states/ownership → V2 UNKNOWN/settlement → V3 multi-site/data → V4 complete.

### Security architect
V1 trust boundaries → V2 VoP/rail context → V3 network → V4 security sections.

## Cross-volume threads
Use `CROSS_VOLUME_THREAD_SCENARIOS.md` for T1 P2P nominal, T2 e-commerce UNKNOWN and T3 POS site failover.

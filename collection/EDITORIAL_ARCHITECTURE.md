# Editorial Architecture — Four-volume collection

## 1. Questions answered by each volume

### Volume I
**What is Wero/EPI and how does a user or merchant payment journey behave functionally?**

Owns:
- actors and responsibilities;
- Consumer PSP / Acceptor PSP boundaries;
- P2P, e-commerce, app-to-app and in-store journeys;
- alias/directory, consent and payment request concepts;
- commercial/customer/payment state separation at functional level;
- capability map and domain model;
- post-payment functional experience.

Does not own:
- exact ISO 20022 scheme processing;
- rail settlement mechanics;
- Kubernetes implementation;
- operational failover engineering.

### Volume II
**How is an instant payment expressed, routed, processed and settled?**

Owns:
- ISO 20022;
- SCT Inst;
- R-transactions and investigations at scheme level;
- TIPS / RT1 / CSM;
- reachability and routing;
- settlement finality;
- liquidity.

Does not own:
- merchant UX;
- platform implementation;
- security operating model.

### Volume III
**How is the payment platform engineered?**

Owns:
- API contracts;
- event-driven architecture;
- Outbox/Inbox;
- Kafka/MQ patterns;
- ledger and data stores;
- consistency and concurrency;
- network and flow architecture;
- Kubernetes/OpenShift;
- database/broker HA mechanisms;
- GitOps and software supply chain;
- bank and PSP/merchant technical reference architectures.

Does not redefine:
- SCT Inst rules;
- business payment states;
- RTO/RPO business objectives;
- incident governance.

### Volume IV
**How is the end-to-end service secured, kept correct during failure, operated and evidenced?**

Owns:
- IAM/SCA;
- PKI/HSM/key lifecycle;
- fraud/AML/sanctions controls;
- operational resilience and DORA;
- BIA and RTO/RPO;
- active/passive and active/active authority;
- fencing and split brain;
- degraded mode and recovery;
- cyber recovery and third-party exit;
- SRE/SLI/SLO;
- incident/runbook/on-call;
- test and evidence strategy;
- regulatory architecture map.

## 2. Canonical-definition rule

A concept has exactly one canonical owner.

Other volumes:
1. provide only the minimum local reminder;
2. use the same vocabulary and identifiers;
3. link to the canonical owner;
4. never silently create a conflicting definition.

Examples:
- `UNKNOWN`: scheme semantics in V2; implementation in V3; recovery operations in V4.
- idempotency: financial invariant in V2; API/data implementation in V3.
- PKI/HSM: network dependency in V3; trust/key lifecycle in V4.
- reconciliation: functional ownership in V1; message context in V2; data model in V3; operational process in V4.
- multi-site: topology mechanism in V3; authority/failover/fencing in V4.

## 3. Truth and evidence vocabulary

The V1.0 vocabulary remains canonical:
- PUBLIC_VERIFIED
- REFERENCE_ARCHITECTURE
- INFERRED
- RUNTIME_PROVEN
- TO_BE_VERIFIED

Publication must never promote one category into another merely because content has been rendered or tested.

## 4. Shared source assets

Collection-owned:
- glossary;
- acronym registry;
- public verified baseline;
- claim/evidence method;
- cross-volume subject index;
- architecture cross-reference;
- source registry;
- visual language.

Per-volume outputs may contain generated extracts, but the source remains unique.

## 5. Cross-volume passage pages

Each volume ends with an explicit boundary:

- V1 → V2: from functional intent/state to scheme execution.
- V2 → V3: from rail contract to implementation contract.
- V3 → V4: from deployed mechanisms to resilience/security objectives.
- V4 → V1: from production evidence back to customer/business service.

## 6. Anti-duplication gate

Before a chapter is accepted:
- identify canonical owner;
- identify legitimate local reminder;
- remove repeated explanation;
- add cross-reference;
- verify terminology against canonical model.

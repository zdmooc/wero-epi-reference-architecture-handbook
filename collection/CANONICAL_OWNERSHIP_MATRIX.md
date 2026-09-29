# Canonical Ownership Matrix

This matrix prevents the four-volume collection from explaining the same concept four different ways.

| Concept | Canonical owner | Allowed treatment elsewhere |
|---|---|---|
| Wero actors / customer journey | V1 | context reminder only |
| Commercial state | V1 | consume, do not redefine |
| Payment functional state | V1 | V2 maps to scheme semantics |
| ISO 20022 message semantics | V2 | V3 implements parser/adapter |
| SCT Inst lifecycle | V2 | V1 explains UX; V4 recovery |
| UNKNOWN | V2 | V3 persistence/automation; V4 incident/recovery |
| Idempotency financial invariant | V2 | V3 technical enforcement |
| Reachability / rail selection semantics | V2 | V3 adapter implementation |
| Settlement finality | V2 | V4 uses evidence |
| Liquidity model | V2 | V3 telemetry; V4 operations |
| API contract | V3 | V1 only functional contract |
| Event model / Outbox / Inbox | V3 | V4 uses for recovery evidence |
| Ledger / data model | V3 | V1 owns business meaning |
| Network flow / runtime platform | V3 | V4 owns security/resilience objectives |
| Kubernetes/OpenShift mechanisms | V3 | V4 tests failure outcomes |
| PKI/HSM network dependency | V3 | V4 owns trust/key lifecycle |
| Multi-site topology | V3 | V4 owns authority/fencing/failover |
| IAM/SCA security control | V4 | V1 describes customer step |
| Fraud/AML/sanctions security controls | V4 | V1 lists functional capability |
| VoP scheme intersection | V2 | V4 owns customer/security control |
| BIA/RTO/RPO | V4 | V3 provides enabling mechanisms |
| Active/active authority/fencing | V4 | V3 supplies topology primitives |
| SLI/SLO/incident/runbook | V4 | other volumes expose measurements |
| Operational reconciliation | V4 | V1 ownership, V2 messages, V3 data |
| Claim/evidence method | Collection | generated reminder in each volume |

## Reconciliation decomposition

Reconciliation appears in all four volumes by design:

- **V1** — who owns the business discrepancy?
- **V2** — which scheme/rail evidence and messages exist?
- **V3** — where is state persisted and compared?
- **V4** — who runs the process, resolves breaks and proves closure?

These are complementary views, not four competing definitions.

## PKI/HSM decomposition

- V3: network endpoints, dependencies, availability path.
- V4: certificate lifecycle, key custody, trust, rotation, incident response.

## Multi-site decomposition

- V3: infrastructure topology and replication mechanism.
- V4: write authority, fencing, promotion, failback and evidence.

## Editorial gate

A new chapter must declare:
1. its canonical concept owner;
2. what it contributes beyond the owner;
3. the exact cross-volume dependency.

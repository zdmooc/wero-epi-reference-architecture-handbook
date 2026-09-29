---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources:
  - epc-sct-inst-2025-v1.1
related_internal_repos:
  - zdmooc/mayabank-instant-payments-resilience-platform
---

# Idempotence, doublons et reconciliation SCT Inst

## 1. Duplicate protection exists at several layers

~~~text
UI/client
API
Payment orchestrator
Payment Hub
ISO adapter
Scheme/CSM
Beneficiary PSP
Event consumers
Merchant callback
~~~

One layer cannot replace all others.

## 2. Business idempotency

Key represents stable intent.

For a merchant:
~~~text
merchant + order + payment attempt identity
~~~

For P2P:
~~~text
payer + logical action + resolved beneficiary + amount context
~~~

The exact formula is product-specific.

## 3. Atomic claim

Pattern:
1. insert unique business key ;
2. if inserted, caller owns creation ;
3. if conflict, return existing payment ;
4. if same key different immutable payload, return conflict.

## 4. Durable caller intent

Before invoking a financial downstream service:
- persist intent ;
- persist request identity ;
- commit.

Then a crash can recover same payment.

## 5. Crash window

Hard case:

~~~text
downstream SETTLED
→ local process crashes before storing SETTLED
~~~

Recovery must:
- reload durable intent ;
- query downstream using stable reference ;
- converge same payment.

## 6. Duplicate pacs/message

Transport duplicate may arise from retry.

Receiving processing needs:
- scheme duplicate checks ;
- stable identifiers ;
- replay detection ;
- idempotent business posting.

## 7. Duplicate event

Inbox pattern:
- unique eventId ;
- atomic insert/claim ;
- one business effect.

## 8. Duplicate webhook

Merchant integration:
- eventId ;
- paymentRequestId ;
- signature ;
- same event can be acknowledged repeatedly ;
- only one order state transition.

## 9. Reconciliation as final guard

Even with perfect idempotency design, reconciliation detects:
- missing local record ;
- unexpected duplicate ;
- amount mismatch ;
- external state mismatch.

## 10. Reconciliation windows

### Immediate
UNKNOWN after timeout.

### Intraday
Operational breaks.

### End-of-day
Accounting completeness.

### Historical
Late return/recall/dispute.

## 11. Source hierarchy

When local and external disagree:
- scheme/settlement evidence ;
- core/ledger ;
- durable payment ;
- events ;
- logs.

The exact authority depends on what question is asked.

## 12. Controlled replay

Never replay raw financial commands from DLQ without:
- lookup current state ;
- business authorization ;
- idempotency ;
- audit.

## 13. Performance

Unique constraints/locks must scale.

Measure:
- contention ;
- lock duration ;
- retry ;
- DB hot key ;
- throughput.

Idempotence should serialize only identical intent, not all payments.

## 14. Evidence from companion lab

Runtime-proven scope on CRC includes:
- 10/50/100 concurrent same-key requests ;
- one owner, remaining replays ;
- crash window recovery ;
- external inquiry ;
- same payment converging ;
- no blind financial retry.

Boundary:
single-node application-level evidence, not production HA.

## 15. Review checklist

- stable key defined ?
- uniqueness atomic ?
- different payload conflict ?
- intent durable before external effect ?
- same payment queryable after crash ?
- duplicate messages safe ?
- duplicate events safe ?
- reconciliation independent ?

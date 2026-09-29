# Canonical Transaction Model

This model is the shared vocabulary for all four volumes.

## 1. Canonical actors

- Customer / Payer
- Beneficiary / Payee
- Merchant
- Wallet / Bank App
- Consumer PSP
- Acceptor PSP / Acquirer
- Beneficiary PSP
- Wero / EPI service context
- Payment Orchestrator
- Payment Hub
- SCT Inst Gateway / Rail Adapter
- CSM / settlement infrastructure
- TIPS / RT1 where applicable
- Fraud / Risk
- VoP service
- IAM / SCA
- Ledger
- Reconciliation service
- Notification / Webhook service
- Operations / SRE

These are logical roles. They do not assert EPI internal topology.

## 2. Canonical identifiers

Every worked example should reuse a stable set of identifiers:

| Identifier | Meaning | Primary owner |
|---|---|---|
| `customerId` | customer identity reference | IAM/business |
| `merchantId` | merchant/acceptor reference | merchant domain |
| `orderId` | commercial order | merchant |
| `paymentRequestId` | request to create/authorise payment | payment orchestration |
| `paymentId` | internal logical payment | payment domain |
| `idempotencyKey` | logical retry identity | API/payment domain |
| `endToEndId` | end-to-end payment identifier | scheme/payment |
| `txId` | inter-PSP transaction identifier where applicable | scheme |
| `messageId` | message-level identity | integration/scheme |
| `settlementRef` | settlement evidence reference | rail/settlement |
| `eventId` | immutable event identity | event platform |
| `correlationId` | technical trace correlation | observability |

No volume may reuse one identifier for a different semantic purpose.

## 3. Four independent state dimensions

### Commercial state
`ORDER_CREATED → PAYMENT_PENDING → PAID / PAYMENT_FAILED / CANCELLED / REFUND_PENDING / REFUNDED`

### Customer/consent state
`PRESENTED → AUTHENTICATION_REQUIRED → AUTHORISED / DECLINED / EXPIRED`

### Payment/scheme state
`CREATED → VALIDATED → SUBMITTED → ACCEPTED / REJECTED / UNKNOWN → RESOLVED`

### Financial/settlement state
`NOT_SUBMITTED → IN_FLIGHT → SETTLED / NOT_SETTLED / UNKNOWN`

The exact transition vocabulary may be refined, but these dimensions must never be collapsed into one status.

## 4. Core invariants

1. A browser redirect is not financial settlement evidence.
2. A UI retry does not create a new financial intent unless explicitly requested.
3. After a submit whose effect is uncertain, the payment becomes `UNKNOWN`; replacement execution is blocked until resolved.
4. One logical payment has one controlled financial submission authority at a time.
5. Settlement evidence cannot be downgraded because a later technical response is lost.
6. Alias resolution is not account ownership.
7. Reconciliation can repair observation divergence; it must not invent a second financial movement.
8. External side effects require durable intent and correlation.
9. Commercial success is derived from authoritative payment information, not from client-side navigation.
10. Active/active does not mean uncontrolled dual-writer.

## 5. Canonical transaction examples

The collection uses the same fictional data:

- Customer: `CUST-ALICE-001`
- Beneficiary: `CUST-BOB-001`
- Merchant: `MERCHANT-NOVA-001`
- Order: `ORD-2026-000123`
- Payment request: `PREQ-2026-000123`
- Logical payment: `PAY-2026-000123`
- Idempotency key: `IK-PAY-2026-000123`

The examples are intentionally fictional and must never be presented as internal EPI/Wero data.

## 6. Cross-volume usage

- V1 explains why the states and responsibilities exist.
- V2 maps them to scheme messages, timing and settlement.
- V3 implements them in APIs, data stores, events and runtime.
- V4 tests their correctness under attack, failure and recovery.

# Cross-volume Thread Scenarios

The same fictional transactions are reused across all four volumes.

## Scenario T1 — P2P nominal

### Identity
- payer: `CUST-ALICE-001`
- payee: `CUST-BOB-001`
- paymentId: `PAY-P2P-2026-000001`
- idempotencyKey: `IK-P2P-2026-000001`

### V1
Explain alias resolution, consent/SCA, responsibility and the four independent state dimensions.

### V2
Map the payment to SCT Inst/ISO 20022 identifiers, route, processing outcome and settlement evidence.

### V3
Implement API idempotency, durable submission claim, ledger/outbox, rail adapter and observability correlation.

### V4
Define SLOs, fraud/security controls, incident signals and evidence for the nominal service.

---

## Scenario T2 — E-commerce payment becomes UNKNOWN

### Identity
- customer: `CUST-ALICE-001`
- merchant: `MERCHANT-NOVA-001`
- orderId: `ORD-2026-000123`
- paymentRequestId: `PREQ-2026-000123`
- paymentId: `PAY-2026-000123`
- idempotencyKey: `IK-PAY-2026-000123`

### Event
The payment is submitted. The local system loses the authoritative response before it can establish the final financial outcome.

### V1 — customer and merchant interpretation
- browser/app return is not authoritative;
- commercial order remains `PAYMENT_PENDING`;
- customer must not be told "failed" without evidence;
- a second checkout action must resolve to the same logical payment or be blocked according to business policy.

### V2 — financial semantics
- outcome is `UNKNOWN`;
- no replacement financial payment is created;
- inquiry/reconciliation resolves to settled or not settled;
- scheme/rail identifiers remain attached to the original payment.

### V3 — implementation
- durable submit claim exists before external effect;
- crash/timeout does not delete `paymentId`;
- Outbox/Inbox and unique constraints prevent duplicate side effects;
- reconciliation worker repairs local observation.

### V4 — operations
- alert on UNKNOWN backlog/rate;
- incident command identifies possible external effect;
- runbook forbids blind resubmission;
- evidence shows final outcome and customer/merchant state repair.

---

## Scenario T3 — In-store payment during site failover

### Identity
- merchant: `MERCHANT-NOVA-001`
- orderId: `POS-ORDER-2026-000777`
- paymentRequestId: `PREQ-POS-2026-000777`
- paymentId: `PAY-POS-2026-000777`

### Event
The primary application site loses connectivity while one payment is in flight.

### V1
- POS sale stays pending until authoritative backend result;
- QR scan or customer screen is not settlement proof;
- merchant/customer state remains explainable.

### V2
Classify the rail state:
- not submitted;
- rejected;
- possibly submitted/UNKNOWN;
- settled.

Routing to a different rail/site is not allowed merely because the first response is missing.

### V3
- topology spread protects pod placement within available failure domains;
- data authority and submission claim are durable;
- platform failover mechanisms restore runtime capacity;
- network/rail connectivity is revalidated.

### V4
- old writer is fenced before promotion;
- incident commander owns irreversible actions;
- target site promotion is evidenced;
- in-flight transactions are classified;
- reconciliation proves no duplicate external effect;
- failback is a second controlled authority transfer.

---

## Mandatory thread checkpoints

Every volume must answer for T1–T3:

1. Who owns the state?
2. Which identifier is authoritative?
3. Has a financial effect possibly occurred?
4. What is safe to retry?
5. What evidence changes UNKNOWN into a known state?
6. Which component/actor may make the next irreversible decision?
7. How is the customer/merchant state repaired after recovery?

## Consistency rule

A scenario may gain technical detail in later volumes, but its identities, business facts and prior outcomes must not change.

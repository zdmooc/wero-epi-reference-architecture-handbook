# Master Journeys

The collection uses four master journeys. Other scenarios are variants, capabilities or post-payment processes.

## Journey 1 — P2P

Purpose: simplest complete account-to-account journey.

Canonical sequence:
1. payer selects alias/contact;
2. directory resolves recipient;
3. payer sees recipient context;
4. consent/SCA;
5. Consumer PSP creates one logical payment;
6. payment enters SCT Inst execution;
7. settlement/outcome is obtained;
8. beneficiary side credits according to applicable model;
9. both sides receive correlated status.

Primary teaching points:
- alias ≠ account;
- idempotent retry;
- timeout before/after possible effect;
- authoritative status;
- UNKNOWN and investigation.

## Journey 2 — E-commerce desktop + QR

Purpose: separate commercial checkout from mobile payment approval.

Sequence:
1. merchant creates `orderId`;
2. backend creates `paymentRequestId`;
3. desktop displays QR/payment context;
4. customer scans with bank/Wero-capable app;
5. consent/SCA;
6. payment executes;
7. Acceptor PSP/merchant backend receives authoritative result;
8. browser is refreshed/redirected as a presentation concern.

Primary teaching points:
- redirect ≠ settlement;
- order/payment correlation;
- payment request expiry;
- webhook/idempotency;
- commercial vs financial state.

## Journey 3 — Mobile app-to-app

Purpose: explain deep-link/app-switch boundaries.

Sequence:
1. merchant app obtains payment context;
2. signed/opaque deep link opens wallet/bank app;
3. customer authenticates and approves;
4. backend executes payment;
5. authoritative backend status is persisted;
6. app callback/refresh presents result.

Primary teaching points:
- callback spoofing;
- app killed during payment;
- replay;
- wrong order correlation;
- backend source of truth.

## Journey 4 — In-store / POS QR

Purpose: model physical merchant acceptance.

Variants:
- dynamic transaction QR;
- static merchant/acceptance-point QR where publicly supported.

Dynamic sequence:
1. POS creates sale;
2. merchant/acquirer creates payment request;
3. QR binds merchant, amount and payment context;
4. customer scans;
5. wallet presents trusted merchant/amount;
6. customer approves;
7. payment executes;
8. merchant/POS closes sale on authoritative backend status.

Primary teaching points:
- QR substitution;
- expiry/reuse;
- amount binding;
- terminal/backend correlation;
- offline/partial failure.

## Not master journeys

The following remain essential but are not equivalent top-level customer journeys:
- Request Money;
- Bill Split;
- recurring/subscription;
- refund;
- return;
- recall;
- investigation;
- dispute.

They are treated as **variants, lifecycle capabilities or post-payment processes**.

## Post-payment section

The collection uses a dedicated taxonomy:

### Commercial reversal
Refund initiated from merchant/customer-service context.

### Scheme/financial return
New financial movement governed by applicable scheme process.

### Recall
Request to recover a previously executed transfer under applicable rules.

### Investigation
Process used to resolve uncertain or disputed transaction state.

### Dispute
Broader customer/business/legal process; must not be collapsed into a specific SCT Inst R-transaction.

## Cross-volume thread

Each master journey is replayed four times:
- **V1:** actors, user journey, capabilities, state;
- **V2:** ISO 20022/SCT Inst/rail/settlement;
- **V3:** API/event/data/network/OpenShift implementation;
- **V4:** threat/failure/recovery/SRE/evidence.

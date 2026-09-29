---
status: COLLECTION_V2_REVIEWED
last_verified: 2026-09-29
truth_level: REFERENCE_ARCHITECTURE
primary_sources:
  - epc-sct-inst-2025-v1.1
  - epc-sct-inst-reason-codes-2025-v7
---

# Financial correctness patterns

This chapter consolidates the invariants that prevent a technical retry from becoming a duplicate financial effect.

## 1. One logical payment, one controlled submission authority

A logical payment is identified before external submission. A timeout does not erase that identity.

```text
CREATED
→ VALIDATED
→ SUBMISSION_CLAIMED
→ SUBMITTED
→ ACCEPTED / REJECTED / UNKNOWN
→ RESOLVED
```

The exact scheme state is governed by the applicable rulebook. The internal states above are a reference architecture for preserving correctness.

## 2. Retry decision matrix

| Observation | Effect certainty | Action |
|---|---|---|
| failure before durable submit | no effect evidenced | retry same logical payment may be allowed |
| explicit authoritative rejection | no settlement | handle rejection; retry only per rule/business policy |
| response lost after possible submit | uncertain | UNKNOWN; do not create replacement payment |
| settlement evidenced | effect exists | persist/repair observation; never resubmit |
| duplicate callback/status | no new intent | deduplicate and update same payment |

## 3. UNKNOWN is a safety state

`UNKNOWN` means the system lacks sufficient evidence to classify the financial outcome.

It does not mean:
- failed;
- safe to retry;
- settled;
- customer should be charged again.

Recovery path:

```text
UNKNOWN
→ status inquiry / rail evidence / account evidence
→ reconciliation
→ SETTLED or NOT_SETTLED
→ downstream repair
```

## 4. Idempotency boundary

Idempotency must cover the financial intent, not only one HTTP request.

Useful identity chain:
`idempotencyKey → paymentId → endToEndId → external references`.

## 5. Duplicate protection layers

- API duplicate;
- workflow duplicate;
- event duplicate;
- rail/message duplicate;
- customer double action;
- operator replay.

Each layer may use a different technical mechanism, but all converge on the same logical payment identity.

## 6. Reconciliation principle

Reconciliation repairs differences in observation between authoritative systems. It must not manufacture a second payment to make dashboards agree.

## 7. Cross-volume contract

- V1 owns customer/commercial interpretation.
- V2 owns financial correctness semantics.
- V3 implements durable claims, uniqueness and event deduplication.
- V4 owns recovery operations and evidence.

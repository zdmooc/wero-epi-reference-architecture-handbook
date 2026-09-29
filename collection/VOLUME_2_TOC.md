# Volume II — Instant Payments: ISO 20022, SCT Inst, TIPS, RT1 & Liquidity

## Question
How is the payment represented, processed, routed and settled?

## Proposed structure

### Part A — ISO 20022
1. ISO 20022 mental model
2. Business Application Header and identifiers
3. pacs.008 / pacs.002 annotated
4. R-transactions: camt.056 / camt.029 / pacs.004 / pacs.028
5. Cash-management and reconciliation messages
6. Validation, mapping and versioning

### Part B — SCT Inst
7. Scheme lifecycle
8. Timing, timeout and reason codes
9. UNKNOWN and status recovery
10. Recall, return and investigation
11. Idempotency, duplicates and reconciliation
12. VoP intersection

### Part C — Rails and settlement
13. CSM, clearing, settlement and finality
14. TIPS
15. RT1
16. Reachability
17. Multi-CSM routing
18. Rail adapter contract and failure semantics

### Part D — Liquidity
19. Settlement liquidity 24/7
20. TARGET accounts and liquidity transfers
21. RT1 liquidity position
22. Forecasting and stress
23. Liquidity operations runbook

### Part E — Interoperability
24. Cross-border / OCT Inst / interoperability

### Passage to Volume III
From scheme/rail contract to implementation contract.

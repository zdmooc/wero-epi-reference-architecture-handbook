---
status: REVIEWED
last_verified: 2026-09-28
truth_level: EDITORIAL
primary_sources: []
related_internal_repos: []
---

# Gate V1.0 — contenu GitHub

## 1. Purpose

This gate decides whether the manuscript content is complete enough to freeze before PDF/EPUB work.

It does not generate publication artifacts.

## 2. Scope gate

Required domains:
- Wero/EPI ;
- journeys ;
- functional ;
- ISO 20022 ;
- SCT Inst ;
- rails ;
- settlement/liquidity ;
- network ;
- API/EDA/data ;
- infrastructure ;
- security ;
- resilience/DORA ;
- SRE/operations ;
- future/interoperability ;
- testing/evidence ;
- regulation ;
- annexes.

## 3. Source gate

- primary-source registry exists ;
- current EPC versions checked ;
- TIPS/RT1 checked ;
- Wero facts dated ;
- regulation status dated ;
- digital euro marked as preparation/watch.

## 4. Truth gate

No:
- invented EPI internals ;
- client-confidential architecture ;
- local lab presented as production ;
- reference design presented as official.

## 5. Payment correctness gate

Must cover:
- idempotency ;
- UNKNOWN ;
- timeout ;
- inquiry ;
- reconciliation ;
- refund ;
- return ;
- recall ;
- duplicates ;
- state authority.

## 6. Network gate

Must cover:
- DNS ;
- DDoS ;
- WAF ;
- LB ;
- ingress ;
- east-west ;
- firewall ;
- banking connectivity ;
- PKI/HSM ;
- flow matrix ;
- latency.

## 7. Settlement gate

Must cover:
- scheme vs CSM ;
- TIPS ;
- RT1 ;
- reachability ;
- routing ;
- finality ;
- accounts ;
- liquidity ;
- 24/7 operations.

## 8. Resilience gate

Must cover:
- BIA ;
- RTO/RPO ;
- multi-AZ/site ;
- active/passive ;
- active/active risks ;
- fencing ;
- degraded mode ;
- chaos ;
- cyber recovery ;
- third parties.

## 9. Operations gate

Must cover:
- SLIs/SLOs ;
- capacity ;
- on-call ;
- incidents ;
- reconciliation operations ;
- runbooks.

## 10. Annex gate

Need:
- glossary ;
- ISO catalog ;
- failure scenarios ;
- RTO/RPO matrix ;
- RACI ;
- checklists ;
- source baseline.

## 11. Diagram gate

For content freeze:
- core architecture diagrams exist as source ;
- all are labelled reference/public appropriately.

Final visual polishing can occur after content freeze and before PDF.

## 12. Editorial gate

Before freeze:
- no duplicate chapter trees ;
- canonical order complete ;
- headings coherent ;
- terminology consistent ;
- cross-links review.

## 13. Deferred publication gate

After content freeze only:
- cover ;
- typography ;
- pagination ;
- PDF ;
- EPUB ;
- index layout ;
- physical proof.

## 14. Version

When all content gates pass:
- mark manuscript V1.0 CONTENT_FROZEN ;
- tag only after final repository audit.

## 15. Principle

First finish the book in GitHub. Then manufacture the publication artifacts.

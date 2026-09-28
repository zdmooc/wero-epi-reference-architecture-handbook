# V1 Release Audit

**Audit date:** 2026-09-28  
**Target:** v1.0.0-rc1

## 1. Scope audit

PASS:
- Wero/EPI public baseline;
- P2P / C2B / e-commerce / mobile / POS reference journeys;
- ISO 20022;
- SCT Inst;
- TIPS / RT1 / CSM distinction;
- settlement / liquidity;
- networks / flows;
- API / EDA / data;
- Kubernetes/OpenShift/cloud;
- security / IAM / fraud / VoP;
- resilience / DORA;
- SRE / run;
- Digital Euro watch;
- professional checklists/failure scenarios.

## 2. Truth audit

PASS:
- internal Wero/EPI architecture is not asserted as public fact;
- runtime evidence is scoped;
- CRC mono-node limits are explicit;
- reference architectures are labelled;
- time-sensitive public facts are dated.

## 3. Critical technical corrections embedded

PASS:
- Wero != SCT Inst != ISO 20022 != TIPS/RT1;
- RT1 is not described as deferred commercial-bank-money settlement;
- TIPS and RT1 central-bank-money context is separated correctly;
- timeout != failure;
- UNKNOWN != FAILED;
- camt.056 is not a generic timeout mechanism;
- refund/return do not erase the original payment;
- browser redirect is not a source of financial truth;
- webhook loss has active-status recovery;
- idempotency is tied to stable business intent;
- event exactly-once is not confused with exactly-one financial effect.

## 4. Regulatory audit

PASS for RC:
- Regulation (EU) 2024/886 tracked;
- DORA Regulation (EU) 2022/2554 tracked;
- EPC SCT Inst current baseline tracked;
- EPC VoP current baseline tracked;
- PSD3/PSR treated as legislative trajectory until final applicable texts are verified;
- Digital Euro treated as pilot/watch, not issued currency.

## 5. Source audit

PASS:
- official-source registry exists;
- source precedence defined;
- verification baseline recorded;
- internal repositories are never primary public evidence.

## 6. Network audit

PASS:
- edge;
- DNS;
- DDoS/WAF;
- LB;
- ingress/router;
- firewall;
- north/south;
- east/west;
- CSM connectivity;
- TLS/mTLS;
- PKI/HSM;
- flow matrix;
- latency;
- network failure cases.

## 7. Resilience audit

PASS:
- failure domains;
- infrastructure/app/operations resilience;
- RTO/RPO;
- active/passive;
- active/active risks;
- fencing;
- degraded mode;
- chaos/test method;
- DORA;
- third-party/exit.

## 8. Publication audit

READY FOR AUTOMATED BUILD:
- source tree coherent;
- Quarto config present;
- build workflow present;
- front matter present.

REQUIRES OUTPUT-SPECIFIC VALIDATION AFTER BUILD:
- page breaks;
- table overflow;
- diagram legibility;
- print margins;
- fonts;
- cover;
- physical proof.

## 9. Verdict

**Architecture/content scope: V1 RELEASE CANDIDATE.**

The correct status is not “final physical book printed”; it is:

`v1.0.0-rc1 — editorial/architecture release candidate`.

This preserves the handbook's truth rule.

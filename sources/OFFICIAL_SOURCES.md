# Official Sources Registry

**Verification baseline:** 2026-09-28  
**Policy:** publication claims must be rechecked against primary sources before each major release.

## 1. Wero / EPI

### EPI Company — Wero commerce rollout
- Authority: European Payments Initiative / EPI Company
- Source: https://epicompany.eu/media-insights/wero-next-now-e-commerce-accelerates-as-in-store-takes-its-first-steps/
- Published: 2026-09-16
- Verified: 2026-09-28
- Status: CURRENT PUBLIC EPI SOURCE
- Key facts used by the handbook:
  - Wero expanded to selected in-store payments in Belgium.
  - More than 48,000 merchants across Belgium, France, Germany, Luxembourg and the Netherlands had processed Wero transactions.
  - Wero's commercial scope is expanding beyond P2P into e-commerce, recurring bills and selected physical-store use cases.
- Editorial rule: these figures are dated 2026-09 and must never be presented as timeless totals.

### EPI Company — BNP Paribas rollout
- Source: https://epicompany.eu/media-insights/bn-paribas-supports-the-accelerated-rollout-of-wero/
- Published: 2026-09-09
- Verified: 2026-09-28
- Status: CURRENT PUBLIC EPI SOURCE
- Use: evidence of merchant acceptance rollout and retail-customer e-commerce usage.

### Wero public FAQ — merchant acceptance
- Source: https://support.wero-wallet.eu/hc/fr/articles/39413057671057-Comment-puis-je-recevoir-des-paiements-Wero-en-tant-que-commer%C3%A7ant
- Verified: 2026-09-28
- Use: merchant acceptance is obtained through the merchant's payment service provider.

### Wero public FAQ — online payment availability
- Source: https://support.wero-wallet.eu/hc/fr/articles/39378717150481-O%C3%B9-puis-je-payer-en-ligne-avec-Wero
- Verified: 2026-09-28
- Use: Wero is progressively available as an online payment method in participating markets.

## 2. EPC — SCT Inst

### 2025 SCT Inst Rulebook v1.1
- Authority: European Payments Council
- Source: https://www.europeanpaymentscouncil.eu/document-library/rulebooks/2025-sepa-instant-credit-transfer-rulebook-version-11
- Effective: 2025-10-05 03:30 CET
- Verified: 2026-09-28
- Status: CURRENT until 2027-11-21 03:30 CET according to EPC implementation page.
- Important 2026 date:
  - unstructured address format no longer permitted from 2026-11-15.
- Use: primary scheme source.

### SCT Inst implementation page
- Source: https://www.europeanpaymentscouncil.eu/what-we-do/epc-payment-schemes/sepa-instant-credit-transfer/sepa-instant-credit-transfer-rulebook
- Verified: 2026-09-28
- Notes:
  - 2025 SCT Inst Rulebook v1.1 remains current.
  - Implementation Guidelines are based on the 2019 ISO 20022 message version.
  - Never infer exact message versions only from generic ISO 20022 knowledge; use the current EPC IG.

### 2026 SCT Inst change-management consultation
- Source: https://www.europeanpaymentscouncil.eu/document-library/rulebooks/sepa-instant-credit-transfer-rulebook-public-consultation-document-2026
- Consultation: 2026-03-13 → 2026-06-11
- Verified: 2026-09-28
- Status: FUTURE RULEBOOK WATCH
- Rule: consultation material is not the current scheme rulebook.

## 3. EPC — Verification of Payee

### VOP Scheme Rulebook v1.1
- Authority: European Payments Council
- Source: https://www.europeanpaymentscouncil.eu/document-library/rulebooks/verification-payee-scheme-rulebook-0
- Effective: 2026-09-20
- Verified: 2026-09-28
- Status: CURRENT
- Use:
  - Requesting PSP sends a verification request.
  - Responding PSP compares payee identifiers/data.
  - response categories include match / no match / close match / check not possible.
- Related EPC material:
  - VOP API specifications v1.1.1
  - API Security Framework v2.1
  - effective 2026-09-20.

## 4. EU Instant Payments Regulation

### Regulation (EU) 2024/886
- Authority: European Union / EUR-Lex
- Source: https://eur-lex.europa.eu/eli/reg/2024/886/oj
- Verified: 2026-09-28
- Status: IN FORCE
- Important architecture points:
  - instant-payment availability obligations;
  - charge parity;
  - verification of payee;
  - targeted financial restrictive-measures procedure;
  - 10-second legal timing requirements described in the Regulation;
  - phased deadlines by PSP type / euro vs non-euro Member State.
- Editorial rule: use exact legal dates only from the Regulation; do not generalise one deadline to every PSP.

## 5. Eurosystem / TARGET / TIPS

### ECB — What is TIPS?
- Authority: European Central Bank / Eurosystem
- Source: https://www.ecb.europa.eu/paym/target/tips/html/index.en.html
- Verified: 2026-09-28
- Status: CURRENT
- Key facts:
  - TIPS settles instant payments in central bank money;
  - real-time;
  - 24/7/365;
  - final and irrevocable settlement;
  - eligible PSPs/ACHs can access TIPS under TARGET participation arrangements;
  - TIPS DCA is a dedicated cash account for instant-payment settlement.

### ECB — TIPS facts and figures
- Source: https://www.ecb.europa.eu/paym/target/tips/facts/html/index.en.html
- Verified: 2026-09-28
- Status: CURRENT / TIME-SENSITIVE
- Notes:
  - currencies include euro, Swedish krona and Danish krone at the verification date;
  - reachable-party list is updated over time;
  - operational statistics are date-sensitive.

### TARGET Services Infoguide
- Authority: ECB / Eurosystem
- Use: T2/TIPS accounts, liquidity transfers and service relationships.
- Rule: cite the release/version used in each edition.

## 6. EBA CLEARING / RT1

### RT1 System
- Authority: EBA CLEARING
- Source: https://www.ebaclearing.eu/services-instant-payments/rt1/
- Verified: 2026-09-28
- Status: CURRENT
- Key facts:
  - pan-European real-time gross settlement system;
  - SCT Inst and OCT Inst;
  - 24/7;
  - real-time gross settlement in immediately available central-bank funds;
  - full settlement certainty / no credit risk;
  - interoperable with other SCT Inst-compliant CSMs;
  - connection to settlement in TIPS is available via TIPS DCA or across RT1/TIPS through an AS technical account.
- Editorial correction:
  - never describe RT1 as deferred-net settlement or as settlement in commercial-bank money.

## 7. DORA

### Regulation (EU) 2022/2554
- Authority: European Union / EUR-Lex
- Source: https://eur-lex.europa.eu/eli/reg/2022/2554/oj
- Applies from: 2025-01-17
- Verified: 2026-09-28
- Status: IN FORCE
- Use:
  - ICT risk management;
  - incident management/reporting;
  - digital operational resilience testing;
  - ICT third-party risk;
  - oversight framework.
- Rule: RTS/ITS and ESA material are tracked separately; do not treat a lab as proof of legal compliance.

## 8. Digital euro — watch chapter

### ECB — Digital euro pilot
- Source: https://www.ecb.europa.eu/euro/digital_euro/pilot/html/index.en.html
- Verified: 2026-09-28
- Status: ACTIVE WATCH
- Current public facts:
  - 36 PSPs selected for the pilot;
  - 12-month pilot expected to start in H2 2027;
  - potential first issuance targeted for 2029 only if the legal and decision conditions are met;
  - ECB states issuance decision comes after the Regulation is adopted.

### ECB — 36 PSP selection
- Source: https://www.ecb.europa.eu/press/pr/date/2026/html/ecb.pr260714~8cd07d9d45.en.html
- Published: 2026-07-14; updated 2026-09-15
- Verified: 2026-09-28

### ECB — innovation platform call
- Source: https://www.ecb.europa.eu/press/intro/news/html/ecb.mipnews260928.en.html
- Published: 2026-09-28
- Verified: 2026-09-28
- Use: architecture-watch only; not evidence that any future capability will be part of a production digital euro.

## 9. Versioning rules

Every source entry in a published chapter should include:
- authority;
- document/page title;
- version where applicable;
- effective date where applicable;
- verification date;
- URL;
- truth level.

## 10. Source precedence

1. Regulation / law / official legal text
2. Scheme authority rulebook / implementation guide
3. Eurosystem / CSM official documentation
4. EPI/Wero official public documentation
5. PSP/provider official public documentation
6. standards/vendor documentation
7. secondary sources

Internal GitHub repositories are **knowledge inputs**, never primary evidence for public or regulatory claims.


## 9. PSD3 / PSR legislative trajectory

### PSD3 / Payment Services Regulation
- Authorities: European Commission / European Parliament / Council
- Commission overview: https://finance.ec.europa.eu/consumer-finance-and-payments/payment-services/payment-services_en
- European Parliament legislative train: https://www.europarl.europa.eu/legislative-train/theme-economic-and-monetary-affairs-econ/file-revision-of-eu-rules-on-payment-services
- Council final-compromise references: ST 8220/2026 and ST 8221/2026
- Verified: 2026-09-28
- Status: CLOSE TO ADOPTION / LEGISLATIVE TRAJECTORY, NOT YET TREATED AS GENERALLY APPLICABLE FINAL LAW IN THIS HANDBOOK
- Facts used:
  - Parliament and Council reached a provisional political agreement on 2025-11-27.
  - ECON approved the early-second-reading agreed text on 2026-05-05.
- Editorial rule: recheck final adoption, Official Journal publication, entry into force and application dates before changing this status.

## 10. DORA implementation material

### EBA/ESA — DORA Incident Reporting Operational Instructions
- Published: 2026-09-16
- Source: https://www.eba.europa.eu/
- Verified: 2026-09-28
- Status: OPERATIONAL GUIDANCE
- Notes:
  - supports competent authorities and financial entities on major ICT-related incident reporting;
  - references Commission Implementing Regulation (EU) 2025/302;
  - explicitly does not replace legal interpretation of DORA/ITS.

### ECB — TIBER-EU framework aligned with DORA
- Source: https://www.ecb.europa.eu/paym/cyber-resilience/tiber-eu/html/index.en.html
- Verified: 2026-09-28
- Status: CURRENT
- Use: TLPT architecture/testing chapter.

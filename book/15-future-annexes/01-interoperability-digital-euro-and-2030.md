---
status: REVIEWED
last_verified: 2026-09-28
truth_level: PUBLIC_VERIFIED_AND_WATCH
primary_sources:
  - https://www.ecb.europa.eu/euro/digital_euro/pilot/html/index.en.html
  - https://www.ecb.europa.eu/press/pr/date/2026/html/ecb.pr260714~8cd07d9d45.en.html
  - https://www.ecb.europa.eu/press/intro/news/html/ecb.mipnews260928.en.html
related_internal_repos: []
---

# Interopérabilité, Digital Euro et architecture 2030

## 1. Wero ≠ Digital Euro

Wero :
- private-sector European payment solution/ecosystem ;
- linked to commercial-bank accounts in current public Wero flows ;
- consumer/merchant experience and payment scheme/coordination.

Digital euro:
- potential central-bank digital money issued by the Eurosystem if adopted/decided ;
- separate legal, settlement and distribution model.

One does not automatically replace the other.

## 2. Digital euro public status — 28 September 2026

ECB public baseline:
- 36 PSPs selected for the pilot ;
- pilot planned for H2 2027 for 12 months ;
- selected merchants and Eurosystem staff participate ;
- pilot covers P2P and P2B scenarios, online/offline and physical/e-commerce according to pilot design ;
- potential first issuance is targeted for 2029 only under the stated legislative and decision assumptions ;
- issuance has not been automatically decided merely because the pilot exists.

## 3. 2026 innovation watch

On 28 September 2026, ECB launched a new innovation-platform call including exploration of:
- AI in payments ;
- AI agents ;
- micropayments ;
- public-use cases.

These are **exploration topics**, not committed production digital-euro features.

## 4. Architecture comparison dimensions

| Dimension | Wero | Digital euro |
|---|---|---|
| Operator/governance | EPI/private initiative | Eurosystem / legal framework |
| Monetary asset | account-to-account commercial bank context | potential central bank digital money |
| Distribution | participating PSPs/banks | PSP distribution model foreseen |
| Scheme/rules | Wero/EPI + underlying payment rules | digital-euro rulebook/legal framework |
| Settlement | depends on payment architecture/rail | digital-euro platform model |
| Offline | Wero public capabilities vary | explicit digital-euro design/pilot workstream |
| Status 2026 | live and expanding | pilot preparation |

## 5. Interoperability

European payment architecture may need:
- alias portability ;
- QR standards ;
- merchant acceptance abstraction ;
- PSP routing ;
- identity/consent ;
- wallet interoperability ;
- multi-rail orchestration ;
- shared fraud signals under lawful governance.

Interoperability must not compromise:
- source of truth ;
- duplicate protection ;
- consent ;
- privacy ;
- settlement certainty.

## 6. iDEAL / Payconiq migration lessons

Public Wero migrations show that successful transition requires:
- co-branding period ;
- merchant continuity ;
- PSP coordination ;
- QR compatibility where designed ;
- phased bank onboarding ;
- user communication.

Architecture lesson:
> payment migration is ecosystem migration, not only API migration.

## 7. Cross-border / OCT Inst

The book keeps cross-border instant-payment evolution as a separate rail/scheme concern.

Do not extrapolate SCT Inst rules to:
- FX ;
- one-leg-out ;
- non-euro settlement ;
- SWIFT CBPR+.

## 8. PSD3 / PSR watch

As of September 2026, Council/legislative documents show PSD3/PSR proposals in an advanced legislative agreement process. They must be treated as **legislative trajectory**, not silently as already-applicable final law until formal adoption/publication/applicability is verified.

## 9. Five-year watch list

Annual revalidation:
- Wero countries/use cases ;
- merchant acceptance ;
- EPC rulebooks ;
- VOP ;
- OCT Inst ;
- TARGET/TIPS ;
- RT1 ;
- PSD3/PSR ;
- Digital Euro ;
- DORA RTS/ITS ;
- NIS2/DORA perimeter ;
- eIDAS2 identity/wallet interactions ;
- post-quantum implications for PKI.

## 10. Architecture 2030

Reference direction:

```text
European consumer/merchant experience
          |
identity / consent / wallet
          |
payment orchestration
          |
multi-scheme / multi-rail routing
          |
instant clearing/settlement
          |
central-bank and commercial-bank payment assets
          |
24/7 observability / resilience / regulation
```

The architecture must remain open to new rails without weakening transaction correctness.

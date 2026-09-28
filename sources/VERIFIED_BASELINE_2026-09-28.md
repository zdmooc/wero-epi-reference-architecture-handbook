# Verified Public Baseline — 28 September 2026

Status: **PUBLIC_VERIFIED baseline**  
Purpose: freeze the public facts used by edition V1.0 before interpretation and reference design.

## Wero / EPI

Public EPI material shows a staged evolution:

- Wero launched in 2024 with person-to-person account-to-account payments.
- France launch communication described transfers in under ten seconds and use of phone number or email rather than manually entering an IBAN.
- E-commerce subsequently went live, with Germany first and Belgium publicly announced live in March 2026.
- On 16 September 2026 EPI reported that Wero had expanded to first in-store use cases in Belgium and that more than 48,000 merchants across Belgium, France, Germany, Luxembourg and the Netherlands had processed Wero transactions online or in physical stores.
- Wero's merchant material describes a four-corner model in which merchants work through their acquirer and states that Wero uses SCT Inst for direct account-based payments.
- Current Wero FAQ material lists capabilities including send/receive money, money request, bill split, online payments, in-store QR payments and subscriptions, with availability varying by bank/country.

Primary sources: EPI Company and Wero official pages in `OFFICIAL_SOURCES.yml`.

## SCT Inst

The current EPC rulebook is **2025 SCT Inst rulebook version 1.1**, in force since 5 October 2025. EPC states it remains current until 21 November 2027 03:30 CET.

EPC states that:
- the scheme supports euro instant credit transfers around the clock;
- under the 2025 rulebook the payer PSP, payee PSP and CSM have a total maximum duration of **nine seconds** for scheme processing and funds availability;
- the Implementation Guidelines are based on the **2019 ISO 20022 message version**;
- unstructured address format becomes no longer permitted from **15 November 2026**.

## ISO 20022 messages — SCT Inst Inter-PSP 2025

The official EPC Inter-PSP IG identifies:

| Function | Message |
|---|---|
| inter-PSP payment | `pacs.008.001.08` |
| negative confirmation | `pacs.002.001.10` |
| positive confirmation | `pacs.002.001.10` |
| recall request | `camt.056.001.08` |
| negative recall response | `camt.029.001.09` |
| positive recall response / return | `pacs.004.001.09` |
| request for recall status update | `pacs.028.001.03` |

These versions are edition-sensitive and must be rechecked when the applicable EPC IG changes.

## VoP

EPC Verification of Payee Scheme Rulebook **version 1.1** became effective on **20 September 2026**. The scheme enables a payer PSP to request verification of payee name/identifier information from the payee PSP before an SCT or SCT Inst.

## TIPS

The Eurosystem describes TIPS as:
- an instant-payment settlement platform;
- real-time;
- 24/7/365;
- settling in central bank money;
- offering final and irrevocable settlement;
- using TIPS Dedicated Cash Accounts for direct participants.

## RT1

EBA CLEARING describes RT1 as:
- a pan-European real-time gross settlement payment system;
- operating 24/7;
- supporting SCT Inst and OCT Inst;
- using immediately available central-bank funds;
- providing a connection for settlement in TIPS through either a TIPS DCA or the RT1/TIPS AS technical-account model.

Therefore this book must **not** describe RT1 as merely deferred commercial-bank-money settlement.

## TARGET liquidity

Eurosystem material describes central liquidity management through T2 and linked cash accounts across TARGET Services. The 2025 TARGET Services Annual Report documents substantial liquidity transfers between T2 and TIPS, TIPS DCAs and ancillary-system technical accounts. This is the factual basis for the book's liquidity chapter; any bank-specific buffer strategy remains a reference design.

## Instant Payments Regulation

Regulation (EU) **2024/886** is in force. Among its requirements, for relevant PSPs it creates obligations around:
- sending and receiving instant credit transfers in euro;
- round-the-clock reachability;
- pricing constraints;
- beneficiary verification;
- processing and timing.

Exact applicability dates differ by PSP category and geography and must be read from the legal text/current Commission guidance.

## DORA

Regulation (EU) **2022/2554** applies from **17 January 2025**. The book treats DORA as an operational-resilience framework spanning governance, ICT risk, incident management, testing, third-party risk and evidence — not as a synonym for HA/PRA.

## PSD3 / PSR

As of this baseline:
- Parliament and Council reached a **provisional political agreement on 27 November 2025**.
- This book must not describe PSD3/PSR as already fully applicable law unless the final legal acts and application dates are rechecked in a later edition.

## Digital euro

On 14 July 2026 the ECB announced selection of **36 PSPs** for a digital euro pilot planned to start in the **second half of 2027** for 12 months. The book treats digital euro as a separate Eurosystem initiative with potential architectural interactions, not as a replacement for Wero.

## Editorial warning

Facts above are a dated public baseline. They do not disclose:
- EPI internal topology;
- bank internal products;
- participant data stores;
- network designs;
- HA/PRA design;
- cloud choice;
- Kafka/MQ usage;
- Kubernetes/OpenShift usage.

Those belong either to public evidence when available or to clearly labelled **REFERENCE_ARCHITECTURE** sections.

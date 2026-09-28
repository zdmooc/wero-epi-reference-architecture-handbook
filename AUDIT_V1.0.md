# Audit V1.0 — Wero & EPI Reference Architecture Handbook

Date: 2026-09-28  
Scope: manuscript V1.0

## Executive conclusion

The repository now contains a complete first-edition architecture manuscript spanning the end-to-end payment path from customer experience to interbank settlement, liquidity, network, infrastructure, security, resilience, operations and European regulatory context.

## Strongest characteristics

1. **Layer separation**
   - Wero, SCT Inst, ISO 20022, CSM, settlement and liquidity are not conflated.

2. **Payment correctness**
   - idempotency, UNKNOWN, investigation and reconciliation are treated as core architecture concerns.

3. **Network depth**
   - DNS, DDoS, WAF, LB, ingress, firewall, mTLS, PKI, HSM, banking connectivity and flow matrices are part of the main manuscript.

4. **Rail depth**
   - TIPS and RT1 are represented from current operator material; RT1 is not incorrectly described as deferred/commercial-bank settlement.

5. **Evidence discipline**
   - public facts, reference architectures and runtime evidence remain distinct.

6. **Operational resilience**
   - BIA, failure domains, RTO/RPO, fencing, split brain, cyber recovery, third-party risk and DORA evidence are integrated.

7. **Maintainability**
   - source registry, changelog, diagram source, annual release model and CI publication pipeline exist.

## Primary-source checks completed

- EPI/Wero public service evolution.
- EPC SCT Inst 2025 v1.1.
- EPC SCT Inst Inter-PSP IG 2025 message versions.
- EPC VoP v1.1.
- ECB TIPS/TARGET.
- EBA CLEARING RT1.
- Regulation EU 2024/886.
- DORA EU 2022/2554.
- GDPR/eIDAS2/NIS2 baseline.
- PSD3/PSR political-status baseline.
- ECB digital euro pilot/status.

## Known boundaries

V1.0 does not claim:
- EPI internal architecture;
- a real participant bank's network/topology;
- production performance figures;
- production multi-AZ/site proof;
- legal advice;
- a physical print proof.

## Delegated references

Detailed specialist depth remains in:
- Payment Hub / ISO repository;
- DORA masterbook;
- OpenShift/Kafka/MQ specialists;
- instant-payments executable lab.

## Publication decision

- Manuscript: **PASS**
- Digital PDF/EPUB pipeline: **READY**
- Physical print approval: **PENDING PHYSICAL PROOF**
- Long-term maintenance: **ACTIVE 2026→2031**

## Next maintenance triggers

- EPC rulebook/IG update;
- Wero capability/country changes;
- TIPS/RT1 documentation changes;
- digital euro legislative/pilot changes;
- PSD3/PSR finalisation/application;
- DORA Level 2 updates;
- factual corrections from technical review.

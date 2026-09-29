---
status: REVIEWED
last_verified: 2026-09-28
truth_level: PUBLIC_VERIFIED
primary_sources:
  - eu-ipr-2024-886
  - eu-dora-2022-2554
  - eu-gdpr-2016-679
  - eu-eidas2-2024-1183
  - eu-nis2-2022-2555
  - eu-psd3-psr-political-agreement
  - epc-sct-inst-2025-v1.1
  - epc-vop-2026-v1.1
---

# Partie XVI — Carte réglementaire européenne

## Ne pas confondre loi, scheme et standard

```text
EU Regulation / Directive
        |
Regulatory Technical Standards / Implementing Acts
        |
Payment Scheme Rulebooks
        |
Implementation Guidelines
        |
Technical Standards / ISO messages
        |
Institution policy / architecture
```

Chaque couche a une autorité et un statut différents.

## Instant Payments Regulation — EU 2024/886

Le règlement modifie le cadre européen pour les virements instantanés en euro.

Impacts architecturaux :

- capacité d'envoi/réception selon obligations applicables ;
- disponibilité 24/7 ;
- pricing constraints ;
- Verification of Payee ;
- sanctions-related processing changes ;
- timing ;
- operational readiness.

Les dates exactes dépendent du type de PSP et de sa localisation ; elles doivent être revalidées à chaque édition.

## SCT Inst Rulebook

Le rulebook EPC n'est pas un règlement UE.

Il définit le scheme SCT Inst :

- actors ;
- datasets ;
- timelines ;
- R-transactions ;
- rules.

L'architecture doit être conforme au rulebook applicable lorsqu'elle participe au scheme.

## VoP Scheme

Le VoP EPC rulebook v1.1 est effectif depuis le 20 septembre 2026.

Architecture :

- Requesting PSP ;
- Responding PSP ;
- verification request ;
- matching ;
- response ;
- customer presentation.

VoP est à la fois un scheme capability et une réponse à des obligations européennes ; il reste distinct du moteur fraude.

## PSD2

PSD2 demeure une référence du cadre payment-services tant que les futurs actes PSD3/PSR ne sont pas applicables.

Sujets architecture :

- PSP ;
- SCA ;
- access to account/open banking ;
- security ;
- incident/fraud context ;
- liability.

## PSD3 / PSR

Au 28 septembre 2026 :

- un accord politique provisoire a été annoncé en novembre 2025 ;
- le livre ne les décrit pas comme pleinement applicables sans revalidation du processus législatif final.

Editorial rule:
`legal_status` doit être versionné.

## DORA

Applicable depuis 17 janvier 2025.

Domains :

- ICT risk ;
- incidents ;
- resilience testing ;
- TLPT ;
- third-party risk ;
- contracts/exit ;
- Register of Information.

DORA est transversal à la plateforme, pas un microservice.

## GDPR

Impacts :

- personal data inventory ;
- purpose/minimisation ;
- retention ;
- access ;
- data subject processes ;
- security ;
- breach management.

Payment audit requirements and privacy must be reconciled with explicit retention policies.

## AML/CFT

The book treats AML/CFT as a regulated financial-crime control domain.

Architecture:

- customer/transaction risk ;
- screening/monitoring ;
- cases ;
- audit ;
- escalation.

Exact obligations depend on institution/jurisdiction and are not reduced to one EU payment rulebook.

## Sanctions

Sanctions controls are distinct from AML and fraud.

Design:

- lists/source governance ;
- screening timing ;
- false-positive handling ;
- evidence ;
- emergency list update.

## eIDAS2

Regulation EU 2024/1183 establishes the European Digital Identity Framework.

Architectural relevance:

- identity assurance ;
- wallets ;
- trust services ;
- signatures/credentials.

No specific Wero integration is assumed.

## NIS2

Directive EU 2022/2555 addresses cybersecurity for covered entities/sectors.

For financial entities also under DORA, legal interaction/scope must be assessed. The handbook provides architecture mapping, not entity-specific legal advice.

## Regulatory evidence matrix

| Requirement domain | Architecture artifact |
|---|---|
| Instant availability | SLO, capacity, on-call, HA |
| VoP | sequence, API, UI, evidence |
| ICT risk | dependency/risk map |
| Incident reporting | event timeline, impact metrics |
| Resilience testing | test catalogue, evidence |
| Third-party | provider map, contracts, exit |
| GDPR | data inventory, retention, access |
| SCA | auth/consent architecture |
| Scheme compliance | message/version catalogue |

## Change management

Regulatory update workflow:

```text
official publication
→ legal/compliance interpretation
→ architecture impact
→ backlog
→ implementation
→ testing
→ evidence
→ release note
```

## Source hierarchy

Priority:

1. EUR-Lex ;
2. European Commission / ESAs / ECB ;
3. EPC ;
4. official scheme/infrastructure operator ;
5. institution legal/compliance interpretation ;
6. secondary material.

## Disclaimer

This handbook is an architecture reference. It is not legal advice and does not certify compliance of any institution.

## Conclusion

La réglementation devient exploitable lorsqu'elle est transformée en capabilities, responsabilités, contrôles, tests et evidence, tout en conservant la traçabilité vers la source juridique exacte.

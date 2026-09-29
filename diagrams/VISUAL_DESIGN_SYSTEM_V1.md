# Visual Design System — V1.0

**Baseline:** 2026-09-29  
**Scope:** handbook diagrams and final publication figures  
**Status:** APPROVED_FOR_SVG_RENDERING

## 1. Design goals

The visual system must make a complex payment architecture readable without turning diagrams into decoration.

Priority order:
1. semantic accuracy;
2. readable hierarchy;
3. stable vocabulary across the book;
4. print legibility;
5. accessibility;
6. visual consistency.

## 2. Semantic families

| Family | Meaning | Preferred visual treatment |
|---|---|---|
| Actor / external user | customer, merchant, operator | light neutral / rounded |
| Experience | wallet, bank app, checkout, POS | light blue |
| Business / orchestration | payment request, orchestrator, payment domain | blue |
| Scheme | SCT Inst, Wero coordination context | violet |
| Message standard | ISO 20022 / message objects | amber |
| Rail / CSM | TIPS, RT1, routing, reachability | teal |
| Settlement / liquidity | DCA, MCA, balances, central-bank context | green |
| Data | DB, ledger, broker, reconciliation stores | slate |
| Security / trust | IAM, SCA, PKI, HSM, fraud controls | rose |
| Operations / evidence | observability, incident, reconciliation, proof | indigo |
| Future / watch | Digital Euro, 2030 capabilities | purple + explicit future label |

Colours are never the sole carrier of meaning; every node remains text-labelled.

## 3. Core colour tokens

- ink: #0F172A
- line: #475569
- actor: #F8FAFC / #334155
- experience: #E0F2FE / #0369A1
- business: #DBEAFE / #1D4ED8
- scheme: #EDE9FE / #7C3AED
- message: #FEF3C7 / #B45309
- rail: #CCFBF1 / #0F766E
- settlement: #DCFCE7 / #15803D
- data: #F1F5F9 / #475569
- security: #FFE4E6 / #BE123C
- operations: #EEF2FF / #4338CA
- future: #F3E8FF / #9333EA

First value is fill, second is border.

## 4. Shapes

- actor / person / external party: rounded node;
- service/capability: rectangle;
- data store / ledger / broker: database/cylinder where Mermaid supports it;
- decision: diamond;
- external rail/platform: rectangle with explicit system name;
- future concept: dashed relationship and explicit “potential / if issued / watch” wording.

## 5. Lines

- solid arrow: primary processing or authoritative flow;
- dashed arrow: inquiry, optional path, dependency or future relation;
- bidirectional arrow: real two-way relationship only;
- never use arrow direction as a decorative choice.

## 6. Typography

Mermaid source uses a safe publication stack:
`Arial, sans-serif`.

Final SVG/layout may substitute the book typeface during visual production, but editable Mermaid remains font-portable.

Rules:
- avoid text below 10 pt equivalent in print;
- node labels should normally fit in two lines;
- abbreviations must exist in the glossary/acronym index;
- no paragraph-sized nodes.

## 7. Truth labels

Every source figure must include:
- `title`;
- `view`;
- `truth_level`;
- `last_verified`;
- `sources` when public facts are used;
- `related_chapter`;
- `visual_system: V1`.

For MIXED figures, public facts and reference design must be distinguishable in the caption/source note.

## 8. Hero-figure rules

Hero figures:
- use full page or full-width landscape;
- one dominant reading direction;
- maximum 7–12 primary conceptual nodes before grouping;
- subgraphs are used for zones/layers, not decorative frames;
- one visual takeaway per figure;
- caption must explain what the reader should learn.

## 9. Sequence diagrams

Use when order matters.

Rules:
- participants ordered left-to-right by responsibility;
- commercial/coordination flow separated conceptually from financial execution;
- authoritative result visually returns from the financial side;
- browser/app return is not shown as settlement proof.

## 10. Network diagrams

Use zones:
- external;
- edge;
- application;
- payment;
- data;
- banking connectivity;
- external CSM/rail.

Show trust boundaries and critical path before secondary management flows.

## 11. Resilience diagrams

Always show:
- failure domain;
- writer authority;
- fencing where relevant;
- recovery/reconciliation after failover.

Never imply that replica count alone proves HA.

## 12. Future diagrams

Future capability uses explicit labels:
- potential;
- pilot;
- if issued;
- watch.

No future system is drawn as current production fact.

## 13. Publication rendering

Source of truth:
`diagrams/mermaid/*.mmd`.

Production path:
`Mermaid → SVG → visual QA → book layout → PDF/EPUB`.

SVG is the preferred intermediate because it remains vector and inspectable.

## 14. Accessibility

- no red/green-only meaning;
- sufficient border/text contrast;
- textual labels on every semantic node;
- line style reinforces optional/future semantics;
- printed greyscale must remain understandable.

## 15. Figure caption template

**FIG-xx-xxx — Title.** One-sentence reader takeaway.  
*Status: REFERENCE_ARCHITECTURE / PUBLIC_VERIFIED / MIXED. Sources: … Checked: YYYY-MM-DD.*

## 16. V1 hero set

1. FIG-01-001 — layered payment architecture;
2. FIG-03-001 — C2B end-to-end;
3. FIG-05-001 — ISO 20022 / SCT Inst;
4. FIG-07-001 — scheme / CSM / settlement layering;
5. FIG-09-001 — end-to-end network;
6. FIG-11-001 — multi-zone / multi-site;
7. FIG-14-001 — complete bank reference architecture;
8. FIG-15-001 — European payments 2030.

These eight figures establish the visual grammar reused by the other 28 figures.

# Diagram Catalogue — V1.0 Manuscript

**Editorial review:** 2026-09-29  
**Final source count:** 36 Mermaid diagrams  
**Numbering:** unique — no duplicate figure IDs  
**Status:** 36/36 FIGURES — SVG_SOURCE_QA_PASS

## Editorial decisions

- 2 redundant figures removed:
  - former `FIG-02-002-participant-four-corner.mmd`;
  - former `FIG-07-001-rails-settlement-layers.mmd`.
- figure IDs in Parts 03, 09 and 13 were normalized;
- the payment state-machine figure was moved to Part 04, where it belongs conceptually;
- the UNKNOWN recovery figure now separates `REJECTED` from `NOT_EXECUTED` and no longer uses ambiguous `FAILED`;
- 4 missing high-value figures were added:
  - POS / in-store QR journey;
  - recall / return / investigation message flow;
  - SCT Inst nine-second processing window;
  - resilience testing ladder.

## Placement plan

| Figure | Purpose | Canonical placement | Layout | Truth |
|---|---|---|---|---|
| FIG-01-001 | layered payment architecture | 01.1 Layered reading | full width / portrait-friendly | REFERENCE_ARCHITECTURE |
| FIG-02-001 | Wero commerce four-corner | 02.2 Participant responsibility model | full width | MIXED |
| FIG-03-001 | C2B end-to-end | 03.1 End-to-end journeys | full width | REFERENCE_ARCHITECTURE |
| FIG-03-002 | e-commerce desktop sequence | 03.3 E-commerce | landscape full width | REFERENCE_ARCHITECTURE |
| FIG-03-003 | P2P alias resolution | 03.2 P2P / alias | full width | REFERENCE_ARCHITECTURE |
| FIG-03-004 | POS / QR in-store | 03.4 POS / QR | landscape full width | MIXED |
| FIG-04-001 | functional capability map | 04.1 Functional architecture | landscape full width | REFERENCE_ARCHITECTURE |
| FIG-04-002 | commercial / scheme / financial states | 04.3 State machines | landscape full width | REFERENCE_ARCHITECTURE |
| FIG-05-001 | ISO 20022 SCT Inst message map | 05.1 ISO 20022 reference | full width | PUBLIC_VERIFIED |
| FIG-05-002 | identifier correlation chain | 05.2 BAH / identifiers | landscape full width | REFERENCE_ARCHITECTURE |
| FIG-05-003 | recall / response / return | 05.4 R-transactions | full width | PUBLIC_VERIFIED |
| FIG-06-001 | UNKNOWN recovery | 06.2 Timing / timeout | full width | REFERENCE_ARCHITECTURE |
| FIG-06-002 | nine-second SCT Inst window | 06.2 Timing / timeout | landscape full width | PUBLIC_VERIFIED |
| FIG-07-001 | scheme / ISO / CSM / settlement layering | 07.1 Rails / clearing / settlement | full width | MIXED |
| FIG-07-002 | TIPS participant/account model | 07.2 TIPS | full width | REFERENCE_ARCHITECTURE |
| FIG-07-003 | RT1 access models | 07.3 RT1 | full width | REFERENCE_ARCHITECTURE |
| FIG-07-004 | multi-CSM routing | 07.4 Reachability / routing | landscape full width | REFERENCE_ARCHITECTURE |
| FIG-08-001 | 24/7 liquidity control loop | 08.1 Settlement / liquidity | full width | REFERENCE_ARCHITECTURE |
| FIG-08-002 | TARGET liquidity accounts | 08.2 TARGET accounts | full width | REFERENCE_ARCHITECTURE |
| FIG-09-001 | end-to-end network path | 09.1 Network reference | landscape full page / possible double-page spread | REFERENCE_ARCHITECTURE |
| FIG-09-002 | trust zones / internal dependencies | 09.3 East-West segmentation | landscape full page | REFERENCE_ARCHITECTURE |
| FIG-09-003 | dual banking connectivity | 09.4 Banking connectivity | half page or full width | REFERENCE_ARCHITECTURE |
| FIG-10-001 | transactional Outbox / Inbox | 10.3 Event-driven architecture | landscape full width | REFERENCE_ARCHITECTURE |
| FIG-11-001 | multi-zone / DR reference | 11.5 Multi-AZ / multi-site | landscape full page | REFERENCE_ARCHITECTURE |
| FIG-12-001 | security trust chain | 12.1 Security reference | landscape full width | REFERENCE_ARCHITECTURE |
| FIG-12-002 | customer / merchant / workload / operator identity | 12.2 IAM / SCA | full width | REFERENCE_ARCHITECTURE |
| FIG-13-001 | critical-service dependency map | 13.2 BIA / critical services | full width | REFERENCE_ARCHITECTURE |
| FIG-13-002 | payment failure domains | 13.2 BIA / RTO / RPO | full page | REFERENCE_ARCHITECTURE |
| FIG-13-003 | fencing / site failover | 13.3 Active/passive-active/active | landscape full width | REFERENCE_ARCHITECTURE |
| FIG-13-004 | resilience testing ladder | 13.5 Chaos / DORA / TLPT | full width | REFERENCE_ARCHITECTURE |
| FIG-14-001 | bank end-to-end reference architecture | 14.2 Bank reference architecture | landscape full page / hero figure | REFERENCE_ARCHITECTURE |
| FIG-14-002 | merchant / Acceptor PSP reference | 14.3 PSP / merchant architecture | landscape full width | REFERENCE_ARCHITECTURE |
| FIG-14-003 | business / technical correlation | 14.4 SLI / observability | full width | REFERENCE_ARCHITECTURE |
| FIG-14-004 | payment incident lifecycle | 14.6 Incidents / postmortems | landscape full width | REFERENCE_ARCHITECTURE |
| FIG-15-001 | European payments coexistence 2030 | 15.4 European payments 2030 | full page | MIXED |
| FIG-16-001 | claim-evidence ladder | 16.3 Claim-evidence matrix | full width | EDITORIAL |

## V1 hero preparation status

The eight hero figures have completed source-level visual preparation under `diagrams/VISUAL_DESIGN_SYSTEM_V1.md`.

Status: **HERO_SVG_QA_PASS**

8/8 hero SVG artifacts are rendered and have passed visual QA. No PDF/EPUB generation is triggered by this status.

## Secondary SVG status

The remaining 28 figures have also been migrated to Visual System V1 and rendered under `diagrams/svg/secondary/`.

Status: **SECONDARY_SVG_QA_PASS**

QA result:
- 28/28 valid SVG artifacts;
- 28/28 with explicit vector viewBox;
- 28/28 with Visual System V1 signature;
- 28/28 checked on 2026-09-29;
- 0 out-of-bounds semantic boxes;
- 0 semantic node overlaps after one correction to FIG-13-004.

Combined corpus:
- 8 Hero SVGs;
- 28 Secondary SVGs;
- **36/36 FIGURES — SVG_SOURCE_QA_PASS**.

See:
- `diagrams/HERO_SVG_QA_V1.md`
- `diagrams/SECONDARY_SVG_QA_V1.md`

## Hero figures

The following figures should receive the strongest visual treatment in the final book:

1. **FIG-01-001** — reader mental model;
2. **FIG-03-001** — C2B end-to-end payment journey;
3. **FIG-05-001** — ISO 20022 message landscape;
4. **FIG-07-001** — rail / settlement layering;
5. **FIG-09-001** — end-to-end network;
6. **FIG-11-001** — multi-zone / multi-site platform;
7. **FIG-14-001** — bank reference architecture;
8. **FIG-15-001** — future European payments architecture.

These should not be reduced to small inline illustrations. Their source-level design system preparation is complete.

## Figures that may be half-page

- FIG-09-003;
- FIG-12-002;
- FIG-14-004;
- FIG-16-001.

All others should normally use full text width or a dedicated landscape page.

## Final visual rules

Before PDF/print rendering:

- render to SVG first;
- keep text readable at print size;
- no meaning encoded by colour alone;
- use a stable visual vocabulary for PSP, rail, data, network and security zones;
- add figure number, title, truth label and source note below each figure;
- place a figure immediately after the paragraph that introduces its concept;
- avoid splitting a sequence/state diagram across pages;
- use landscape or double-page spread for FIG-09-001, FIG-11-001 and FIG-14-001 if needed;
- preserve Mermaid source as the editable master.

## Publication status

The architectural meaning and placement of the figures are now reviewed.

SVG production is complete for all 36 figures.

Remaining visual-production work is now page-level publication proof:
`36 SVG → captions/source notes → chapter placement → typography/layout proof → PDF/EPUB/print proof`.

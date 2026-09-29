# Diagram System

## Goal

The handbook is diagram-first. Complex payment architecture must be understandable visually before the reader enters implementation detail.

## Mandatory diagram families

1. Context
2. Business actors
3. Functional capability
4. Payment sequence
5. Application architecture
6. Data architecture
7. Event architecture
8. Network architecture
9. Physical infrastructure
10. Payment rail / clearing / settlement
11. Liquidity
12. Security / trust boundaries
13. Resilience / failure domains
14. State machine
15. Regulatory mapping

## Source formats

Preferred:
- Mermaid for maintainable sequences/state/flow diagrams ;
- PlantUML where richer formal sequence/component views help ;
- Draw.io for complex network and physical views ;
- SVG as publication format.

## Naming

```text
FIG-PART-CHAPTER-NNN-short-name.ext
```

Example:

```text
FIG-06-66-001-tips-settlement.svg
FIG-07-76-001-reference-network.svg
FIG-02-14-001-ecommerce-sequence.mmd
```

## Diagram metadata

Each source diagram should start with metadata:

```yaml
title:
view:
truth_level:
last_verified:
sources:
related_chapter:
```

## Publication quality

- vector preferred ;
- readable in print ;
- no tiny text ;
- no dependency on colour alone ;
- consistent legends ;
- consistent actors and line semantics ;
- security zones explicitly bounded ;
- synchronous vs asynchronous flows visually distinguished ;
- financial vs technical states visually distinguished.

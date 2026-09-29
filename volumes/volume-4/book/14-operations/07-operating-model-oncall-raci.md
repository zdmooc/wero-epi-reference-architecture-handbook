---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/dora-operational-resilience-architecture-masterbook
---

# Operating model, on-call et responsabilités

## 24/7 service needs 24/7 ownership

A system available at night needs:

- monitoring ;
- on-call ;
- escalation ;
- supplier contacts ;
- treasury path ;
- decision authority.

## Functional ownership

Domains:

- Wero/customer journey ;
- merchant/acceptor ;
- payment hub ;
- rail ;
- liquidity ;
- IAM ;
- fraud ;
- platform ;
- network ;
- DB ;
- broker ;
- security.

## Service owner

Owns:

- business service ;
- SLO ;
- risk ;
- roadmap ;
- incident priority.

## Technical owner

Owns component:

- lifecycle ;
- patch ;
- capacity ;
- runbook ;
- recovery.

## Payment operations

Owns:

- rejects ;
- unknowns ;
- recalls ;
- returns ;
- reconciliation cases.

## Treasury

Owns:

- liquidity positions ;
- funding ;
- thresholds ;
- emergency actions.

## SRE/NOC

Owns:

- monitoring ;
- first response ;
- incident coordination ;
- platform reliability.

## Security

Owns:

- IAM policy ;
- PKI/HSM governance ;
- vulnerability ;
- security incident ;
- detection.

## On-call model

Define:

- primary ;
- secondary ;
- escalation ;
- maximum acknowledgement ;
- handover ;
- fatigue controls.

## Supplier contact

For critical provider:

- 24/7 contact ;
- contract ID ;
- severity path ;
- escalation ;
- alternate contact.

## RACI

Use annex RACI but tailor per institution.

Critical actions need clear Accountable:

- site failover ;
- rail switch ;
- liquidity transfer ;
- certificate emergency ;
- payment manual correction.

## Change calendar

Coordinate:

- EPC changes ;
- CSM changes ;
- bank release ;
- certificate ;
- infra maintenance ;
- merchant peak.

## Shift handover

Include:

- active incidents ;
- unknown queue ;
- liquidity ;
- degraded dependencies ;
- planned changes.

## Knowledge

Runbooks and architecture docs must be:

- searchable ;
- versioned ;
- tested ;
- accessible during outage.

## Resilience of people

Avoid one expert dependency.

Use:

- cross-training ;
- exercises ;
- paired on-call ;
- documented procedures.

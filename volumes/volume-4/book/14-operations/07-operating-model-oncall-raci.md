---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/dora-operational-resilience-architecture-masterbook
---

# Operating model, on-call et responsabilités

## 1. 24/7 service needs 24/7 ownership

A system available at night needs:
- monitoring ;
- on-call ;
- escalation ;
- supplier contacts ;
- treasury path ;
- decision authority.

## 2. Functional ownership

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

## 3. Service owner

Owns:
- business service ;
- SLO ;
- risk ;
- roadmap ;
- incident priority.

## 4. Technical owner

Owns component:
- lifecycle ;
- patch ;
- capacity ;
- runbook ;
- recovery.

## 5. Payment operations

Owns:
- rejects ;
- unknowns ;
- recalls ;
- returns ;
- reconciliation cases.

## 6. Treasury

Owns:
- liquidity positions ;
- funding ;
- thresholds ;
- emergency actions.

## 7. SRE/NOC

Owns:
- monitoring ;
- first response ;
- incident coordination ;
- platform reliability.

## 8. Security

Owns:
- IAM policy ;
- PKI/HSM governance ;
- vulnerability ;
- security incident ;
- detection.

## 9. On-call model

Define:
- primary ;
- secondary ;
- escalation ;
- maximum acknowledgement ;
- handover ;
- fatigue controls.

## 10. Supplier contact

For critical provider:
- 24/7 contact ;
- contract ID ;
- severity path ;
- escalation ;
- alternate contact.

## 11. RACI

Use annex RACI but tailor per institution.

Critical actions need clear Accountable:
- site failover ;
- rail switch ;
- liquidity transfer ;
- certificate emergency ;
- payment manual correction.

## 12. Change calendar

Coordinate:
- EPC changes ;
- CSM changes ;
- bank release ;
- certificate ;
- infra maintenance ;
- merchant peak.

## 13. Shift handover

Include:
- active incidents ;
- unknown queue ;
- liquidity ;
- degraded dependencies ;
- planned changes.

## 14. Knowledge

Runbooks and architecture docs must be:
- searchable ;
- versioned ;
- tested ;
- accessible during outage.

## 15. Resilience of people

Avoid one expert dependency.

Use:
- cross-training ;
- exercises ;
- paired on-call ;
- documented procedures.

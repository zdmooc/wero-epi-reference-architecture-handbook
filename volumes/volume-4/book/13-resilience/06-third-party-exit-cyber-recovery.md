---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - eu-dora-2022-2554
related_internal_repos:
  - zdmooc/dora-operational-resilience-architecture-masterbook
---

# Tiers ICT, concentration, exit strategy et cyber recovery

## 1. Dependency inventory

For each provider:
- service ;
- critical business service supported ;
- data ;
- location ;
- subcontractors ;
- connectivity ;
- credentials ;
- RTO/RPO ;
- exit path.

## 2. Criticality

Not all suppliers equal.

Critical examples:
- cloud/hosting ;
- banking connectivity ;
- HSM ;
- IAM ;
- fraud provider ;
- payment processor ;
- CSM technical provider.

## 3. Concentration risk

Questions:
- same provider for primary and DR ?
- same telecom backbone ?
- same cloud region group ?
- same PKI ?
- same subcontractor across providers ?

Apparent diversity can hide common dependency.

## 4. Subcontractor chain

Map:
~~~text
Financial Entity
→ ICT Provider
→ sub-provider A
→ sub-provider B
~~~

Need visibility proportionate to criticality and legal requirements.

## 5. Contract architecture

Technical requirements reflected in contract:
- availability ;
- incident notification ;
- support ;
- audit/access ;
- testing ;
- data location ;
- subcontractor change ;
- exit ;
- data return/deletion.

## 6. Exit strategy

Exit is executable architecture.

Steps:
1. inventory data/config ;
2. deploy alternate service ;
3. migrate ;
4. dual-run if needed ;
5. cutover ;
6. validate ;
7. revoke old access ;
8. reconcile ;
9. delete/return data as required.

## 7. Exit RTO

Measure:
- procurement not just technical ;
- build ;
- data migration ;
- network ;
- testing ;
- certification ;
- cutover.

## 8. Portability

Reduce proprietary coupling where sensible:
- standard APIs ;
- export formats ;
- IaC ;
- container portability ;
- abstraction only where it adds real value.

## 9. Cyber recovery

Different from normal DR.

Assume:
- primary compromised ;
- backup may be compromised ;
- credentials stolen ;
- config tampered.

Need clean-room/trusted recovery concept.

## 10. Clean recovery

- known-good images ;
- isolated environment ;
- rotated identity ;
- validated backup ;
- controlled reconnect ;
- reconciliation.

## 11. Immutable evidence

Protect:
- audit ;
- security logs ;
- backups ;
- deployment provenance.

## 12. Provider compromise

Actions:
- isolate integration ;
- rotate secrets ;
- identify affected transactions ;
- switch provider if possible ;
- reconcile.

## 13. DORA register/evidence

Maintain provider data and contractual/operational information required by governance.

The book does not claim legal completeness; use current RTS/ITS and compliance interpretation.

## 14. Exercises

- cloud region/provider issue ;
- telecom provider failure ;
- HSM provider failure ;
- fraud provider down ;
- compromised technical provider ;
- exit tabletop.

## 15. Principle

A provider SLA is not a resilience strategy. The financial entity must know how the service continues or exits when the provider is unavailable.

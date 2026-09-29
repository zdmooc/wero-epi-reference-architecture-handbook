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

## Dependency inventory

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

## Criticality

Not all suppliers equal.

Critical examples:

- cloud/hosting ;
- banking connectivity ;
- HSM ;
- IAM ;
- fraud provider ;
- payment processor ;
- CSM technical provider.

## Concentration risk

Questions:

- same provider for primary and DR ?
- same telecom backbone ?
- same cloud region group ?
- same PKI ?
- same subcontractor across providers ?

Apparent diversity can hide common dependency.

## Subcontractor chain

Map:
~~~text
Financial Entity
→ ICT Provider
→ sub-provider A
→ sub-provider B
~~~

Need visibility proportionate to criticality and legal requirements.

## Contract architecture

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

## Exit strategy

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

## Exit RTO

Measure:

- procurement not just technical ;
- build ;
- data migration ;
- network ;
- testing ;
- certification ;
- cutover.

## Portability

Reduce proprietary coupling where sensible:

- standard APIs ;
- export formats ;
- IaC ;
- container portability ;
- abstraction only where it adds real value.

## Cyber recovery

Different from normal DR.

Assume:

- primary compromised ;
- backup may be compromised ;
- credentials stolen ;
- config tampered.

Need clean-room/trusted recovery concept.

## Clean recovery

- known-good images ;
- isolated environment ;
- rotated identity ;
- validated backup ;
- controlled reconnect ;
- reconciliation.

## Immutable evidence

Protect:

- audit ;
- security logs ;
- backups ;
- deployment provenance.

## Provider compromise

Actions:

- isolate integration ;
- rotate secrets ;
- identify affected transactions ;
- switch provider if possible ;
- reconcile.

## DORA register/evidence

Maintain provider data and contractual/operational information required by governance.

The book does not claim legal completeness; use current RTS/ITS and compliance interpretation.

## Exercises

- cloud region/provider issue ;
- telecom provider failure ;
- HSM provider failure ;
- fraud provider down ;
- compromised technical provider ;
- exit tabletop.

## Principle

A provider SLA is not a resilience strategy. The financial entity must know how the service continues or exits when the provider is unavailable.

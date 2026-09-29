---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Runbook de liquidité instant payments

## Trigger

Déclenchement lorsque :

- balance below warning ;
- projected depletion ;
- liquidity rejects ;
- transfer failed ;
- balance feed stale ;
- unusual route shift.

## Initial checks

1. confirm data freshness ;
2. confirm rail health ;
3. inspect inflow/outflow ;
4. inspect recent routing changes ;
5. identify available funding path ;
6. confirm account state.

## Classify

### Normal peak
Forecast underestimated volume.

### Route shift
Another rail failed.

### Transfer failure
Funding command did not complete.

### Data issue
Balance not reliable.

### Operational error
Wrong defund/fund.

### Fraud/security
Unexpected movement.

## Safe actions

Selon policy :

- fund position ;
- cancel planned defund ;
- change routing policy ;
- cap new traffic ;
- enter degraded mode ;
- escalate treasury.

## Prohibited

- invent balance ;
- mark payment settled because liquidity was expected ;
- blind retry financial transfers ;
- route UNKNOWN payments elsewhere.

## Maker/checker

Au-dessus d'un seuil de matérialité :

- maker prepares ;
- checker validates ;
- audit stores both identities.

## Communication

Notifier :

- payment operations ;
- treasury ;
- SRE ;
- incident manager ;
- business if customer impact ;
- provider if serviced model.

## Customer impact

Si de nouveaux paiements ne peuvent pas être acceptés en sécurité :

- clear degraded messaging ;
- no false confirmation ;
- preserve status queries.

## Recovery

Après restauration :

1. verify authoritative balance ;
2. verify route ;
3. release traffic under policy ;
4. monitor rejection rate ;
5. reconcile impacted payments.

## Post-incident

Review :

- forecast ;
- threshold ;
- alert ;
- operator response ;
- supplier ;
- capacity ;
- routing ;
- customer impact.

## Evidence

Archive :

- exports ;
- transaction refs ;
- balances ;
- transfer refs ;
- timeline ;
- approvals ;
- incident ticket ;
- remediation.

## Exercises

Examples :

- weekend depletion ;
- provider unavailable ;
- route failover ;
- stale balance ;
- erroneous transfer.

## Ownership

Primary :

- treasury/liquidity operations.

Partners :

- payment ops ;
- SRE ;
- architecture ;
- risk ;
- supplier management.

## Security

Liquidity operations are privileged financial actions :

- strong authentication ;
- least privilege ;
- session recording where applicable ;
- anomaly detection ;
- segregation of duties.

## Goal

Maintenir la continuité sans sacrifier la certitude du settlement ni le contrôle de la liquidité banque centrale.

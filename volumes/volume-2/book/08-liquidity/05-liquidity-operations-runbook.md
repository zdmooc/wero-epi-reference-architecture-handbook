---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Runbook de liquidité instant payments

## 1. Trigger

Déclenchement lorsque :
- balance below warning ;
- projected depletion ;
- liquidity rejects ;
- transfer failed ;
- balance feed stale ;
- unusual route shift.

## 2. Initial checks

1. confirm data freshness ;
2. confirm rail health ;
3. inspect inflow/outflow ;
4. inspect recent routing changes ;
5. identify available funding path ;
6. confirm account state.

## 3. Classify

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

## 4. Safe actions

Selon policy :
- fund position ;
- cancel planned defund ;
- change routing policy ;
- cap new traffic ;
- enter degraded mode ;
- escalate treasury.

## 5. Prohibited

- invent balance ;
- mark payment settled because liquidity was expected ;
- blind retry financial transfers ;
- route UNKNOWN payments elsewhere.

## 6. Maker/checker

Au-dessus d'un seuil de matérialité :
- maker prepares ;
- checker validates ;
- audit stores both identities.

## 7. Communication

Notifier :
- payment operations ;
- treasury ;
- SRE ;
- incident manager ;
- business if customer impact ;
- provider if serviced model.

## 8. Customer impact

Si de nouveaux paiements ne peuvent pas être acceptés en sécurité :
- clear degraded messaging ;
- no false confirmation ;
- preserve status queries.

## 9. Recovery

Après restauration :
1. verify authoritative balance ;
2. verify route ;
3. release traffic under policy ;
4. monitor rejection rate ;
5. reconcile impacted payments.

## 10. Post-incident

Review :
- forecast ;
- threshold ;
- alert ;
- operator response ;
- supplier ;
- capacity ;
- routing ;
- customer impact.

## 11. Evidence

Archive :
- exports ;
- transaction refs ;
- balances ;
- transfer refs ;
- timeline ;
- approvals ;
- incident ticket ;
- remediation.

## 12. Exercises

Examples :
- weekend depletion ;
- provider unavailable ;
- route failover ;
- stale balance ;
- erroneous transfer.

## 13. Ownership

Primary :
- treasury/liquidity operations.

Partners :
- payment ops ;
- SRE ;
- architecture ;
- risk ;
- supplier management.

## 14. Security

Liquidity operations are privileged financial actions :
- strong authentication ;
- least privilege ;
- session recording where applicable ;
- anomaly detection ;
- segregation of duties.

## 15. Goal

Maintenir la continuité sans sacrifier la certitude du settlement ni le contrôle de la liquidité banque centrale.

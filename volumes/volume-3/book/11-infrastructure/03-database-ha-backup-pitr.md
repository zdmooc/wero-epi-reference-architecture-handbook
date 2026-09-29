---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/oracle-exadata-x11m-solution-architecture
  - zdmooc/wero-organisme-poc
---

# Database HA, backup et PITR

## 1. Trois problèmes différents

### HA
Continue after component failure.

### Backup
Recover deleted or corrupted data.

### PITR
Restore to a known time.

One does not replace the others.

## 2. Single writer

Typical financial DB design prefers a clearly fenced writer.

Need:
- leader election ;
- sync or async replicas ;
- quorum ;
- promotion ;
- fencing.

## 3. Synchronous replication

Pros:
- stronger RPO across covered failure domain.

Costs:
- write latency ;
- quorum sensitivity.

Choose based on RPO and distance.

## 4. Asynchronous replication

Pros:
- lower latency ;
- remote DR.

Risk:
- non-zero RPO on sudden primary loss.

State target explicitly.

## 5. Failover

Sequence:
1. detect ;
2. prove primary unavailable or fenced ;
3. promote ;
4. redirect clients ;
5. validate writes ;
6. reconcile in-flight payments.

## 6. Connection pools

After failover:
- stale connections ;
- DNS/service changes ;
- retry storm.

Configure:
- validation ;
- bounded reconnect ;
- pool limits.

## 7. Split brain

Worst case:
two writers.

Controls:
- consensus ;
- fencing ;
- quorum ;
- no manual promotion without isolation proof.

## 8. Backup

Backup policy:
- full or incremental or platform-native ;
- encryption ;
- offsite or independent copy ;
- retention ;
- immutable copy if cyber risk requires.

## 9. Restore test

A backup is not proven until restored.

Test:
- empty environment ;
- recover ;
- validate schema ;
- validate row counts ;
- validate payment and ledger consistency ;
- validate keys and secrets dependencies.

## 10. PITR

Need:
- WAL/archive logs or equivalent ;
- restore procedures ;
- known target timestamp ;
- timezone discipline.

## 11. Application consistency

Restoring DB alone may leave:
- Kafka events ahead or behind ;
- external settlement already final ;
- merchant states inconsistent.

Therefore restore requires reconciliation.

## 12. Schema migration

Rules:
- backward compatible ;
- expand/migrate/contract ;
- no long lock on hot table ;
- rollback plan ;
- test with production-like volume.

## 13. Capacity

Monitor:
- TPS ;
- connections ;
- lock waits ;
- CPU ;
- IOPS ;
- log generation ;
- replication lag ;
- storage growth.

## 14. Data corruption

Scenarios:
- bad deployment ;
- operator mistake ;
- storage corruption ;
- malicious change.

Recovery differs from simple node failover.

## 15. Evidence

For HA claim:
- failure injected ;
- RTO measured ;
- acknowledged commits validated ;
- no split brain ;
- payment reconciliation complete.

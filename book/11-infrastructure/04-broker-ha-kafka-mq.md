---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/mayabank-kafka-ddd-openshift
  - zdmooc/mayabank-ibm-mq-native-ha-openshift-eda-platform
---

# Haute disponibilité Kafka / MQ

## 1. Broker role

Le broker peut porter domain events, notifications, messages d'intégration et flux d'audit.

Pour chaque flux, préciser s'il est :
- sur le chemin critique ;
- secondaire/asynchrone ;
- récupérable après indisponibilité.

## 2. Kafka cluster

Dimensions de conception :
- nombre de brokers ;
- replication factor ;
- min ISR ;
- partitions ;
- rack/zone awareness ;
- stockage ;
- rétention.

Aucun nombre unique ne convient à tous les workloads.

## 3. Producer durability

Réglages :
- acknowledgements ;
- retries ;
- idempotent producer ;
- delivery timeout.

Ils ne remplacent pas l'idempotence métier.

## 4. Consumer group

Failure:
- member dies ;
- rebalance ;
- partition reassigned.

Le consumer doit reprendre sans double effet.

## 5. Broker loss

Attendu :
- replicas maintiennent la disponibilité si quorum/config le permettent ;
- clients se reconnectent ;
- aucun double effet métier.

## 6. Zone loss

Pour revendiquer zone resilience :
- replicas réparties ;
- controllers/quorum survivants ;
- network/storage survivants ;
- tests exécutés.

## 7. MQ HA

MQ peut utiliser des patterns de native HA, multi-instance ou autres mécanismes supportés.

Le pattern produit exact appartient au design d'implémentation.

## 8. Exactly-once caution

Les transactions broker ne garantissent pas exactement un settlement bancaire externe.

## 9. Storage

La durabilité dépend de :
- persistent volume ;
- filesystem ;
- replication ;
- disk latency ;
- free space.

## 10. Backlog

Après panne :
- backlog monte ;
- recovery consomme CPU/network ;
- downstream peut être saturé.

Prévoir un débit de rattrapage contrôlé.

## 11. DLQ

La DLQ doit être HA et monitorée.

Une DLQ pleine peut masquer un incident durable.

## 12. Security

- TLS/mTLS ;
- ACL ;
- service identity ;
- credential rotation ;
- audit.

## 13. Capacity

Kafka :
- MB/s ;
- messages/s ;
- partitions ;
- lag ;
- disk.

MQ :
- msg/s ;
- queue depth ;
- channels ;
- logs/storage ;
- consumers.

## 14. Disaster recovery

Cross-site replication est distincte de local HA.

Définir :
- RPO ;
- failover ownership ;
- duplicate/replay plan ;
- client switch ;
- evidence.

## 15. Test matrix

- one broker ;
- controller ;
- zone ;
- disk full ;
- slow disk ;
- network partition ;
- consumer outage ;
- producer timeout ;
- DR switch.

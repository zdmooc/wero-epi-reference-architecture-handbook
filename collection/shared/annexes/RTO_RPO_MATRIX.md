# Annexe — Matrice RTO / RPO de référence

> Valeurs ci-dessous = exemples de cadrage, jamais SLA Wero/EPI ni engagement client.

| Capability | Failure domain | Example RTO objective | Example RPO objective | Recovery evidence |
|---|---|---:|---:|---|
| Public API | pod | 30–60 s | 0 | pod kill |
| Orchestrator | pod | 30–60 s | 0 durable intent | pod kill + replay |
| Database | primary | 30–120 s | 0 for acknowledged commits under tested scope | failover |
| Event broker | broker | 60–120 s | 0 committed events under tested replication | broker loss |
| IAM | pod/node | 60–120 s | session dependent | failover |
| DNS | endpoint | <5 min | n/a | DNS exercise |
| PKI/cert | cert failure | emergency runbook | n/a | rotation test |
| HSM | appliance/node | target-specific | key loss = 0 | HA/failover |
| CSM connectivity | primary link | target-specific | no lost financial truth | link loss |
| Merchant callback | worker | minutes | 0 delivery records | retry/dedup |
| Site | full site | target-specific | replication-specific | PRA exercise |
| Region | full region | target-specific | architecture-specific | regional DR |

## Règles

1. Un RTO s'applique à un service et un domaine de panne.
2. Un RPO s'applique à une classe de données et un domaine de panne.
3. RPO=0 doit préciser les commits couverts.
4. Une transaction réglée à l'extérieur mais absente localement nécessite reconciliation, même si le restore DB respecte son RPO.
5. Toute valeur de production doit être validée avec le métier, SRE, infrastructure et risques.

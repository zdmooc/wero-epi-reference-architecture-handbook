---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/mayabank-instant-payments-resilience-platform
  - zdmooc/wero-organisme-poc
---

# Partie XV — Stratégie de test et modèle de preuve

## 1. Tester les invariants, pas seulement les endpoints

Un test paiement doit démontrer des propriétés métier :

- un intent ne produit pas deux paiements ;
- UNKNOWN n'est pas converti arbitrairement en FAILED ;
- un event replay ne rejoue pas le paiement ;
- un refund est un mouvement distinct ;
- le settlement peut être réconcilié ;
- une panne ne crée pas deux writers.

## 2. Pyramide de tests

```text
Static / lint / schema
Unit
Component
Contract
Integration
End-to-end
Failure injection
Performance
HA / DR
Security
Operational exercise
```

Chaque niveau répond à une question différente.

## 3. Contract tests

Contrats :
- REST/OpenAPI ;
- event/AsyncAPI/schema ;
- ISO 20022 ;
- partner callback ;
- network/TLS ;
- database schema.

Tests :
- happy path ;
- field missing ;
- invalid enum ;
- backward compatibility ;
- version migration ;
- timeout ;
- duplicate.

## 4. ISO 20022 testing

Vérifier :
- well-formed XML ;
- namespace ;
- XSD ;
- EPC IG ;
- scheme rule ;
- mapping canonique ;
- identifier preservation ;
- reason codes ;
- recall/status-investigation paths.

## 5. End-to-end

Un test E2E utile trace :

```text
customer intent
→ API
→ paymentId
→ risk
→ financial instruction
→ rail simulator/real test endpoint
→ final status
→ ledger
→ event
→ reconciliation
→ merchant/customer status
```

## 6. Negative tests

Obligatoires :
- invalid token ;
- wrong scope ;
- bad certificate ;
- expired certificate ;
- invalid signature ;
- replay ;
- same key different payload ;
- bad alias ;
- unavailable VoP ;
- duplicate webhook.

## 7. Performance

Mesurer :
- throughput ;
- p50/p95/p99/p99.9 ;
- CPU/memory ;
- DB IOPS/connections ;
- broker lag ;
- network ;
- HSM sessions ;
- GC/runtime if applicable.

Scénarios :
- nominal ;
- peak ;
- peak + one node lost ;
- dependency slow ;
- retry storm ;
- recovery backlog.

## 8. Soak

Un service 24/7 doit subir des tests longs pour détecter :
- leaks ;
- pool exhaustion ;
- growing lag ;
- log/storage growth ;
- certificate/session issues ;
- degradation over time.

## 9. Chaos

Fault injection :
- process ;
- pod ;
- dependency ;
- DNS ;
- broker ;
- DB ;
- latency ;
- network ;
- certificate ;
- node ;
- AZ/site when infrastructure allows.

Chaque test possède une hypothèse métier.

## 10. DR exercise

Un PRA sérieux teste :
1. declaration ;
2. fencing ;
3. promotion ;
4. traffic switch ;
5. data validation ;
6. external reconciliation ;
7. service reopening ;
8. failback ;
9. evidence.

## 11. Security tests

- SAST/SCA ;
- IaC/container scan ;
- API authn/authz ;
- mTLS negative tests ;
- secret exposure ;
- webhook signature ;
- pen test ;
- threat scenarios ;
- key/cert rotation ;
- supply-chain validation.

## 12. Evidence classes

Le livre utilise :

- PUBLIC_VERIFIED ;
- REFERENCE_ARCHITECTURE ;
- INFERRED ;
- RUNTIME_PROVEN ;
- TO_BE_VERIFIED.

Le companion lab ajoute :
- CI_RENDER_PROVEN ;
- REFERENCE_DESIGN ;
- DISCOVERY_REQUIRED.

## 13. Claim-Evidence Matrix

Template :

| Claim | Evidence level | Test | Environment | Date | Limitations |
|---|---|---|---|---|---|
| same key same payment | runtime | concurrent API test | CRC | date | single-node platform |
| pod recovery | runtime | pod kill | CRC | date | not node/AZ |
| AZ failover | reference | design only | n/a | date | runtime required |

## 14. Anti-inflation rule

A claim never automatically climbs the ladder:

```text
DESIGNED
!= RENDERED
!= TESTED
!= RUNTIME_PROVEN
!= PRODUCTION_PROVEN
!= COMPLIANT
```

## 15. Test data

Use:
- synthetic customer ;
- synthetic IBAN/accounts ;
- synthetic merchant ;
- deterministic amounts ;
- no real secrets ;
- no confidential client data.

## 16. Regression pack

Minimum:
- nominal P2P ;
- nominal C2B ;
- duplicate ;
- timeout-before-effect ;
- timeout-after-effect ;
- UNKNOWN recovery ;
- refund ;
- callback failure ;
- broker outage ;
- IAM negative ;
- VoP negative/unavailable ;
- reconciliation.

## 17. Release gate

A release fails when:
- critical invariant test fails ;
- schema compatibility breaks ;
- unresolved high-severity vulnerability ;
- restore test stale ;
- certificate lifecycle invalid ;
- official scheme version mismatch.

## 18. Conclusion

La qualité d'une architecture de paiement se mesure à la qualité de ses preuves. Un diagramme est une intention ; un test documenté transforme une partie de cette intention en connaissance vérifiée.

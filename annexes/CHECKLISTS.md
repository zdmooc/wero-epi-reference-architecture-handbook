# Annexe — Checklists professionnelles

## A. Architecture paiement

- [ ] acteurs et responsabilités identifiés
- [ ] état commercial séparé de l'état financier
- [ ] idempotency key durable
- [ ] duplicate semantics définies
- [ ] UNKNOWN distinct de FAILED
- [ ] inquiry/status externe disponible
- [ ] reconciliation définie
- [ ] refund distinct du paiement initial
- [ ] return/recall distingués
- [ ] identifiers E2E documentés
- [ ] rail/CSM/settlement explicités
- [ ] source de finalité identifiée

## B. Réseau

- [ ] diagramme zones
- [ ] matrice des flux
- [ ] owner par lien
- [ ] DNS redondant
- [ ] anti-DDoS
- [ ] WAF
- [ ] LB/ingress HA
- [ ] proxy retry policy
- [ ] egress contrôlé
- [ ] dual connectivity vérifiée physiquement
- [ ] TLS policy
- [ ] mTLS where required
- [ ] PKI inventory
- [ ] expiry monitoring
- [ ] HSM dependency
- [ ] latency budget
- [ ] NAT/ephemeral ports capacity
- [ ] MTU/path tests if needed

## C. API / EDA

- [ ] OpenAPI
- [ ] idempotency semantics
- [ ] error model
- [ ] timeouts
- [ ] retry policy
- [ ] correlation IDs
- [ ] event envelope
- [ ] schema versioning
- [ ] Outbox
- [ ] Inbox
- [ ] DLQ runbook
- [ ] replay control
- [ ] AsyncAPI/event catalogue where useful

## D. Data

- [ ] system of record by entity
- [ ] payment state versioning
- [ ] ledger
- [ ] audit
- [ ] reconciliation store
- [ ] data classification
- [ ] encryption
- [ ] retention
- [ ] backup
- [ ] restore tested
- [ ] PITR
- [ ] RPO per failure domain
- [ ] fencing/quorum

## E. Security

- [ ] customer IAM
- [ ] SCA
- [ ] workload identity
- [ ] OAuth scopes
- [ ] TLS/mTLS
- [ ] PKI
- [ ] HSM
- [ ] secrets rotation
- [ ] fraud
- [ ] VoP
- [ ] AML/CFT
- [ ] sanctions
- [ ] webhook signing
- [ ] negative tests
- [ ] audit
- [ ] incident response
- [ ] supply-chain controls

## F. Kubernetes / OpenShift

- [ ] replicas
- [ ] topology spread
- [ ] anti-affinity
- [ ] readiness/startup/liveness
- [ ] PDB
- [ ] requests/limits
- [ ] HPA policy
- [ ] NetworkPolicy
- [ ] ServiceAccount
- [ ] secrets
- [ ] image digest
- [ ] image scanning
- [ ] GitOps
- [ ] backup
- [ ] operators version compatibility
- [ ] multi-zone dependencies checked

## G. Résilience

- [ ] business service defined
- [ ] BIA
- [ ] RTO
- [ ] RPO
- [ ] failure domains
- [ ] degraded modes
- [ ] fencing
- [ ] failover
- [ ] failback
- [ ] reconciliation after recovery
- [ ] chaos plan
- [ ] node test
- [ ] AZ test
- [ ] site/PRA test
- [ ] cyber recovery
- [ ] third-party outage

## H. DORA

- [ ] governance owner
- [ ] ICT risk framework mapping
- [ ] critical/important functions
- [ ] dependency map
- [ ] incidents process
- [ ] classification/reporting
- [ ] resilience testing
- [ ] TLPT applicability assessed
- [ ] third-party inventory
- [ ] subcontractors
- [ ] concentration risk
- [ ] exit strategy
- [ ] register of information
- [ ] evidence matrix

## I. SRE / Production Readiness

- [ ] on-call
- [ ] service ownership
- [ ] SLIs
- [ ] SLOs
- [ ] dashboards
- [ ] alerts
- [ ] business KPIs
- [ ] traces
- [ ] logs
- [ ] capacity
- [ ] runbooks
- [ ] release rollback
- [ ] certificate monitoring
- [ ] dependency contacts
- [ ] incident severity
- [ ] post-mortem
- [ ] reconciliation ops
- [ ] liquidity monitoring

## J. Publication quality

- [ ] public facts source primaire
- [ ] dates de vérification
- [ ] diagram truth label
- [ ] no invented internals
- [ ] current scheme versions
- [ ] current regulatory status
- [ ] glossary
- [ ] cross-references
- [ ] figure numbering
- [ ] index
- [ ] copyright/trademark review

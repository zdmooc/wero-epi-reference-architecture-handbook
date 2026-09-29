---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/openshift-platform-blueprints
  - zdmooc/maya-secure-agentic-devsecops-platform
---

# GitOps, release et software supply chain

## Desired state

~~~text
Git
→ pull request
→ validation
→ approved manifest
→ GitOps controller
→ cluster
~~~

Le drift devient visible.

## Repository structure

Séparer :

- application source ;
- image build ;
- environment config ;
- platform config.

Éviter un dépôt unique avec droits excessifs.

## Promotion

Promouvoir le même image digest :

~~~text
sandbox
→ build/test
→ preprod
→ prod
~~~

Ne pas rebuilder un binaire différent par environnement.

## Image provenance

Tracer :

- commit ;
- build ;
- digest ;
- SBOM ;
- scan ;
- signature/attestation.

## Secrets

Git contient des références, pas les secrets en clair.

## Policy gates

Exemples :

- no latest tag ;
- signed image ;
- approved registry ;
- probes ;
- requests/limits ;
- NetworkPolicy ;
- privileged container interdit sauf exception.

## Database migration

Séquence :

- expand schema ;
- deploy compatible app ;
- migrate data ;
- contract later.

## Canary

Pour payment processing :

- stable idempotency ;
- compatible state ;
- event schema compatibility ;
- no double consumer effect.

## Rollback

Rollback peut être dangereux si :

- schema destructif ;
- event schema incompatible ;
- external protocol changed.

Préférer forward-compatible design.

## Emergency change

Break-glass :

- authorized ;
- logged ;
- time-limited ;
- reconciled back to Git.

## Supply-chain risk

Protéger :

- source ;
- CI runner ;
- dependencies ;
- registry ;
- base images ;
- deployment credentials.

## Scanning

- SCA ;
- image scan ;
- secret scan ;
- IaC scan.

Le nombre de CVE seul ne suffit pas à prioriser le risque.

## Signed artifacts

Quand possible :

- sign image ;
- verify at admission ;
- retain provenance.

## Release evidence

Conserver :

- change ticket ;
- commit ;
- image digest ;
- tests ;
- approvals ;
- deployment time ;
- rollback result.

## Production readiness

Pas de release sans :

- functional tests ;
- contract tests ;
- ISO tests ;
- load ;
- security ;
- failover impact review ;
- runbook update.

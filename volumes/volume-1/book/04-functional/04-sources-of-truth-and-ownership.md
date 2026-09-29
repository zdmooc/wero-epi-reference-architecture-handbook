---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Sources de vérité, ownership et cohérence

## La question centrale

Quand deux systèmes ne sont pas d'accord, lequel fait autorité ?

Sans réponse explicite, la reprise incident devient improvisée.

## Truth map

| Objet | Source de vérité de référence |
|---|---|
| Customer account identity | core/customer system |
| Alias binding | directory service |
| Merchant order | merchant system |
| Payment request | Acceptor domain |
| User consent | Consumer/consent domain |
| Logical payment intent | payment domain |
| Local financial posting | ledger/core |
| External payment outcome | authoritative rail/participant evidence |
| Settlement | settlement/account records |
| Event delivery | broker + producer/consumer evidence |
| Merchant callback delivery | notification delivery store |
| Reconciliation case | reconciliation domain |

## Source of truth ≠ unique database

Une entreprise peut avoir plusieurs authoritative systems par objet.

Documenter :

- qui écrit ;
- qui lit ;
- qui réplique ;
- comment arbitrer.

## Materialized views

Read models peuvent combiner order, payment, risk, settlement et callback.

Ils améliorent l'UX sans devenir automatiquement sources financières.

## Cache

Chaque cache :

- owner ;
- TTL ;
- invalidation ;
- stale policy ;
- fail-open/fail-closed decision.

Directory/eligibility cache est plus sensible qu'un catalogue statique.

## External truth

Pour UNKNOWN, consulter selon contexte :

- rail inquiry ;
- participant status ;
- settlement report ;
- account statement.

Les logs applicatifs seuls ne suffisent pas.

## Dual writes

~~~text
write DB
write broker
~~~

Si l'un réussit et l'autre échoue : divergence.

Pattern :

- local transaction + Outbox.

## Core + payment domain

Si core posting et payment state sont séparés :

- ordering ;
- transaction/compensation ;
- external references ;
- reconciliation.

## Merchant truth

Merchant order CANCELLED avec payment SETTLED :

- garder les deux vérités ;
- créer refund si politique ;
- ne pas transformer le paiement en FAILED.

## Evidence hierarchy

Pendant incident :

1. settlement/rail authoritative records ;
2. core/ledger records ;
3. payment durable state ;
4. event delivery evidence ;
5. logs/traces.

Logs expliquent mais n'annulent pas un settlement.

## Ownership matrix

Pour chaque objet :

- business owner ;
- system owner ;
- technical owner ;
- data steward ;
- retention ;
- security classification ;
- recovery owner.

## Reconciliation SLA

Pour chaque break :

- detection latency ;
- auto-resolution window ;
- manual queue ;
- escalation ;
- accounting deadline.

## State convergence

~~~text
external financial truth
→ local payment state
→ events/read models
→ merchant/customer views
~~~

Retry propagation, pas financial effect.

## Questions Design Authority

- deux systèmes peuvent-ils écrire le même statut ?
- qui gagne en cas de conflit ?
- un cache peut-il changer le bénéficiaire ?
- analytics peut-il écrire ?
- settlement reference est-elle persistée ?
- reconciliation est-elle indépendante du thread original ?
- operator correction est-elle auditable ?

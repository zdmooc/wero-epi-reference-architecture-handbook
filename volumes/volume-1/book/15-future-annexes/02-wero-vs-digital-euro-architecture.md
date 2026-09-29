---
status: REVIEWED
last_verified: 2026-09-28
truth_level: MIXED
primary_sources:
  - ecb-digital-euro-pilot-2026
  - ecb-digital-euro-pilot-page-2026
  - ecb-digital-euro-fit-2026
related_internal_repos: []
---

# Wero et euro numérique — différences d'architecture

## Deux objets différents

Wero :

- solution/écosystème de paiement porté par EPI ;
- expérience consumer/merchant ;
- s'appuie sur des PSP et des rails account-to-account selon les cas.

Digital euro :

- projet Eurosystème de monnaie banque centrale numérique de détail ;
- potentiel nouvel actif monétaire numérique ;
- distribution envisagée via PSP selon le modèle public.

## Statut 2026

Au 28 septembre 2026 :

- Wero est live et en expansion ;
- le digital euro est en préparation/pilotage ;
- 36 PSP ont été sélectionnés pour le pilote ;
- le pilote est prévu au second semestre 2027 pour 12 mois ;
- une première émission potentielle est visée pour 2029 sous conditions législatives et décisionnelles.

## Monetary layer

Wero current public flows:

- account-to-account context ;
- commercial-bank account relationship ;
- instant payment rail.

Digital euro:

- central-bank digital money if issued.

Architecture must not merge assets.

## Distribution

Digital euro public model anticipates PSP involvement for distribution/acquiring-related services.

That means PSP architecture may eventually support:

- Wero ;
- cards ;
- SCT Inst ;
- digital euro ;
- other wallets.

## Wallet coexistence

A future bank app could expose:

- bank account ;
- Wero ;
- digital euro balance/wallet context.

UI convergence does not imply backend convergence.

## Settlement

Wero/SCT Inst:

- settlement through instant-payment infrastructure.

Digital euro:

- settlement/payment model belongs to its own platform/rulebook.

Do not reuse TIPS diagram as digital euro settlement proof.

## Offline

Digital euro work explicitly includes offline design/pilot considerations.

Wero public capabilities should be described separately; do not infer equivalent offline capability.

## Merchant acceptance

A merchant orchestration layer can abstract:

- payment method ;
- merchant order ;
- status ;
- refund ;
- reconciliation.

But each method retains:

- own authorization ;
- settlement ;
- dispute ;
- data ;
- legal rules.

## Identity

Potential convergence points:

- bank identity ;
- device ;
- European digital identity ;
- merchant identity.

Still maintain scheme-specific consent/security.

## Privacy

Digital euro privacy design is a distinct policy/technical topic.

Do not infer its data-sharing model from Wero.

## Co-badging / choice

Future architectures may need a payment-selection layer without steering users invisibly.

Design:

- clear method ;
- fees/rules ;
- availability ;
- consent.

## Resilience

Both need:

- 24/7 mindset ;
- participant availability ;
- cyber resilience ;
- reconciliation.

But failure domains differ.

## Bank reference architecture

~~~text
Channel
→ Payment Method Orchestrator
   ├─ Wero Adapter
   ├─ SCT Inst
   ├─ Card
   └─ Future Digital Euro Adapter
~~~

This is a reference architecture, not a claim about any bank.

## Migration caution

Digital euro should not be described as replacement of Wero.

Possible futures:

- coexistence ;
- interoperability at merchant/channel layer ;
- complementary use cases.

## Watch points

- Regulation adoption ;
- pilot results ;
- rulebook ;
- PSP interfaces ;
- offline ;
- holding/funding model ;
- merchant acceptance ;
- privacy ;
- interoperability.

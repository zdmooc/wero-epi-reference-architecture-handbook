# Editorial Governance

## 1. Source hierarchy

Ordre de confiance :

1. textes juridiques officiels (EUR-Lex) ;
2. EPC ;
3. ECB / Eurosystem ;
4. EBA CLEARING ;
5. documentation officielle EPI/Wero ;
6. documentation officielle des PSP/participants ;
7. standards et éditeurs ;
8. littérature secondaire clairement identifiée ;
9. architecture de référence du livre.

## 2. Claim labels

Chaque claim sensible reçoit un statut :

- `PUBLIC_VERIFIED`
- `REFERENCE_ARCHITECTURE`
- `INFERRED`
- `RUNTIME_PROVEN`
- `TO_BE_VERIFIED`

## 3. Mandatory metadata per chapter

Chaque chapitre évolutif doit contenir :

```yaml
status: DRAFT | REVIEWED | PUBLISHABLE
last_verified: YYYY-MM-DD
truth_level: PUBLIC_VERIFIED | MIXED | REFERENCE_ARCHITECTURE
primary_sources:
  - ...
related_internal_repos:
  - ...
```

## 4. Diagrams

Chaque diagramme doit préciser au minimum :

- vue : business / functional / application / data / network / physical / sequence ;
- statut : PUBLIC_VERIFIED / REFERENCE_ARCHITECTURE / INFERRED ;
- date de vérification ;
- source(s) ;
- version.

Les diagrammes d'architecture interne Wero/EPI non publiés doivent être explicitement libellés **REFERENCE ARCHITECTURE**.

## 5. Separation of facts and design

Format recommandé :

> **Fait public vérifié** — ce que la source confirme.

> **Conséquence architecturale** — ce que l'on peut raisonnablement en déduire.

> **Architecture de référence proposée** — une solution pédagogique/professionnelle proposée par l'auteur.

## 6. Runtime evidence

Une preuve lab doit inclure :

- environnement ;
- version ;
- commandes ;
- résultat attendu ;
- résultat observé ;
- limites ;
- date.

`RUNTIME_PROVEN` sur CRC mono-nœud ne devient jamais preuve multi-AZ ou multi-site.

## 7. Regulatory freshness

Les chapitres juridiques et scheme sont revus :

- avant chaque release majeure ;
- à chaque nouveau Rulebook EPC applicable ;
- à chaque modification législative significative ;
- à chaque RTS/ITS DORA significatif ;
- à chaque évolution publique EPI/Wero qui modifie un parcours.

## 8. Copyright and trademarks

Le livre doit :

- citer les sources ;
- paraphraser les documentations ;
- éviter la reproduction massive de textes protégés ;
- identifier Wero, EPI et les autres marques comme appartenant à leurs titulaires ;
- ne pas laisser croire à une publication officielle ou sponsorisée.

## 9. Quality gate before publication

Un chapitre ne passe `PUBLISHABLE` que si :

- ses claims sensibles sont sourcés ;
- ses diagrams sont classifiés ;
- les versions et dates sont explicites ;
- les termes clearing / settlement / scheme / standard ne sont pas confondus ;
- les exemples sont identifiés comme exemples ;
- les références croisées sont valides.

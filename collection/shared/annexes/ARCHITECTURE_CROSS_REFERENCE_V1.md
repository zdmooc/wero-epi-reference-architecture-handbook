# Carte de références croisées

## 1. Lire un paiement Wero de bout en bout

Wero/EPI context → Journey → Functional state → ISO 20022 → SCT Inst → Rail/CSM → Settlement/Liquidity → Network → API/Event/Data → Platform → Security → Resilience → Operations → Evidence.

## 2. Cross-reference matrix

| Question | Lire d'abord | Puis |
|---|---|---|
| Qui fait quoi ? | 02.2 Participants | 04.4 Sources de vérité |
| Comment un P2P fonctionne ? | 03.2 P2P | 06 SCT Inst |
| Comment un paiement marchand fonctionne ? | 03.3/03.4 | 02.4, 14.3 |
| Comment éviter le double paiement ? | 06.4 | 10.2, 10.6 |
| Que faire après un timeout ? | 06.2 | 04.3, 14.8 |
| Comment lire pacs.008/pacs.002 ? | 05.3 | 05.2, 06.1 |
| Comment gérer recall/return ? | 05.4 | 06.3, 03.5 |
| TIPS ou RT1 ? | 07.2/07.3 | 07.4, 08 |
| Comment router multi-CSM ? | 07.4 | 07.5, 08 |
| Où intervient la liquidité ? | 08.1 | 08.2–08.5 |
| Que doit contenir le réseau ? | 09.1 | 09.2–09.6 |
| Comment concevoir API/webhooks ? | 10.2 | 10.3–10.6 |
| Comment déployer sur OpenShift ? | 11.1/11.2 | 11.3–11.6 |
| Comment concevoir HA/PRA ? | 13.2/13.3 | 11.5, 13.4 |
| Comment appliquer DORA ? | 13.1 | 13.2–13.6, 17.1 |
| Comment exploiter 24/7 ? | 14.1 | 14.4–14.8 |
| Quelle preuve soutient une affirmation ? | 16.3 | 16.4 |
| Que surveiller à 5 ans ? | 15.5 | 17.1 |

## 3. Incident UNKNOWN

Timeout → 06.2 Timing → 04.3 State Machine → 06.4 Idempotency → 05.4 Investigation → 14.8 Reconciliation Operations → 16 Evidence.

## 4. Incident marchand

03.3 E-commerce / 03.4 POS → 02.4 Acceptor → 10.2 Webhook → 14.3 PSP/Merchant Architecture → 14.6 Incident Runbook.

## 5. Incident rail

07.5 Rail Adapter → 09.4 Banking Connectivity → 08 Liquidity → 13.4 Degraded Mode → 14.6 Incident → 14.8 Reconciliation.

## 6. Perte de site

11.5 Multi-site → 13.3 Fencing → 13.2 RTO/RPO → 13.4 Recovery → 16.2 Test Matrix.

## 7. Incident sécurité

12.6 Threat Model → 12.3 PKI/HSM → 13.6 Cyber Recovery → 14.6 Incident → 14.8 Reconciliation.

## 8. Usage éditorial

Cette carte est un outil de navigation. L'ordre source canonique reste publishing/book-order.txt.

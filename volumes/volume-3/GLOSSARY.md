# Glossaire de référence

> Définitions d'architecture. Les définitions juridiques ou scheme exactes restent celles des textes et rulebooks applicables.

| Terme | Définition de travail |
|---|---|
| Acceptor | Rôle d'acceptation côté marchand dans un parcours de paiement. |
| Acceptor PSP | PSP/acquéreur servant le côté marchand dans le modèle de référence. |
| ACCP | `AcceptedCustomerProfile` dans le contexte du pacs.002 SCT Inst 2025 décrit par les IG EPC. |
| ACH | Automated Clearing House. |
| AML/CFT | Anti-Money Laundering / Countering the Financing of Terrorism. |
| API Gateway | Point de contrôle/exposition API : auth, quotas, routing, observabilité, protection. |
| APP Fraud | Authorised Push Payment fraud : fraude où le client autorise lui-même un paiement sous tromperie. |
| BAH | Business Application Header ISO 20022. |
| BIA | Business Impact Analysis. |
| Callback | Appel retour d'un partenaire vers le système initiateur. |
| Central Bank Money | Actif de règlement émis par banque centrale. |
| Clearing | Processus de traitement/routage/calcul des obligations précédant ou accompagnant le settlement selon l'infrastructure. |
| CLM | Central Liquidity Management dans TARGET Services. |
| CSM | Clearing and Settlement Mechanism. |
| DCA | Dedicated Cash Account dans le contexte TARGET/TIPS. |
| DORA | Digital Operational Resilience Act, règlement UE 2022/2554. |
| E2E | End-to-end. |
| EndToEndId | Identifiant de bout en bout d'un paiement ISO 20022. |
| EPI | European Payments Initiative. |
| EventId | Identifiant unique d'un événement asynchrone. |
| Fencing | Mécanisme empêchant un ancien writer de continuer après promotion d'un nouveau writer. |
| Finality | Caractère final/irrévocable d'un settlement selon le système et le cadre applicable. |
| HSM | Hardware Security Module. |
| Idempotence | Propriété permettant de répéter la même intention logique sans créer un effet financier supplémentaire. |
| Inbox | Pattern de déduplication durable côté consumer d'événements. |
| Investigation | Processus permettant d'établir le statut réel d'une transaction ambiguë. |
| IPR | Instant Payments Regulation - règlement UE 2024/886. |
| ISO 20022 | Modèle/standard de messages financiers ; ce n'est pas un rail de paiement. |
| Ledger | Registre durable des mouvements/écritures financières ou métier selon le contexte. |
| Liquidity | Fonds/capacité de settlement disponibles pour exécuter les obligations. |
| MCA | Main Cash Account dans le modèle CLM/TARGET. |
| Merchant Order | Commande commerciale ; état distinct de l'état du paiement. |
| mTLS | Mutual TLS : authentification mutuelle par certificats. |
| NFR | Non-Functional Requirement. |
| OIDC | OpenID Connect. |
| Outbox | Pattern transactionnel stockant un événement avec la mutation métier avant publication asynchrone. |
| pacs.002 | FI-to-FI Payment Status Report ; utilisé pour confirmations SCT Inst selon IG applicables. |
| pacs.004 | Payment Return. |
| pacs.008 | FI-to-FI Customer Credit Transfer. |
| pacs.028 | FI-to-FI Payment Status Request. |
| Payment Hub | Couche/plateforme centralisant l'orchestration et l'intégration de traitements paiement. |
| Payment Intent | Intention logique durable précédant l'effet financier. |
| Payment Request | Objet de demande de paiement, notamment côté marchand. |
| PCA | Plan de Continuité d'Activité. |
| PKI | Public Key Infrastructure. |
| PRA | Plan de Reprise d'Activité. |
| PSP | Payment Service Provider. |
| RACI | Responsible, Accountable, Consulted, Informed. |
| Rail | Terme d'architecture désignant le chemin/infrastructure de paiement ; toujours préciser le système réel. |
| Recall | Demande de rappel d'un paiement selon règles du scheme. |
| Reconciliation | Comparaison de sources afin d'établir/aligner la vérité transactionnelle. |
| Refund | Remboursement marchand, nouveau mouvement lié à un paiement initial. |
| Return | Mouvement financier retournant des fonds, distinct du statut original. |
| RPO | Recovery Point Objective. |
| RT1 | Système paneuropéen d'EBA CLEARING pour paiements instantanés, real-time gross settlement. |
| RTO | Recovery Time Objective. |
| SCA | Strong Customer Authentication. |
| Scheme | Ensemble de règles métier/techniques régissant un type de paiement et ses participants. |
| SCT Inst | SEPA Instant Credit Transfer scheme. |
| Settlement | Extinction des obligations par transfert de l'actif de règlement selon l'infrastructure applicable. |
| SLI | Service Level Indicator. |
| SLO | Service Level Objective. |
| SLA | Service Level Agreement. |
| Split brain | Situation où plusieurs nœuds/sites se croient simultanément writers légitimes. |
| T2 | Service TARGET de règlement brut temps réel et gestion associée, distinct de TIPS. |
| TARGET Services | Famille de services Eurosystème incluant notamment T2, T2S, TIPS et CLM. |
| TIPS | TARGET Instant Payment Settlement. |
| TLS | Transport Layer Security. |
| TLPT | Threat-Led Penetration Testing. |
| Transactional Outbox | Voir Outbox. |
| UNKNOWN | État de référence lorsqu'un effet financier est possible mais que le résultat autoritatif n'est pas encore établi localement. |
| VoP | Verification of Payee. |
| Wallet | Expérience/logiciel de paiement ou d'identité ; ne constitue pas à lui seul un rail. |
| Webhook | Callback HTTP asynchrone, généralement signé/authentifié selon contrat. |
| Wero | Solution européenne de paiement portée par EPI. |
| Zero Trust | Modèle de sécurité où réseau/localisation ne suffisent pas à établir la confiance. |
| WAF | Web Application Firewall. |
| TIBER-EU | Threat Intelligence-based Ethical Red Teaming framework européen. |
| T2S | TARGET2-Securities. |
| SRE | Site Reliability Engineering. |
| SBOM | Software Bill of Materials. |
| RTGS | Real-Time Gross Settlement. |
| RBAC | Role-Based Access Control. |
| PSD3 | Projet de troisième directive européenne sur les services de paiement ; statut législatif à vérifier selon édition. |
| PSR | Projet/règlement européen Payment Services Regulation ; statut législatif à vérifier selon édition. |
| PITR | Point-In-Time Recovery. |
| PFMI | Principles for Financial Market Infrastructures. |
| PDB | PodDisruptionBudget Kubernetes. |
| OCT Inst | One-Leg Out Instant Credit Transfer scheme de l'EPC. |
| ISR | In-Sync Replicas dans Kafka. |
| HPA | Horizontal Pod Autoscaler Kubernetes/OpenShift. |
| EUDI | European Digital Identity Wallet / écosystème d'identité numérique européenne selon eIDAS2. |
| DDoS | Distributed Denial of Service. |
| DLQ | Dead Letter Queue : file de messages nécessitant traitement/revue après échecs répétés. |
| AStA | Ancillary System technical account dans le contexte TARGET/TIPS. |
## Relations à retenir

```text
Wero != SCT Inst
SCT Inst != ISO 20022
ISO 20022 != CSM
CSM != settlement asset
TIPS != RT1
Payment status != Order status
HTTP success != Financial finality
UNKNOWN != FAILED
Refund != Return != Recall
HA != Backup != DR
DESIGNED != RUNTIME_PROVEN != COMPLIANT
```

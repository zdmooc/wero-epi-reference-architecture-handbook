---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
related_internal_repos:
  - zdmooc/wero-organisme-poc
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Réseaux et flux — architecture de référence

## 1. Le réseau fait partie du paiement

Une plateforme peut avoir tous ses services applicatifs en état `READY` et pourtant être incapable de traiter un paiement si :

- DNS ne résout plus ;
- le certificat est expiré ;
- un firewall bloque le flux ;
- le load balancer garde une cible morte ;
- le chemin vers le CSM est indisponible ;
- la session mTLS échoue ;
- la réponse financière est perdue après effet.

Le réseau n'est donc pas une couche secondaire : il peut modifier directement l'état métier observé.

## 2. Vue réseau globale

```text
Customer / Merchant
      |
 Internet / Mobile network
      |
 DNS / CDN / Anti-DDoS
      |
 WAF
      |
 External Load Balancer
      |
 Reverse Proxy / OpenShift Router
      |
 API Gateway
      |
 +---------------- Security Zone ----------------+
 | IAM / Keycloak / IdP                          |
 | Payment APIs                                  |
 | Payment Orchestrator                          |
 +-----------------------------------------------+
      |
 +---------------- Payment Zone -----------------+
 | Payment Hub / Core adapters                   |
 | Fraud / VoP / AML                             |
 | Ledger / Reconciliation                       |
 | ISO 20022 / SCT Inst Gateway                  |
 +-----------------------------------------------+
      |
 Firewall / Proxy / Banking Connectivity
      |
 CSM / TIPS / RT1 / relevant infrastructure
```

## 3. Zones

### Public Edge
Expose uniquement les points nécessaires :
- API Gateway ;
- parcours d'identité explicitement publics.

### Application Zone
- services API ;
- orchestration ;
- stateless services.

### Payment Zone
- Payment Hub ;
- ledger ;
- adapters ;
- fraud/risk ;
- ISO gateway.

### Data Zone
- DB ;
- event brokers ;
- audit ;
- reconciliation.

### Management Zone
- observability ;
- admin ;
- GitOps ;
- bastion / controlled corporate access.

Observability n'est pas publique par défaut.

## 4. North-South

Flux entrant/sortant entre externe et plateforme :

```text
Internet
→ DNS
→ DDoS
→ WAF
→ LB
→ Ingress/Route
→ API Gateway
```

Contrôles :
- TLS ;
- rate limiting ;
- bot/DDoS protection ;
- header validation ;
- request size ;
- timeout ;
- audit.

## 5. East-West

Flux inter-services :

```text
API Gateway → Payment Service
Payment Service → IAM
Payment Service → Fraud
Payment Service → DB
Payment Service → Kafka
Payment Hub → ISO Adapter
```

Contrôles :
- NetworkPolicy ;
- workload identity ;
- mTLS ;
- least privilege ;
- service discovery ;
- timeout/circuit breaker.

## 6. Banking connectivity

La connectivité à un CSM ou une infrastructure TARGET doit être conçue comme un service critique distinct.

Questions obligatoires :
- connexion directe ou via service provider ?
- redondance physique ?
- redondance logique ?
- dual carrier ?
- dual site ?
- certificats ?
- IP allow-list ?
- proxy ?
- HSM dependency ?
- monitoring du session state ?
- failover testé ?

## 7. DNS

Le DNS est un failure domain.

Contrôles :
- plusieurs resolvers ;
- monitoring résolution ;
- TTL aligné sur stratégie de bascule ;
- aucune dépendance implicite non inventoriée ;
- runbook changement de cible ;
- mesure du vrai temps de convergence client.

## 8. TLS / mTLS

### TLS
Protège confidentialité et intégrité du transport et authentifie le serveur.

### mTLS
Authentifie aussi le client.

Usage recommandé sur les flux critiques :
- gateway → services ;
- service → payment hub ;
- payment hub → adapters ;
- services → broker ;
- services → secrets/HSM ;
- inter-site.

## 9. PKI

Cycle :
```text
request
→ identity validation
→ issue
→ deploy
→ monitor
→ rotate
→ revoke
→ archive evidence
```

Métriques :
- expiry D-90/D-60/D-30/D-7 ;
- trust chain ;
- failed handshakes ;
- revoked cert ;
- issuance anomalies.

## 10. HSM network dependency

Même si la clé privée reste protégée, l'indisponibilité du HSM peut bloquer :
- signature ;
- TLS client ;
- key operations ;
- security token generation.

Le HSM doit donc apparaître dans la cartographie de dépendances et dans les tests de panne.

## 11. Matrice des flux — modèle

| ID | Source | Destination | Protocol | Auth | Data | Criticality | Retry |
|---|---|---|---|---|---|---|---|
| F01 | Mobile | API GW | HTTPS | SCA/session | payment intent | critical | client-safe |
| F02 | API GW | Orchestrator | HTTPS/mTLS | workload | payment | critical | idempotent |
| F03 | Orchestrator | Fraud | HTTPS/mTLS | workload | risk data | critical | bounded |
| F04 | Orchestrator | Kafka | TLS/SASL | workload | events | high | outbox |
| F05 | Payment Hub | SCT Inst GW | internal/mTLS | workload | financial | critical | no blind financial retry |
| F06 | SCT GW | CSM | scheme protocol | cert/mTLS | ISO 20022 | critical | scheme-specific |
| F07 | Acceptor | Merchant | HTTPS webhook | signature | status | high | dedup/retry |

## 12. Timeout budget

```text
legal/scheme budget
 - client/channel
 - WAF/LB
 - API processing
 - fraud/VoP
 - core/payment hub
 - rail connectivity
 - beneficiary processing
 = remaining margin
```

Un timeout interne trop long peut rendre la conformité globale impossible.

## 13. Network failure matrix

- DNS down ;
- one LB target down ;
- router pod down ;
- router worker down ;
- zone down ;
- certificate expired ;
- wrong trust chain ;
- packet loss ;
- latency spike ;
- TCP reset ;
- MTU issue ;
- asymmetric firewall ;
- CSM link down ;
- HSM route down.

## 14. Evidence

Pour toute preuve réseau :
- timestamp ;
- topology ;
- DNS response ;
- LB health ;
- route/ingress status ;
- cert SAN/expiry ;
- client error ;
- recovery time ;
- payment business result.

Le redémarrage d'un pod ne prouve pas le réseau.

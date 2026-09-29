# Annexe — RACI de référence

> Generic architecture RACI; adapt to institution.

| Activity | Business/Product | Payment Architecture | App Team | Platform | Network | Security | SRE/Ops | Treasury | Compliance |
|---|---|---|---|---|---|---|---|---|---|
| Payment journey | A/R | R | C | I | I | C | C | I | C |
| Scheme version upgrade | C | A/R | R | C | C | C | R | I | C |
| ISO message mapping | I | A/R | R | I | I | C | C | I | C |
| Rail connectivity | I | A | C | C | R | C | R | C | I |
| Liquidity thresholds | I | C | I | I | I | I | C | A/R | C |
| PKI/cert lifecycle | I | C | C | C | C | A/R | R | I | I |
| Fraud rules | A | C | R | I | I | C | R | I | C |
| VoP integration | A | R | R | C | C | C | R | I | C |
| DR/PRA | C | A/R | R | R | R | C | R | C | C |
| Incident response | I | C | R | R | R | R | A/R | C | C |
| DORA evidence | C | R | C | C | C | C | R | I | A/R |
| Merchant reconciliation | A | R | R | I | I | I | R | C | C |

Legend: R Responsible, A Accountable, C Consulted, I Informed.

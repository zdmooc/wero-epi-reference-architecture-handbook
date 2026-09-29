---
status: COLLECTION_V2_REVIEWED
last_verified: 2026-09-29
truth_level: REFERENCE_ARCHITECTURE
primary_sources: []
---

# Payment incident command model

Payment incidents combine business, technical and financial state. The command model must prevent independent teams from taking conflicting recovery actions.

## 1. Roles

Reference roles:
- Incident Commander;
- Technical Lead;
- Payment/Rail Lead;
- Data/Reconciliation Lead;
- Security Lead when applicable;
- Business/Customer Impact Lead;
- Communications lead;
- Scribe/evidence owner.

One person may hold several roles in a small team; authority must still be explicit.

## 2. Critical questions

At every major decision:
1. Can new financial writes continue safely?
2. Is the authoritative data state known?
3. Can an instruction already have reached the rail?
4. Is routing/failover safe?
5. What customer/commercial state is being presented?
6. Which transactions are UNKNOWN?
7. Who owns the next irreversible action?

## 3. Forbidden generic action

"Restart everything" is not a financial recovery strategy.

Restarts can:
- erase ephemeral evidence;
- create simultaneous retries;
- move traffic before data authority is established;
- amplify dependency overload.

## 4. Timeline

Maintain a correlated incident timeline:
- infrastructure events;
- application events;
- rail/participant events;
- data/failover events;
- customer-impact milestones;
- operator decisions.

## 5. Exit criteria

Incident resolution is not only "HTTP 200 restored".

Exit requires:
- payment success path restored;
- no unresolved authority ambiguity;
- UNKNOWN population understood;
- reconciliation progressing/completed;
- monitoring normalised;
- residual risk accepted;
- evidence captured for postmortem.

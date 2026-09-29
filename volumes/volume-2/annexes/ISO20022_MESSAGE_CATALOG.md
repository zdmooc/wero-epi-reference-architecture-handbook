# Annexe — Catalogue ISO 20022 orienté SCT Inst

Baseline EPC SCT Inst 2025 Inter-PSP IG.

| Function | Message | Use |
|---|---|---|
| Payment instruction | `pacs.008.001.08` | inter-PSP customer credit transfer |
| Confirmation | `pacs.002.001.10` | positive / negative confirmation |
| Recall / Request for Recall | `camt.056.001.08` | cancellation/recall process |
| Negative recall response | `camt.029.001.09` | resolution/investigation negative response |
| Return / positive response | `pacs.004.001.09` | return of funds |
| Status investigation | `pacs.028.001.03` | request transaction status / recall status |

## Cash management family

Common adjacent messages:
- `camt.052` — account report ;
- `camt.053` — account statement ;
- `camt.054` — debit/credit notification.

Their use depends on bank/CSM/reporting context and is separate from the core `pacs.008 → pacs.002` payment flow.

## Important rule

Message versions are edition-sensitive. Revalidate this table at every EPC rulebook/IG change.

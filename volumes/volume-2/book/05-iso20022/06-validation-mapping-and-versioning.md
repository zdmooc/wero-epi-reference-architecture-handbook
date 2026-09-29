---
status: REVIEWED
last_verified: 2026-09-28
truth_level: REFERENCE_ARCHITECTURE
primary_sources:
  - epc-sct-inst-igs-2025-v1.0
related_internal_repos:
  - zdmooc/payment-hub-iso20022-opf-reference
---

# Validation, mapping et versioning ISO 20022

## Cinq niveaux de validité

~~~text
well-formed XML
→ XSD-valid
→ ISO semantic structure
→ Scheme Implementation Guideline
→ Participant/business rules
~~~

Un XML XSD-valid peut être rejeté par le scheme.

## Parser security

Controls:

- secure XML parser ;
- XXE disabled ;
- entity expansion limits ;
- max payload size ;
- namespace whitelist ;
- schema cache controlled ;
- no network fetch of arbitrary schemas at runtime.

## XSD management

Store:

- exact XSD version ;
- checksum ;
- source ;
- effective date ;
- test suite.

Do not download schemas dynamically during payment processing.

## Scheme profile

The EPC IG constrains the generic ISO model:

- mandatory fields ;
- cardinality ;
- allowed codes ;
- usage rules ;
- message version.

Generate code from XSD only if the team still preserves scheme business validation separately.

## Canonical model mapping

~~~text
Channel/API model
→ Payment canonical model
→ Scheme-specific ISO model
~~~

Mapping must be explicit and tested.

## Lossless vs lossy mapping

Lossless:

- all required semantics preserved.

Lossy:

- source contains information target cannot carry.

Every lossy mapping needs:

- business decision ;
- audit ;
- fallback/storage if needed.

## Code lists

Version:

- reason codes ;
- purpose codes ;
- country/currency ;
- category codes.

Do not compile them invisibly into application logic without update governance.

## Address transition

The SCT Inst baseline includes an address-format evolution where unstructured address ceases to be permitted from 15 November 2026.

Architecture implications:

- data quality ;
- customer/beneficiary master ;
- mapping ;
- validation ;
- regression ;
- cutover.

## Backward compatibility

During migration:

- receive old/new only if scheme permits ;
- version-specific parser ;
- output version selected by effective date ;
- test both until cutover.

## Message factory

Avoid building XML by string concatenation.

Use:

- typed model ;
- schema-aware serialization ;
- business validator ;
- canonical ID generator.

## Golden samples

Maintain:

- happy path ;
- reject examples ;
- recall ;
- return ;
- status investigation ;
- boundary amounts ;
- structured addresses ;
- special characters.

Each sample:

- source version ;
- expected result ;
- no real customer data.

## Contract tests

Against adapter:

- API input → exact ISO fields ;
- ISO response → internal state ;
- reason code mapping ;
- identifier preservation.

## Upgrade process

~~~text
new EPC rulebook/IG
→ diff
→ impact analysis
→ code/schema update
→ dual tests
→ participant certification
→ cutover plan
→ monitor
→ retire old version
~~~

## Governance

Owners:

- payment architect ;
- scheme expert ;
- application owner ;
- operations ;
- compliance where applicable.

## Evidence

For every scheme release archive:

- rulebook ;
- IG ;
- XSD ;
- code-list version ;
- test results ;
- certification evidence ;
- deployment date ;
- rollback strategy.

# Working Model — GitHub + Drive

## GitHub

GitHub is the **master source** for:

- manuscript ;
- diagrams source ;
- glossary ;
- changelog ;
- source registry ;
- editorial metadata ;
- versioning ;
- release history ;
- publication automation.

Repository:

`zdmooc/wero-epi-reference-architecture-handbook`

## Google Drive

Drive is the **document room** for:

- official PDFs ;
- research material ;
- archived source documents ;
- review copies ;
- proof PDFs ;
- publication administration ;
- contracts / ISBN / printer material when applicable.

Drive is not the canonical editable source of the manuscript.

## Existing technical repositories

Technical knowledge and labs remain in their own repositories. This book repository references and synthesizes them instead of absorbing everything.

This avoids:
- duplicated code ;
- divergent architecture claims ;
- duplicated evidence ;
- an unmaintainable monorepo.

## Change flow

```text
Official source / technical repo
            ↓
        verification
            ↓
  handbook manuscript change
            ↓
       diagram update
            ↓
        review gate
            ↓
          release
            ↓
      PDF / EPUB / print
```

## Rule

A change in a technical repo does not automatically become a book fact. It must pass editorial verification first.

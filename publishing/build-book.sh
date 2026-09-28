#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

rm -rf build
mkdir -p build/figures

echo "Rendering Mermaid figures..."
for f in diagrams/mermaid/*.mmd; do
  [ -e "$f" ] || continue
  base="$(basename "$f" .mmd)"
  npx -y @mermaid-js/mermaid-cli -p publishing/puppeteer-config.json -i "$f" -o "build/figures/$base.svg" -b white
done

cp publishing/metadata.yaml build/manuscript.md
printf "\n# Edition V1.0\n\n" >> build/manuscript.md
printf "> Reference vivante 2026-2031. Les informations volatiles sont datees et doivent etre reverifiees avant toute edition ulterieure.\n\n" >> build/manuscript.md

strip_frontmatter() {
  awk '
    NR==1 && $0=="---" {fm=1; next}
    fm==1 && $0=="---" {fm=0; next}
    fm!=1 {print}
  ' "$1"
}

while IFS= read -r f; do
  [[ -z "$f" ]] && continue
  echo "Adding $f"
  printf "\n\\newpage\n\n" >> build/manuscript.md
  strip_frontmatter "$f" >> build/manuscript.md
  printf "\n" >> build/manuscript.md
done < publishing/book-order.txt

printf "\n\\newpage\n\n# Catalogue des figures d'architecture\n\n" >> build/manuscript.md
for svg in build/figures/*.svg; do
  [ -e "$svg" ] || continue
  base="$(basename "$svg" .svg)"
  src="diagrams/mermaid/$base.mmd"
  title="$(grep -m1 '^%% title:' "$src" | sed 's/^%% title:[[:space:]]*//')"
  [ -n "$title" ] || title="$base"
  printf "\n## %s\n\n" "$title" >> build/manuscript.md
  printf "![%s](figures/%s.svg)\n\n" "$title" "$base" >> build/manuscript.md
  printf "*Source maintenable : %s.*\n\n" "$src" >> build/manuscript.md
done

pandoc build/manuscript.md   --from=gfm   --standalone   --toc   --number-sections   --pdf-engine=xelatex   --resource-path=build:.   -V documentclass=book   -V classoption=openany   -V geometry:paperwidth=8in   -V geometry:paperheight=10in   -V geometry:margin=0.7in   -V fontsize=10pt   -V mainfont="DejaVu Sans"   -V monofont="DejaVu Sans Mono"   -V colorlinks=true   -o build/wero-epi-reference-architecture-handbook-v1.0.pdf

pandoc build/manuscript.md   --from=gfm   --standalone   --toc   --number-sections   --resource-path=build:.   -o build/wero-epi-reference-architecture-handbook-v1.0.epub

echo "Build complete:"
ls -lh build/*.pdf build/*.epub
echo "Figures:"
find build/figures -type f -name '*.svg' | wc -l

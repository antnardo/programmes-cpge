#!/bin/zsh
# Compile la documentation sous pdfLaTeX et LuaLaTeX, puis prépare l'archive CTAN.
# Rien n'est envoyé nulle part : l'archive reste dans ../programmes-cpge-construction/.
# Ce dossier est hors du paquet, et c'est voulu : le paquet est cherché récursivement
# par TeX, et une copie de ses fichiers ou un .aux d'une autre passe y serait trouvé.
set -e
here="$(cd "$(dirname "$0")" && pwd)"
construction="$here/../programmes-cpge-construction"
cd "$here"
mkdir -p "$construction/pdflatex" "$construction/lualatex"
for moteur in pdflatex lualatex; do
  cp doc/programmes-cpge.tex "$construction/$moteur/"
  (cd "$construction/$moteur"
   for passe in 1 2 3; do
     TEXINPUTS="$here:" $moteur -shell-escape -interaction=nonstopmode -halt-on-error programmes-cpge.tex > /dev/null
   done)
  echo "✓ $moteur"
done
cp "$construction/lualatex/programmes-cpge.pdf" doc/
mkdir -p "$construction/ctan/programmes-cpge/doc"
cp README.md programmes-cpge.sty programmes-cpge-*.tex "$construction/ctan/programmes-cpge/"
cp doc/programmes-cpge.tex doc/programmes-cpge.pdf "$construction/ctan/programmes-cpge/doc/"
(cd "$construction/ctan" && rm -f programmes-cpge.zip && zip -qr programmes-cpge.zip programmes-cpge)
echo "✓ archive : $construction/ctan/programmes-cpge.zip"

#!/bin/zsh
# Compile la documentation sous pdfLaTeX et LuaLaTeX, puis prépare l'archive CTAN.
# Rien n'est envoyé nulle part : l'archive reste dans ../programmes-cpge-construction/.
# Ce dossier est hors du paquet, et c'est voulu : le paquet est cherché récursivement
# par TeX, et une copie de ses fichiers ou un .aux d'une autre passe y serait trouvé.
set -e
here="$(cd "$(dirname "$0")" && pwd)"
construction="$here/../programmes-cpge-construction"
cd "$here"
mkdir -p "$construction/pdflatex" "$construction/lualatex" "$construction/essai"

# Une commande sans argument mange l'espace qui la suit : dans les données, elle
# s'écrit suivie de {} (\cpgecettepartie{} constitue…).
if grep -nE '\\cpgecettepartie([^{A-Za-z]|$)' programmes-cpge-*.tex; then
  echo "✗ \\cpgecettepartie sans {} : l'espace qui suit serait mangé"
  exit 1
fi

# Les cinq programmes en entier, sous les deux moteurs : la documentation n'en
# compose que des extraits, et une formule fautive passerait inaperçue.
for moteur in pdflatex lualatex; do
  (cd "$construction/essai"
   if ! TEXINPUTS="$here:" $moteur -interaction=nonstopmode -halt-on-error \
        -jobname="commandes-$moteur" "$here/tests/essai-commandes.tex" > /dev/null; then
     echo "✗ commandes sous $moteur :"
     grep -A2 "^!" "commandes-$moteur.log" | head -6
     exit 1
   fi
   echo "✓ $(grep -o '[0-9]* vérifications passées' commandes-$moteur.log) sous $moteur"
   if ! TEXINPUTS="$here:" $moteur -interaction=nonstopmode -halt-on-error \
        -jobname="essai-$moteur" "$here/tests/essai-complet.tex" > /dev/null; then
     echo "✗ programmes complets sous $moteur : voir $construction/essai/essai-$moteur.log"
     exit 1
   fi
   if grep -q "Missing character\|invalid in math mode" "essai-$moteur.log"; then
     echo "✗ caractères manquants sous $moteur :"
     grep "Missing character\|invalid in math mode" "essai-$moteur.log" | sort -u | head
     exit 1
   fi)
  echo "✓ programmes complets sous $moteur"
done
for moteur in pdflatex lualatex; do
  cp doc/programmes-cpge.tex "$construction/$moteur/"
  (cd "$construction/$moteur"
   for passe in 1 2 3; do
     TEXINPUTS="$here:" $moteur -shell-escape -interaction=nonstopmode -halt-on-error programmes-cpge.tex > /dev/null
   done)
  echo "✓ $moteur"
done
cp "$construction/lualatex/programmes-cpge.pdf" doc/

# Un programme par filière, composé en entier : la preuve de la concordance avec
# le texte officiel, à lire à côté de lui.
mkdir -p "$construction/programmes"
for filiere in mpsi pcsi mp pc psi; do
  (cd "$construction/programmes"
   for passe in 1 2; do
     TEXINPUTS="$here:" lualatex -interaction=nonstopmode -halt-on-error \
       -jobname="programme-$filiere" "$here/doc/programme.tex" > /dev/null
   done)
  cp "$construction/programmes/programme-$filiere.pdf" doc/
done
echo "✓ programmes composés : doc/programme-{mpsi,pcsi,mp,pc,psi}.pdf"
mkdir -p "$construction/ctan/programmes-cpge/doc"
cp README.md LICENSE programmes-cpge.sty programmes-cpge-*.tex "$construction/ctan/programmes-cpge/"
cp doc/programmes-cpge.tex doc/programmes-cpge.pdf doc/programme.tex doc/programme-*.pdf \
  "$construction/ctan/programmes-cpge/doc/"
(cd "$construction/ctan" && rm -f programmes-cpge.zip && zip -qr programmes-cpge.zip programmes-cpge)
echo "✓ archive : $construction/ctan/programmes-cpge.zip"

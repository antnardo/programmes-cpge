# programmes-cpge

Les programmes officiels de physique-chimie des classes préparatoires
scientifiques — MPSI, PCSI, MP, PC (physique) et PSI —, ligne par ligne, à citer,
parcourir et composer en LaTeX.

```latex
\usepackage[MP,PSI]{programmes-cpge}
…
\cpgetableau{MP/4/1}           % la partie 4.1 de MP, comme dans le texte officiel
\cpgeboite{PSI/4/6/2}          % une ligne en boîte
\cpgepourchaqueligne{MP/4}{…}  % une mise en page sur mesure
```

Chaque élément porte une clé stable : `MP/4/1/1` est la première ligne de
l'électrostatique de MP. Le paquet fonctionne sous pdfLaTeX comme sous LuaLaTeX.

## Contenu

| Fichier | Rôle |
| --- | --- |
| `programmes-cpge.sty` | le paquet |
| `programmes-cpge-mpsi.tex`, `-pcsi`, `-mp`, `-pc`, `-psi` | les textes, un fichier par filière : ils font foi |
| `doc/programmes-cpge.tex`, `doc/programmes-cpge.pdf` | la documentation, en français |
| `construire.sh` | compile la documentation sous les deux moteurs et prépare l'archive, dans `../programmes-cpge-construction/` |

## Installation

Copier le dossier dans un arbre TeX (`TEXMFHOME/tex/latex/programmes-cpge/`).

## Licence

Le code est distribué sous la LaTeX Project Public License, version 1.3c ou
ultérieure. Les textes des programmes sont ceux publiés par le ministère de
l'Enseignement supérieur et de la Recherche. Ce sont des informations
publiques : les programmes de physique-chimie ne portant pas de licence
particulière, leur réutilisation est libre (CRPA, art. L. 321-1), sans
altération ni dénaturation, la source et la date citées (art. L. 322-1). Voir
la documentation, section « Les textes et leur licence ».

Les fichiers `programmes-cpge-*.tex` contiennent donc des textes officiels :
ils ne sont pas sous LPPL. Pour la PCSI et la PC, seul le programme de
physique est fourni.

## Contact

Une erreur de transcription, une suggestion : ouvrir une *issue* sur
<https://github.com/antnardo/programmes-cpge/issues>.

Auteur et mainteneur : Antonin Marchand.

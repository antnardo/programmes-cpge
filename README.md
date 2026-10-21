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

## In English

This package provides, as LaTeX data, the official physics and chemistry
syllabi of the French *classes préparatoires aux grandes écoles* (CPGE): MPSI,
PCSI, MP, PC and PSI (for PCSI and PC, the physics part only). Each item —
topic, section, syllabus line with its content and its required, experimental
and numerical skills — has a stable key such as `MP/4/1/1`. The package offers
expandable accessors, iterators, ready-made layouts (the official two-column
table, tcolorbox boxes) and the tools to build custom tables and boxes. It
works with pdfLaTeX and LuaLaTeX. The documentation is in French; the `doc`
folder also holds each syllabus typeset in full by the package, with its keys,
to be checked against the official text.

License: the code is under the LaTeX Project Public License 1.3c or later. The
data files `programmes-cpge-*.tex` contain official texts published by the
French Ministry of Higher Education; as public sector information without a
specific licence, they may be freely reused under French law, provided they
are not altered and their source and date are cited.

Bugs and suggestions: <https://github.com/antnardo/programmes-cpge/issues>.

## Contenu

| Fichier | Rôle |
| --- | --- |
| `programmes-cpge.sty` | le paquet |
| `programmes-cpge-mpsi.tex`, `-pcsi`, `-mp`, `-pc`, `-psi` | les textes, un fichier par filière : ils font foi |
| `doc/programmes-cpge.tex`, `doc/programmes-cpge.pdf` | la documentation, en français |
| `doc/programme-<filière>.pdf`, `doc/programme.tex` | chaque programme composé en entier, avec ses clés : la preuve de la concordance avec le texte officiel |
| `tests/` | les essais que lance `construire.sh` : chaque commande et ses options, et les cinq programmes sous les deux moteurs |
| `construire.sh` | lance les essais, compile la documentation sous les deux moteurs, compose les programmes et prépare l'archive, dans `../programmes-cpge-construction/` |

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

# Penn State Dissertation LaTeX Template

A LaTeX version of the Graduate School's current official Word template, [`PSU-Dissertation-Template.docx`](PSU-Dissertation-Template.docx).

## Build

### Locally

Install a TeX distribution with `xelatex`, `bibtex`, and `latexmk` (MacTeX on
macOS, TeX Live on Linux/Windows) and GNU Make.

```sh
make          # build/dissertation.pdf
make clean    # remove auxiliary files, keep the PDF
```

`latexmk` runs BibTeX and as many XeLaTeX passes as needed and rebuilds only
what changed. Build output stays in the ignored `build/` directory.

### Overleaf

Upload the repository as a zip (New Project → Upload Project). The included
`.latexmkrc` selects XeLaTeX automatically; you can also set
Menu → Compiler → XeLaTeX.

### Font

The class uses Times New Roman when it is installed (macOS and Windows have
it). Where it is not available, such as on Overleaf, it falls back to TeX Gyre
Termes, a Times clone included in TeX Live, so the document compiles
everywhere without changes.

## Where to put your content

| Part | File | What to fill in |
| --- | --- | --- |
| Title page | [dissertation-info.tex](dissertation-info.tex) | `\title`, `\author`, `\graduateMajor`, `\degree`, `\graduationDate`, `\copyrightYear` |
| Committee page | [frontmatter/committee.tex](frontmatter/committee.tex) | One `\committeeMember{Name}{Title(s)}{Role(s)}` per member |
| Abstract | [frontmatter/abstract.tex](frontmatter/abstract.tex) | Text after `\frontchapter*{ABSTRACT}` |
| Contents, figures, tables | [dissertation.tex](dissertation.tex) | Generated automatically; remove `\dissertationFigures` or `\dissertationTables` if you have no figures or tables |
| Acknowledgments | [frontmatter/acknowledgments.tex](frontmatter/acknowledgments.tex) | Required if you received federal funding (award numbers and disclaimer) |
| Chapters | [chapters/chapter-01.tex](chapters/chapter-01.tex) … [chapter-06.tex](chapters/chapter-06.tex) | `\chapter{Title}` followed by the text; Chapters 1 and 2 contain examples |
| Appendix | [appendices/appendix.tex](appendices/appendix.tex) | `\singleappendix{Title}` for one appendix; `\multipleappendices` + `\chapter` for several |
| References | [references.bib](references.bib) | BibTeX entries, cited with `\cite{key}` |
| Vita | [frontmatter/vita.tex](frontmatter/vita.tex) | Text inside `\begin{vita}`…`\end{vita}`; your name is filled in automatically |
| Packages and macros | [preamble.tex](preamble.tex) | Your own `\usepackage` lines and commands |
| Chapter order | [dissertation.tex](dissertation.tex) | Add, remove, or reorder `\input{...}` lines |
| Formatting | [psu-dissertation.cls](psu-dissertation.cls) | Global layout; no need to edit for normal use |

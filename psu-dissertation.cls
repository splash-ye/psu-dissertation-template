\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{psu-dissertation}[2026/09/11 Based on PSU-Dissertation-Template.docx]
\LoadClass[11pt,letterpaper,oneside,openany]{report}

% Measurements and styles are taken from the supplied Word template.
\RequirePackage{iftex}
\RequireXeTeX
\RequirePackage[no-math]{fontspec}
% The Word source contains no equation font specification. Keep newtx for math.
% newtxmath captures the current roman family for math digits and operators.
\renewcommand{\rmdefault}{ntxtlf}
\RequirePackage{newtxmath}
% Times New Roman is used when installed (macOS/Windows). Otherwise, e.g. on
% Overleaf, fall back to TeX Gyre Termes, a Times clone shipped with TeX Live.
\IfFontExistsTF{Times New Roman}
  {\setmainfont{Times New Roman}}
  {\setmainfont{texgyretermes}[Extension=.otf,UprightFont=*-regular,
     BoldFont=*-bold,ItalicFont=*-italic,BoldItalicFont=*-bolditalic]}
\RequirePackage[letterpaper,margin=1in,headheight=14pt,headsep=22pt]{geometry}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage[numbers,square,sort&compress]{natbib}
\RequirePackage[hidelinks,bookmarksnumbered,pdfpagelabels]{hyperref}

% Word points are 1/72 inch (TeX's bp). The report class's nominal 11pt
% actually selects 10.95 TeX pt, so explicitly select 11bp for all normal text.
\renewcommand{\normalsize}{%
  \@setfontsize\normalsize{11bp}{13.6bp}%
  \abovedisplayskip 11bp plus3bp minus6bp
  \abovedisplayshortskip 0bp plus3bp
  \belowdisplayshortskip 6.5bp plus3.5bp minus3bp
  \belowdisplayskip\abovedisplayskip
  \let\@listi\@listI
}
\normalsize
\doublespacing
\newcommand{\tableheading}[1]{{\fontsize{12bp}{14.4bp}\selectfont\bfseries #1}}
% Indent new paragraphs; the starred \titlespacing* below keeps the first
% paragraph after a chapter or section heading unindented.
\setlength{\parindent}{15pt}
\setlength{\parskip}{8pt}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}
\raggedbottom

% The source puts page numbers at the upper right, including chapter openers.
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyhead[R]{\normalfont\normalsize\thepage}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}
\pagestyle{plain}

% Word inserts an explicit line break after every chapter number.
\titleformat{\chapter}[display]
  {\normalfont\normalsize\bfseries\centering\setstretch{1}}
  {\MakeUppercase{\chaptertitlename}\ \thechapter}{0pt}{\MakeUppercase}
\titleformat{name=\chapter,numberless}[block]
  {\normalfont\normalsize\bfseries\centering\setstretch{1}}
  {}{0pt}{\MakeUppercase}
\titlespacing*{\chapter}{0pt}{8pt}{12pt}
\titleformat{\section}
  {\normalfont\normalsize\bfseries\centering\setstretch{1}}{\thesection}{1em}{}
\titleformat{\subsection}
  {\normalfont\normalsize\bfseries\setstretch{1}}{\thesubsection}{1em}{}
\titleformat{\subsubsection}
  {\normalfont\normalsize\bfseries\setstretch{1}}{\thesubsubsection}{1em}{}
\titlespacing*{\section}{0pt}{8pt}{4pt}
\titlespacing*{\subsection}{0pt}{4pt}{2pt}
\titlespacing*{\subsubsection}{0pt}{4pt}{2pt}

\renewcommand{\contentsname}{TABLE OF CONTENTS}
\renewcommand{\listfigurename}{LIST OF FIGURES}
\renewcommand{\listtablename}{LIST OF TABLES}
\renewcommand{\bibname}{References}
\renewcommand{\cfttoctitlefont}{\hfill\normalfont\normalsize\bfseries}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftloftitlefont}{\hfill\normalfont\normalsize\bfseries}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftlottitlefont}{\hfill\normalfont\normalsize\bfseries}
\renewcommand{\cftafterlottitle}{\hfill}
\setlength{\cftbeforetoctitleskip}{8pt}
\setlength{\cftaftertoctitleskip}{20pt}
\setlength{\cftbeforeloftitleskip}{8pt}
\setlength{\cftafterloftitleskip}{20pt}
\setlength{\cftbeforelottitleskip}{8pt}
\setlength{\cftafterlottitleskip}{20pt}
\renewcommand{\cftchapfont}{\normalfont}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchappresnum}{Chapter\ }
\setlength{\cftchapnumwidth}{5.5em}
\setlength{\cftbeforechapskip}{6pt}
\cftsetindents{section}{1em}{2.5em}
\cftsetindents{subsection}{2em}{3.2em}
\cftsetindents{subsubsection}{3em}{4em}
\renewcommand{\cftfigpresnum}{Figure\ }
\renewcommand{\cftfigaftersnum}{:}
\setlength{\cftfignumwidth}{5.5em}
\setlength{\cftfigindent}{0pt}
\renewcommand{\cfttabpresnum}{Table\ }
\renewcommand{\cfttabaftersnum}{:}
\setlength{\cfttabnumwidth}{5.5em}
\setlength{\cfttabindent}{0pt}
\captionsetup{font={normalsize,singlespacing},labelfont=normalfont,
  labelsep=colon,justification=raggedright,singlelinecheck=false}
\captionsetup[figure]{position=bottom,skip=10pt}
\captionsetup[table]{position=top,skip=10pt}

% Editable metadata is supplied in dissertation-info.tex.
\newcommand{\graduateMajor}[1]{\gdef\psu@major{#1}}
\newcommand{\degree}[1]{\gdef\psu@degree{#1}}
\newcommand{\graduationDate}[1]{\gdef\psu@date{#1}}
\newcommand{\copyrightYear}[1]{\gdef\psu@year{#1}}
\newcommand{\dissertationAuthor}{\@author}
\graduateMajor{Enter your Graduate Major}
\degree{Doctor of Philosophy}
\graduationDate{Enter your Graduation Month and Year}
\copyrightYear{2026}
\newif\ifshowcopyright
\showcopyrighttrue

\newcommand{\frontmatter}{\clearpage\pagenumbering{roman}}
\newcommand{\mainmatter}{\clearpage\pagenumbering{arabic}}
\renewcommand{\maketitle}{%
  \clearpage\thispagestyle{empty}%
  \begingroup
  \centering\singlespacing\setlength{\parskip}{0pt}%
  The Pennsylvania State University\par
  \vspace{0.3in}
  The J. Jeffrey and Ann Marie Fox Graduate School\par
  \vspace{0.9in}
  % The handbook asks for double spacing between lines of a multi-line title.
  {\fontsize{12bp}{28.8bp}\selectfont\bfseries\MakeUppercase{\@title}\par}
  \vspace{0.55in}
  A Dissertation in\par
  \vspace{0.2in}\psu@major\par
  \vspace{0.2in}by\par
  \vspace{0.2in}\@author\par
  \vfill
  \ifshowcopyright\textcopyright\ \psu@year\ \@author\par\fi
  \vfill
  Submitted in Partial Fulfillment\par
  of the Requirements\par
  for the Degree of\par
  \vspace{0.45in}\psu@degree\par
  \vspace{0.3in}\psu@date\par
  \endgroup
  \clearpage
}

\newenvironment{committee}{%
  \clearpage\begingroup\singlespacing
  The dissertation of \@author\ was reviewed and approved by the following:\par
  \vspace{0.35in}
}{\par\clearpage\endgroup}
\newcommand{\committeeMember}[3]{%
  \noindent\hspace*{0.5in}%
  \begin{minipage}{\dimexpr\textwidth-0.5in\relax}
    \setlength{\parskip}{0pt}%
    #1\par #2\par
    \if\relax\detokenize{#3}\relax\else #3\par\fi
  \end{minipage}\par\vspace{0.3in}
}

% Starred form omits a front-matter heading from the contents (e.g. abstract).
\NewDocumentCommand{\frontchapter}{s m}{%
  \chapter*{#2}%
  \IfBooleanF{#1}{\addcontentsline{toc}{chapter}{#2}}%
}
% Line spacing of the TOC/LOF/LOT, slightly tighter than the body's double
% spacing (1.618 at 11pt) so the TOC does not end with a nearly empty page.
\newcommand{\psu@liststretch}{\setstretch{1.6}}
\newcommand{\dissertationContents}{%
  \clearpage\begingroup\setlength{\parskip}{0pt}\psu@liststretch
  \tableofcontents\clearpage\endgroup
}
\newcommand{\dissertationFigures}{%
  \clearpage\phantomsection
  \addcontentsline{toc}{chapter}{\listfigurename}%
  \begingroup\setlength{\parskip}{0pt}\psu@liststretch
  \listoffigures\clearpage\endgroup
}
\newcommand{\dissertationTables}{%
  \clearpage\phantomsection
  \addcontentsline{toc}{chapter}{\listtablename}%
  \begingroup\setlength{\parskip}{0pt}\psu@liststretch
  \listoftables\clearpage\endgroup
}

% The handbook lists only body figures and tables in the LOF/LOT. Appendix
% floats are instead noted in the table of contents as "Figures" and "Tables"
% after each appendix's sections, pointing to the first float of each kind.
\RequirePackage{refcount}
\newif\ifpsu@inappendix
\def\psu@lof{lof}
\def\psu@lot{lot}
% Called from \caption in place of a LOF/LOT entry: label the first float.
\newcommand{\psu@appendixfloatmark}[1]{%
  \edef\psu@chap{\thechapter}%
  \ifcsname psu@seen@#1@\psu@chap\endcsname\else
    \expandafter\gdef\csname psu@seen@#1@\psu@chap\endcsname{}%
    \label{psu@app#1@\psu@chap}%
  \fi
}
\newcommand{\psu@appendixfloatline}[2]{%
  \edef\psu@key{psu@app#1@\thechapter}%
  \ifcsname r@\psu@key\endcsname
    \addtocontents{toc}{\protect\contentsline{section}{#2}%
      {\protect\pageref*{\psu@key}}{\getrefbykeydefault{\psu@key}{anchor}{}}}%
  \fi
}
% Emitted once per appendix, before the next chapter or at the end.
\newcommand{\psu@appendixfloatcontents}{%
  \ifpsu@inappendix
    \ifcsname psu@done@\thechapter\endcsname\else
      \expandafter\gdef\csname psu@done@\thechapter\endcsname{}%
      \psu@appendixfloatline{figure}{Figures}%
      \psu@appendixfloatline{table}{Tables}%
    \fi
  \fi
}
\AddToHook{cmd/chapter/before}{\psu@appendixfloatcontents}
\AtEndDocument{\psu@appendixfloatcontents}
\newcommand{\psu@appendixfloats}{%
  \let\psu@addcontentsline\addcontentsline
  \renewcommand{\addcontentsline}[3]{%
    \edef\psu@ext{##1}%
    \ifx\psu@ext\psu@lof \psu@appendixfloatmark{figure}%
    \else\ifx\psu@ext\psu@lot \psu@appendixfloatmark{table}%
    \else \psu@addcontentsline{##1}{##2}{##3}\fi\fi
  }%
  \global\psu@inappendixtrue
}

% A sole appendix has no letter in its heading or TOC entry, as the source asks.
% Internal numbering remains A for unambiguous equations/figures/sections.
\newcommand{\singleappendix}[1]{%
  \appendix\refstepcounter{chapter}%
  \begingroup
  \titleformat{name=\chapter,numberless}[display]
    {\normalfont\normalsize\bfseries\centering\setstretch{1}}
    {APPENDIX}{0pt}{\MakeUppercase}%
  \chapter*{#1}%
  \endgroup
  \phantomsection
  \addcontentsline{toc}{chapter}{Appendix\texorpdfstring{\quad}{ }#1}%
  \psu@appendixfloats
}
% For two or more appendices, use this followed by ordinary \chapter commands.
\newcommand{\multipleappendices}{%
  \appendix
  \addtocontents{toc}{\protect\renewcommand{\protect\cftchappresnum}{Appendix\ }}%
  \addtocontents{toc}{\protect\setlength{\protect\cftchapnumwidth}{6.5em}}%
  \psu@appendixfloats
}
\renewcommand{\bibsection}{%
  \chapter*{\bibname}\addcontentsline{toc}{chapter}{\bibname}%
}
% \dissertationReferences[<bibtex style>]{<bib file>}; the style defaults to
% plain (alphabetical by author). Use unsrtnat for order of first citation.
\newcommand{\dissertationReferences}[2][plain]{%
  \clearpage\begingroup\singlespacing
  \bibliographystyle{#1}\bibliography{#2}%
  \clearpage\endgroup
}
\newenvironment{vita}{%
  \clearpage\pagestyle{empty}\chapter*{Vita}\thispagestyle{empty}%
}{\par\clearpage}

\AtBeginDocument{\hypersetup{pdftitle={\@title},pdfauthor={\@author}}}

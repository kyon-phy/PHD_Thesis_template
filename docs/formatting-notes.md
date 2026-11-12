# Template formatting and build commands

All changes described here apply only to the independent template copy.

## Placeholder content and source paths

```tex
\chapter{Introduction}
\section{The Standard Model}
\subsection{Particle content and gauge group of the SM}
\caption[OOOO]{OOOO}
```

The original chapter, section, subsection, subsubsection, and paragraph headings
and their hierarchy are retained, including appendix headings. The body text
remains `OOOO`. The three heading commands above are examples taken from
different source files.

Heading commands retain their original arguments, starred forms, and optional
short titles. They control numbering, contents entries, and page headers.
Chapter 6 retains the original `\input` order while using the generic numbered
filenames.

Both arguments of `\caption[short caption]{full caption}` contain placeholders.
The optional argument appears in the list of figures or tables, and the
mandatory argument provides the caption displayed with the figure or table.
The original research paragraphs, equations, figures, tables, and image paths
have been removed. Chapter 1 contains independent formatting examples.

```tex
\include{Chapters/CH1}
\include{Chapters/Appendix/Appendix1}
\input{Chapters/Chapter6/section1}
\input{Chapters/Chapter8/figure1}
\includeonly{Chapters/CH1}
```

Filenames containing research topics were replaced with generic numbered names,
and the corresponding `\include` and `\input` paths were updated.
`\include` continues to insert chapter boundaries, while `\input` inserts a
source file at the current position.
`\includeonly` now points to the existing Chapter 1 file. This setting takes
effect when the `chapter` document class option is enabled.
The keys used by `\label`, `\ref`, and `\cite` were also replaced with generic
example keys, preserving cross-reference functionality.

## Title page and metadata

```tex
\newcommand{\ThesisTitleEN}{OOOO}
\newcommand{\ThesisTitleJA}{OOOO}
\newcommand{\ThesisAuthorEN}{OOOO}
\newcommand{\ThesisAuthorJA}{OOOO}
\newcommand{\ThesisDepartmentEN}{OOOO}
\newcommand{\ThesisUniversityEN}{OOOO}
\newcommand{\ThesisAffiliationJA}{OOOO}
\newcommand{\ThesisDegree}{OOOO}
\newcommand{\ThesisDateEN}{OOOO}
\newcommand{\ThesisSubmissionJA}{OOOO}
\title{\ThesisTitleEN}
\author{\ThesisAuthorEN}
\dept{\ThesisDepartmentEN}
\university{\ThesisUniversityEN}
\degreetitle{\ThesisDegree}
\degreedate{\ThesisDateEN}
\subject{OOOO}
\keywords{OOOO}
```

Ten field commands store the information to fill in. They replace the fixed
text on the title page. `\title` and `\author` also supply the PDF metadata,
keeping it consistent with the title page.
The manual `\\` line breaks tailored to the original English title were removed.
A replacement title wraps naturally within the available width.

The following title page settings retain their original values:

```tex
\newgeometry{left=27mm,right=27mm,top=25mm,bottom=25mm,bindingoffset=0mm}
\setstretch{1}
\setlength{\parindent}{0pt}
\begin{CJK}{UTF8}{ipxm}
\fontsize{24}{28}\selectfont
\fontsize{22}{24}\selectfont\bfseries
\fontsize{14.5}{19}\selectfont
\begin{minipage}{0.92\textwidth}
\fontsize{16}{18}\selectfont
\fontsize{16}{21}\selectfont
\restoregeometry
```

The left and right margins are 27 mm, and the top and bottom margins are 25 mm.
No additional binding offset is applied to the title page. Single line spacing
and zero paragraph indentation are used for its centred content.

`CJK` uses UTF-8 input and the `ipxm` Japanese font family.
`\fontsize{font size}{baseline skip}` retains the original font size and line
spacing for each part of the title page. The Japanese title area remains 92%
of the text width. The original `\vspace` and `\vfill` spacing commands are
also retained.
`\restoregeometry` restores the body margins after the title page.
A short placeholder title occupies fewer lines than a complete thesis title.

## Placeholder figures, tables, and equations

```tex
\fbox{\parbox[c][45mm][c]{0.72\linewidth}{\centering OOOO}}
```

`\fbox` draws a border. The two `c` arguments of `\parbox` specify the vertical
alignment of the box relative to its surroundings and the vertical alignment
of its contents, respectively. The box is 45 mm high and 72% of the current
line width. Its text is centred horizontally.
This placeholder requires no image file. Replace it with
`\includegraphics[width=...]{...}` when adding a real figure.

```tex
\begin{figure}[tbp]
\begin{table}[tbp]
\begin{tabular}{ll}
\toprule
\midrule
\bottomrule
\begin{equation}
  \mathrm{OOOO}
\end{equation}
```

`[tbp]` allows figures and tables to float to the top or bottom of a page, or to
a page of floats. `{ll}` creates two columns aligned to the left.
The three `booktabs` commands draw rules above the header, below the header,
and at the bottom of the table.
`equation` numbers the placeholder equation automatically, and `\mathrm`
renders its placeholder characters upright.
These examples use `\label` and `\ref` to demonstrate numbering and references.
They contain no research results.

## Preamble and bibliography

Only the nine notation commands required by the original headings are retained.
Add other notation in the custom commands section of `Preamble/preamble.tex`.

```tex
\newcommand*{\hadtau}{\ensuremath{\tau_{\mathrm{had}}}\xspace}
\newcommand*{\wjets}{\ensuremath{W+\mathrm{jets}}\xspace}
\newcommand{\bTagSR}{\ensuremath{\mathrm{SR1b}}\xspace}
\newcommand{\bVetoSR}{\ensuremath{\mathrm{SR0b}}\xspace}
\newcommand{\CRTop}{\ensuremath{\mathrm{CRTop}}\xspace}
\newcommand{\VRW}{\ensuremath{\mathrm{VRW}}\xspace}
\newcommand{\VRTop}{\ensuremath{\mathrm{VRTop}}\xspace}
\newcommand{\Res}{\ensuremath{\mathrm{Res}}\xspace}
\newcommand{\NonRes}{\ensuremath{\mathrm{NonRes}}\xspace}
```

These commands preserve the physics notation used in headings. `\hadtau`
produces tau with a had subscript, and `\wjets` produces W+jets. The remaining
commands produce SR1b, SR0b, CRTop, VRW, VRTop, Res, and NonRes.
`\ensuremath` allows the notation to be used in both text and maths mode,
`\mathrm` keeps identifiers upright, and `\xspace` inserts a space where
appropriate. These definitions contain no numerical results or thesis prose.

The unused `\usepackage{tikz-feynman}` was removed, so the default build does
not require that package. The original font settings, calligraphic maths font,
`CJKutf8`, contents depth, number-column width in the list of figures, and
bibliography links back to citation pages are retained.

```tex
\documentclass[a4paper,12pt,times,print,index,custombib]{Classes/PhDThesisPSnPDF}
```

The redundant `numbered` option was removed to avoid a conflict warning with
`custombib`. Numbered citations are still configured by
`\RequirePackage[square, sort&compress, numbers]{natbib}` in the preamble.
This selects square brackets and sorts citation numbers, compressing consecutive
numbers into ranges. The remaining class options continue to select A4 paper,
12 pt type, Times fonts, print margins, index support, and custom bibliography
settings, with the same displayed formatting.

```tex
\bibliographystyle{References/thesis-unsrtnat}
\bibliography{References/references}
\cite{placeholder-one,placeholder-two,placeholder-three}
```

The first two commands and the local `.bst` style are retained.
The `.bib` contents were replaced with three clearly marked placeholder entries.
They demonstrate numbering in order of first citation, compressed citation
numbers, and links back to citation pages.

## Build commands

The added `.latexmkrc` uses `$pdf_mode = 1` to select pdfLaTeX,
`$out_dir = 'build'` to collect generated files in one directory, and
`@default_files = ('thesis.tex')` to set the default main file.
`-interaction=nonstopmode` avoids interactive prompts, while `-halt-on-error`
stops compilation on an error. Standard TeX error messages allow latexmk to
recognise and create auxiliary subdirectories required by `\include`.

`add_cus_dep('nlo', 'nls', 0, ...)` registers a makeindex rule for optional
nomenclature support. `-s nomencl.ist` selects the nomenclature style, and
`-o` specifies the output file.
`$max_repeat = 10` allows up to ten LaTeX passes in a build so that included
files, contents entries, and citation backlinks can settle during the first
compilation. Latexmk stops recompiling once the files are stable.

The scripts that manually repeated pdfLaTeX, BibTeX, and makeindex calls, along
with the large general-purpose Makefile, were replaced with calls to
`latexmk -pdf`. It runs the required steps automatically based on dependencies.
In `Variables.ini`, `THESIS`, `BUILD_DIR`, and `LATEXMK` specify the main filename,
build directory, and command name, respectively. The Makefile's `-outdir` option
directs output to the selected directory.

The clean command is now `latexmk -c`, which removes auxiliary files while
retaining the generated PDF. The Windows script returns latexmk's exit code
and no longer deletes the PDF before building.
`.gitignore` excludes build output, backups, and local working files while
allowing source files and image assets to be committed.

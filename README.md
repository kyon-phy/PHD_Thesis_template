# PhD_thesis_template

A standalone LaTeX template adapted from a doctoral thesis project, based on
Krishna Kumar's [CUED PhD thesis template](https://github.com/kks32/phd-thesis-template).
It retains the English/Japanese title page, fonts, margins, page headers,
table of contents, lists of figures and tables, numbered citations, and
bibliography links back to the pages where each reference is cited.

The original chapter, section, and lower-level headings are retained, including
appendix headings and the document hierarchy. The thesis title, author,
affiliation, date, main text, appendix text, abstract, acknowledgements, and
references have been replaced with `OOOO` or clearly marked placeholders.
The repository contains only template sources and documentation. The original
thesis PDF, research figures, analysis data, backups, and Git history are excluded.

## Building the template

Use a full TeX Live or MacTeX installation with `latexmk`, BibTeX, CJKutf8,
and IPAex Mincho font support. The template is configured for **pdfLaTeX**.

Run the following command from the repository root:

```sh
latexmk -pdf thesis.tex
```

The output is `build/thesis.pdf`. Alternatively, use either command below:

```sh
./compile-thesis.sh
make
```

On Windows, install TeX Live and run `compile-thesis-windows.bat`.
For Overleaf, select `thesis.tex` as the main document and pdfLaTeX as the compiler.

To remove auxiliary files while keeping the PDF:

```sh
./compile-thesis.sh clean
# or
make clean
```

## Where to start editing

| File or directory | Purpose |
| --- | --- |
| `thesis-info.tex` | Title, author, affiliation, degree, date, and PDF metadata |
| `thesis.tex` | Chapter and appendix order, and optional front matter |
| `Preamble/preamble.tex` | Packages, contents depth, figure and table settings, and custom commands |
| `Chapters/CH1.tex` to `CH11.tex` | 11 chapters retaining the original headings and hierarchy |
| `Chapters/Chapter6/section1.tex` to `section10.tex` | Examples of sections stored in separate source files |
| `Chapters/Chapter8/figure1.tex` to `figure12.tex` | Examples of figure environments stored in separate source files |
| `Chapters/Appendix/Appendix1.tex` to `Appendix9.tex` | 9 appendix source files retaining the original headings |
| `Abstract/`, `Acknowledgement/`, `Declaration/`, `Dedication/` | Abstract, acknowledgements, declaration, and dedication |
| `References/references.bib` | Three fictional placeholder entries to replace with real references |
| `References/thesis-unsrtnat.bst` | Local BibTeX style that numbers references in order of first citation |
| `Figs/placeholder.tex` | A placeholder figure that requires no external image |
| `Classes/`, `sty/` | Document class, glyph mapping, and style sources |

Start by filling in the commands beginning with `\Thesis` at the top of
`thesis-info.tex`, then edit the `.tex` text and `.bib` entries.
The title page and PDF metadata share the English title and author fields.
Also replace the placeholders in `\subject{OOOO}` and `\keywords{OOOO}`.

Chapter 1 demonstrates figures, tables, equations, short captions,
cross-references, and compressed numerical citations. Chapter 6 uses `\input`
to assemble sections in their original order. Chapter 8 demonstrates a separate
figure source file. Adjust the existing headings to suit your thesis and replace
the placeholder text beneath them.

Seven appendices are enabled by default. The `\include` lines for the other two
appendices, the declaration, and the dedication are commented out. Uncomment
them as needed. All optional `.tex` files remain in the repository.

`OOOO` marks placeholder content and must be replaced before submission.
Check your university's title page and formatting requirements, and search
the project for `OOOO` and `placeholder` before submitting your thesis.

## Formatting and build notes

The [formatting notes](docs/formatting-notes.md) explain the commands
changed when preparing the template, their parameters, and their effects.
The retained two-sided layout starts chapters on right-hand pages, so blank
pages between short placeholder chapters are expected.

## Licence and attribution

The original template's [MIT licence](LICENSE) and author attribution are retained.
`References/thesis-unsrtnat.bst` is a modified version of `unsrtnat.bst`, and
`sty/breakurl.sty` is a style file retained from the template. The LaTeX Project
Public License notices in their respective file headers continue to apply.
`Classes/glyphtounicode.tex` retains its original source attribution.

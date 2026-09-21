# Toward Passwordless Document Encryption

LaTeX source for Isaac Teuscher's master's thesis (Brigham Young University, Department of Electrical and Computer Engineering). Defended and completed June 2026.

Forked from the [BYU College of Engineering thesis template](https://github.com/BYU-Engineering/thesis_template) and built with the `byuthesis` class (`src/byuthesis.cls`).

## Build

Compile with pdfLaTeX (TeX Live 2024 recommended on Overleaf):

- **`src/template.tex`** — submission (ETD) PDF
- **`src/template-for-printing.tex`** — print-oriented PDF (portrait pages with rotated wide figures/tables)

Bibliography uses `biblatex` + `biber` via `src/references.bib`.

### Print build

`src/template-for-printing.tex` is a thin wrapper: it sets `\byuprintbuild` and
inputs `template.tex`, so the printed copy always tracks the submission source.
All print-only changes live in `src/print-overrides.tex`, which `template.tex`
inputs at the end of its preamble when that flag is set:

- every page stays portrait (`landscape` is neutralized; wide figures and
  Table 4.2 are rotated in place instead), and
- the matplotlib plots are swapped for outlined copies in `src/print/figures/`
  (see `src/print/README.md`), so BYU Print & Mail's preflight finds no font
  named Arial.

Both builds must have every font embedded — check with
`pdffonts thesis-for-printing.pdf`; the `emb` column must read `yes` for every
row. Build the two PDFs one at a time: they share chapter `.aux` files.

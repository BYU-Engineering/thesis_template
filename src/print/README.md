# Print-build figure overrides

Files here shadow `src/` paths when building `template-for-printing.tex`:
`print-overrides.tex` wraps `\includegraphics` so that a file at
`print/<path>` is used instead of `<path>` when it exists. A figure at
`print/figures/<name>` therefore replaces `figures/<name>` in the print build
only. The submission build (`template.tex`) is unaffected.

These four plots are the matplotlib exports from the study results. Matplotlib's
default PDF output renders text as Type 3 fonts, which are embedded as glyph
procedures but still carry the name `ArialMT` / `Arial-BoldMT` / `DejaVuSans`.
Some print-shop preflight profiles report those as "Arial not embedded."

The copies here have their text converted to vector outlines, so the print PDF
references no font by name inside these figures and cannot be flagged:

    gs -q -dBATCH -dNOPAUSE -dSAFER -sDEVICE=pdfwrite -dNoOutputFonts \
       -dAutoRotatePages=/None -dCompatibilityLevel=1.7 -dPDFSETTINGS=/prepress \
       -o print/figures/<name>.pdf figures/<name>.pdf

Regenerate with that command if the source plot changes. Output is visually
identical; only text selectability inside the plot is lost (these Type 3 fonts
carried no ToUnicode map, so the text was not extractable to begin with).

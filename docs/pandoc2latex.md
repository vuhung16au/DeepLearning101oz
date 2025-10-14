  pandoc -f pdf -t latex --wrap=preserve --extract-media=media -o output.tex input.pdf
  ```
  - Requires `pdftotext` (Poppler). Results often degrade equations to plain text or images.

- **Why it’s hard**: PDFs usually don’t contain the original LaTeX or MathML—just positioned glyphs. There’s no semantic math to recover.

- **Better options**:
  - Use original `.tex` sources (which you already have in `chapters/`).
  - If you must reconstruct math from PDF: use a math OCR tool (e.g., Mathpix) to LaTeX selected pages/equations; quality is much higher than pandoc.
  - For scanned PDFs, run OCR first (`ocrmypdf`), then still expect limited math recovery.

- **Practical guidance**:
  - Use pandoc only for rough text extraction; manually fix math.
  - For small sections with heavy equations, use Mathpix/Snipping tools to get accurate LaTeX per equation.
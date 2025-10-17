# Makefile for Deep Learning 101 Book

.PHONY: help pdf pdf-a4 pdf-a5 pdf-letter pdf-a6 pdf-b5 pdf-trade all clean glossary index publish clean-temp clean-all temp

# Avoid parallel races across full-book builds which share chapters/*.aux
.NOTPARALLEL: pdf-a4 pdf-a5 pdf-letter pdf-a6 pdf-b5 pdf-trade

# Engine and tools
LATEX ?= lualatex
BIBER ?= biber
MAKEINDEX ?= makeindex
GLOSSARIES ?= makeglossaries

# Default target
help:
	@echo "Deep Learning 101 Book - Build targets:"
	@echo "  make help     - Show this help"
	@echo "  make pdf      - Build the complete book PDF (A5 paper)"
	@echo "  make pdf-a4   - Build the complete book PDF (A4 paper)"
	@echo "  make pdf-a5   - Build the complete book PDF (A5 paper)"
	@echo "  make pdf-letter - Build the complete book PDF (US Letter paper)"
	@echo "  make pdf-a6   - Build the complete book PDF (A6 paper)"
	@echo "  make pdf-b5   - Build the complete book PDF (B5 paper)"
	@echo "  make pdf-trade - Build the complete book PDF (6\"x9\" trade paper)"
	@echo "  make epub     - Build EPUB (via tex4ebook)"
	@echo "  make tex4ebook - Alias of 'make epub'"
	@echo "  make epub-pandoc - Build EPUB (via Pandoc fallback)"
	@echo "  make all      - Clean and build all versions"
	@echo "  make publish  - Copy all PDFs (A4, A5, Letter, A6, B5, Trade) to Deep-Learning101-PDF-Books folder"
	@echo "  make glossary - Update the glossary"
	@echo "  make index    - Update the index"
	@echo "  make clean    - Remove build artifacts"
	@echo "  make clean-temp - Remove temporary files in temp/ directory"
	@echo "  make clean-all - Remove all generated files including PDFs"
	@echo "  make <size>-chapter-<n> - Build a single chapter PDF (size: a4, a5, letter, a6, b5, trade)"

# Create temp directory
temp:
	@mkdir -p temp

# Default PDF target (A5)
pdf: pdf-a5

# A4 paper version
pdf-a4: temp main-a4.pdf

main-a4.pdf: main.tex chapters/*.tex temp
	@echo "Building Deep Learning 101 (A4 paper)..."
	@echo "Pass 1: Initial compilation..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-a4 "\def\papersize{a4paper}\input{main.tex}" > /dev/null || (cat main-a4.log && exit 1)
	@echo "Pass 2: Processing bibliography..."
	@$(BIBER) main-a4 > /dev/null || true
	@echo "Pass 3: Processing glossary..."
	@$(GLOSSARIES) main-a4 > /dev/null || true
	@echo "Pass 4: Processing index..."
	@$(MAKEINDEX) main-a4 > /dev/null || true
	@echo "Pass 5: Resolving references..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-a4 "\def\papersize{a4paper}\input{main.tex}" > /dev/null || (cat main-a4.log && exit 1)
	@echo "Pass 6: Final compilation..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-a4 "\def\papersize{a4paper}\input{main.tex}" > /dev/null || (cat main-a4.log && exit 1)
	@echo "Moving auxiliary files to temp directory..."
	@mv main-a4.aux main-a4.log main-a4.out main-a4.toc main-a4.bbl main-a4.blg main-a4.bcf main-a4.run.xml main-a4.synctex.gz main-a4.idx main-a4.ind main-a4.ilg main-a4.ist main-a4.glo main-a4.gls main-a4.glg temp/ 2>/dev/null || true
	@echo "Book compiled successfully: main-a4.pdf"

# A5 paper version
pdf-a5: temp main-a5.pdf

main-a5.pdf: main.tex chapters/*.tex temp
	@echo "Building Deep Learning 101 (A5 paper)..."
	@echo "Pass 1: Initial compilation..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-a5 "\def\papersize{a5paper}\input{main.tex}" > /dev/null || (cat main-a5.log && exit 1)
	@echo "Pass 2: Processing bibliography..."
	@$(BIBER) main-a5 > /dev/null || true
	@echo "Pass 3: Processing glossary..."
	@$(GLOSSARIES) main-a5 > /dev/null || true
	@echo "Pass 4: Processing index..."
	@$(MAKEINDEX) main-a5 > /dev/null || true
	@echo "Pass 5: Resolving references..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-a5 "\def\papersize{a5paper}\input{main.tex}" > /dev/null || (cat main-a5.log && exit 1)
	@echo "Pass 6: Final compilation..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-a5 "\def\papersize{a5paper}\input{main.tex}" > /dev/null || (cat main-a5.log && exit 1)
	@echo "Moving auxiliary files to temp directory..."
	@mv main-a5.aux main-a5.log main-a5.out main-a5.toc main-a5.bbl main-a5.blg main-a5.bcf main-a5.run.xml main-a5.synctex.gz main-a5.idx main-a5.ind main-a5.ilg main-a5.ist main-a5.glo main-a5.gls main-a5.glg temp/ 2>/dev/null || true
	@echo "Book compiled successfully: main-a5.pdf"

# US Letter paper version
pdf-letter: temp main-letter.pdf

main-letter.pdf: main.tex chapters/*.tex temp
	@echo "Building Deep Learning 101 (US Letter paper)..."
	@echo "Pass 1: Initial compilation..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-letter "\def\papersize{letterpaper}\input{main.tex}" > /dev/null || (cat main-letter.log && exit 1)
	@echo "Pass 2: Processing bibliography..."
	@$(BIBER) main-letter > /dev/null || true
	@echo "Pass 3: Processing glossary..."
	@$(GLOSSARIES) main-letter > /dev/null || true
	@echo "Pass 4: Processing index..."
	@$(MAKEINDEX) main-letter > /dev/null || true
	@echo "Pass 5: Resolving references..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-letter "\def\papersize{letterpaper}\input{main.tex}" > /dev/null || (cat main-letter.log && exit 1)
	@echo "Pass 6: Final compilation..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-letter "\def\papersize{letterpaper}\input{main.tex}" > /dev/null || (cat main-letter.log && exit 1)
	@echo "Moving auxiliary files to temp directory..."
	@mv main-letter.aux main-letter.log main-letter.out main-letter.toc main-letter.bbl main-letter.blg main-letter.bcf main-letter.run.xml main-letter.synctex.gz main-letter.idx main-letter.ind main-letter.ilg main-letter.ist main-letter.glo main-letter.gls main-letter.glg temp/ 2>/dev/null || true
	@echo "Book compiled successfully: main-letter.pdf"

# A6 paper version
pdf-a6: temp main-a6.pdf

main-a6.pdf: main.tex chapters/*.tex temp
	@echo "Building Deep Learning 101 (A6 paper)..."
	@echo "Pass 1: Initial compilation..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-a6 "\def\papersize{a6paper}\input{main.tex}" > /dev/null || (cat main-a6.log && exit 1)
	@echo "Pass 2: Processing bibliography..."
	@$(BIBER) main-a6 > /dev/null || true
	@echo "Pass 3: Processing glossary..."
	@$(GLOSSARIES) main-a6 > /dev/null || true
	@echo "Pass 4: Processing index..."
	@$(MAKEINDEX) main-a6 > /dev/null || true
	@echo "Pass 5: Resolving references..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-a6 "\def\papersize{a6paper}\input{main.tex}" > /dev/null || (cat main-a6.log && exit 1)
	@echo "Pass 6: Final compilation..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-a6 "\def\papersize{a6paper}\input{main.tex}" > /dev/null || (cat main-a6.log && exit 1)
	@echo "Moving auxiliary files to temp directory..."
	@mv main-a6.aux main-a6.log main-a6.out main-a6.toc main-a6.bbl main-a6.blg main-a6.bcf main-a6.run.xml main-a6.synctex.gz main-a6.idx main-a6.ind main-a6.ilg main-a6.ist main-a6.glo main-a6.gls main-a6.glg temp/ 2>/dev/null || true
	@echo "Book compiled successfully: main-a6.pdf"

# B5 paper version
pdf-b5: temp main-b5.pdf

main-b5.pdf: main.tex chapters/*.tex temp
	@echo "Building Deep Learning 101 (B5 paper)..."
	@echo "Pass 1: Initial compilation..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-b5 "\def\papersize{b5paper}\input{main.tex}" > /dev/null || (cat main-b5.log && exit 1)
	@echo "Pass 2: Processing bibliography..."
	@$(BIBER) main-b5 > /dev/null || true
	@echo "Pass 3: Processing glossary..."
	@$(GLOSSARIES) main-b5 > /dev/null || true
	@echo "Pass 4: Processing index..."
	@$(MAKEINDEX) main-b5 > /dev/null || true
	@echo "Pass 5: Resolving references..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-b5 "\def\papersize{b5paper}\input{main.tex}" > /dev/null || (cat main-b5.log && exit 1)
	@echo "Pass 6: Final compilation..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-b5 "\def\papersize{b5paper}\input{main.tex}" > /dev/null || (cat main-b5.log && exit 1)
	@echo "Moving auxiliary files to temp directory..."
	@mv main-b5.aux main-b5.log main-b5.out main-b5.toc main-b5.bbl main-b5.blg main-b5.bcf main-b5.run.xml main-b5.synctex.gz main-b5.idx main-b5.ind main-b5.ilg main-b5.ist main-b5.glo main-b5.gls main-b5.glg temp/ 2>/dev/null || true
	@echo "Book compiled successfully: main-b5.pdf"

# Trade paper version (6"x9")
pdf-trade: temp main-trade.pdf

main-trade.pdf: main.tex chapters/*.tex temp
	@echo "Building Deep Learning 101 (6\"x9\" trade paper)..."
	@echo "Pass 1: Initial compilation..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-trade "\def\papersize{trade}\input{main.tex}" > /dev/null || (cat main-trade.log && exit 1)
	@echo "Pass 2: Processing bibliography..."
	@$(BIBER) main-trade > /dev/null || true
	@echo "Pass 3: Processing glossary..."
	@$(GLOSSARIES) main-trade > /dev/null || true
	@echo "Pass 4: Processing index..."
	@$(MAKEINDEX) main-trade > /dev/null || true
	@echo "Pass 5: Resolving references..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-trade "\def\papersize{trade}\input{main.tex}" > /dev/null || (cat main-trade.log && exit 1)
	@echo "Pass 6: Final compilation..."
	@$(LATEX) -interaction=nonstopmode -halt-on-error -jobname=main-trade "\def\papersize{trade}\input{main.tex}" > /dev/null || (cat main-trade.log && exit 1)
	@echo "Moving auxiliary files to temp directory..."
	@mv main-trade.aux main-trade.log main-trade.out main-trade.toc main-trade.bbl main-trade.blg main-trade.bcf main-trade.run.xml main-trade.synctex.gz main-trade.idx main-trade.ind main-trade.ilg main-trade.ist main-trade.glo main-trade.gls main-trade.glg temp/ 2>/dev/null || true
	@echo "Book compiled successfully: main-trade.pdf"

# Update glossary
glossary: temp
	@echo "Updating glossary..."
	@$(GLOSSARIES) temp/main-a4 > /dev/null || true
	@$(GLOSSARIES) temp/main-a5 > /dev/null || true
	@echo "Glossary updated successfully!"

# Update index
index: temp
	@echo "Updating index..."
	@$(MAKEINDEX) temp/main-a4 > /dev/null || true
	@$(MAKEINDEX) temp/main-a5 > /dev/null || true
	@echo "Index updated successfully!"

# Build all versions
# Serialize multi-size builds to be safe under parallel make (-j)
all: clean
	@$(MAKE) pdf-a4
	@$(MAKE) pdf-a5
	@$(MAKE) pdf-letter
	@$(MAKE) pdf-a6
	@$(MAKE) pdf-b5
	@$(MAKE) pdf-trade
	@echo "All versions built successfully!"

# Publish rule - copy PDFs to Deep-Learning101-PDF-Books folder
publish: pdf-a4 pdf-a5 pdf-letter pdf-a6 pdf-b5 pdf-trade
	@echo "Publishing PDFs to Deep-Learning101-PDF-Books folder..."
	@mkdir -p Deep-Learning101-PDF-Books
	@cp main-a4.pdf Deep-Learning101-PDF-Books/Deep-Learning-101-A4.pdf
	@cp main-a5.pdf Deep-Learning101-PDF-Books/Deep-Learning-101-A5.pdf
	@cp main-letter.pdf Deep-Learning101-PDF-Books/Deep-Learning-101-Letter.pdf
	@cp main-a6.pdf Deep-Learning101-PDF-Books/Deep-Learning-101-A6.pdf
	@cp main-b5.pdf Deep-Learning101-PDF-Books/Deep-Learning-101-B5.pdf
	@cp main-trade.pdf Deep-Learning101-PDF-Books/Deep-Learning-101-Trade.pdf
	@echo "PDFs published successfully!"
	@echo "  - Deep-Learning101-PDF-Books/Deep-Learning-101-A4.pdf"
	@echo "  - Deep-Learning101-PDF-Books/Deep-Learning-101-A5.pdf"
	@echo "  - Deep-Learning101-PDF-Books/Deep-Learning-101-Letter.pdf"
	@echo "  - Deep-Learning101-PDF-Books/Deep-Learning-101-A6.pdf"
	@echo "  - Deep-Learning101-PDF-Books/Deep-Learning-101-B5.pdf"
	@echo "  - Deep-Learning101-PDF-Books/Deep-Learning-101-Trade.pdf"

# ----------------------------------------------------------------------
# EPUB build via tex4ebook
# ----------------------------------------------------------------------

# Prepare aux/bbl by building a full PDF first (A4)
pdf-prepare: pdf-a4
	@echo "PDF prepared for EPUB conversion."

epub: pdf-prepare temp
	@echo "Building EPUB via tex4ebook…"
	@/Library/TeX/texbin/tex4ebook -f epub3 -x -s main.tex "mathjax,charset=utf-8" || (echo "tex4ebook failed" && exit 1)
	@mkdir -p Deep-Learning101-PDF-Books
	@mv -f main.epub Deep-Learning101-PDF-Books/Deep-Learning-101.epub
	@echo "EPUB built: Deep-Learning101-PDF-Books/Deep-Learning-101.epub"

tex4ebook: epub

# Pandoc fallback EPUB
epub-pandoc: temp
	@echo "Building EPUB via Pandoc…"
	@mkdir -p Deep-Learning101-PDF-Books
	@pandoc --from=latex --to=epub3 \
		--resource-path=".:chapters:images" \
		--toc --toc-depth=2 \
		--citeproc --bibliography=references.bib \
		--mathjax \
		--epub-cover-image=images/DeepLearning101-cover-trade.png \
		-o Deep-Learning101-PDF-Books/Deep-Learning-101.epub main.tex || (echo "pandoc epub failed" && exit 1)
	@echo "EPUB built (Pandoc): Deep-Learning101-PDF-Books/Deep-Learning-101.epub"

# ----------------------------------------------------------------------
# Single-chapter builds: <size>-chapter-<n>
# Example: `make a4-chapter-1` or `make a4-chapter-01`
# Output: Deep-Learning101-PDF-Books/<size>/chapter-<NN>.pdf
# ----------------------------------------------------------------------

a4-chapter-%: temp
	@CHNUM=$$(printf "%02d" $*); \
	 echo "Building chapter $$CHNUM (A4 paper)..."; \
	 mkdir -p Deep-Learning101-PDF-Books/a4; \
	 echo "Pass 1: Initial compilation..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a4 "\def\papersize{a4paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a4.log && exit 1); \
	 echo "Pass 2: Processing bibliography..."; \
        $(BIBER) chapter-$$CHNUM-a4 > /dev/null || true; \
	 echo "Pass 3: Processing glossary..."; \
        $(GLOSSARIES) chapter-$$CHNUM-a4 > /dev/null || true; \
	 echo "Pass 4: Processing index..."; \
        $(MAKEINDEX) chapter-$$CHNUM-a4 > /dev/null || true; \
	 echo "Pass 5: Resolving references..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a4 "\def\papersize{a4paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a4.log && exit 1); \
	 echo "Pass 6: Final compilation..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a4 "\def\papersize{a4paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a4.log && exit 1); \
	 echo "Moving auxiliary files to temp directory..."; \
	 mv chapter-$$CHNUM-a4.aux chapter-$$CHNUM-a4.log chapter-$$CHNUM-a4.out chapter-$$CHNUM-a4.toc chapter-$$CHNUM-a4.bbl chapter-$$CHNUM-a4.blg chapter-$$CHNUM-a4.bcf chapter-$$CHNUM-a4.run.xml chapter-$$CHNUM-a4.synctex.gz chapter-$$CHNUM-a4.idx chapter-$$CHNUM-a4.ind chapter-$$CHNUM-a4.ilg chapter-$$CHNUM-a4.ist chapter-$$CHNUM-a4.glo chapter-$$CHNUM-a4.gls chapter-$$CHNUM-a4.glg temp/ 2>/dev/null || true; \
	 cp chapter-$$CHNUM-a4.pdf Deep-Learning101-PDF-Books/a4/chapter-$$CHNUM.pdf; \
	 echo "Chapter compiled successfully: Deep-Learning101-PDF-Books/a4/chapter-$$CHNUM.pdf"

a5-chapter-%: temp
	@CHNUM=$$(printf "%02d" $*); \
	 echo "Building chapter $$CHNUM (A5 paper)..."; \
	 mkdir -p Deep-Learning101-PDF-Books/a5; \
	 echo "Pass 1: Initial compilation..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a5 "\def\papersize{a5paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a5.log && exit 1); \
	 echo "Pass 2: Processing bibliography..."; \
        $(BIBER) chapter-$$CHNUM-a5 > /dev/null || true; \
	 echo "Pass 3: Processing glossary..."; \
        $(GLOSSARIES) chapter-$$CHNUM-a5 > /dev/null || true; \
	 echo "Pass 4: Processing index..."; \
        $(MAKEINDEX) chapter-$$CHNUM-a5 > /dev/null || true; \
	 echo "Pass 5: Resolving references..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a5 "\def\papersize{a5paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a5.log && exit 1); \
	 echo "Pass 6: Final compilation..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a5 "\def\papersize{a5paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a5.log && exit 1); \
	 echo "Moving auxiliary files to temp directory..."; \
	 mv chapter-$$CHNUM-a5.aux chapter-$$CHNUM-a5.log chapter-$$CHNUM-a5.out chapter-$$CHNUM-a5.toc chapter-$$CHNUM-a5.bbl chapter-$$CHNUM-a5.blg chapter-$$CHNUM-a5.bcf chapter-$$CHNUM-a5.run.xml chapter-$$CHNUM-a5.synctex.gz chapter-$$CHNUM-a5.idx chapter-$$CHNUM-a5.ind chapter-$$CHNUM-a5.ilg chapter-$$CHNUM-a5.ist chapter-$$CHNUM-a5.glo chapter-$$CHNUM-a5.gls chapter-$$CHNUM-a5.glg temp/ 2>/dev/null || true; \
	 cp chapter-$$CHNUM-a5.pdf Deep-Learning101-PDF-Books/a5/chapter-$$CHNUM.pdf; \
	 echo "Chapter compiled successfully: Deep-Learning101-PDF-Books/a5/chapter-$$CHNUM.pdf"

letter-chapter-%: temp
	@CHNUM=$$(printf "%02d" $*); \
	 echo "Building chapter $$CHNUM (US Letter paper)..."; \
	 mkdir -p Deep-Learning101-PDF-Books/letter; \
	 echo "Pass 1: Initial compilation..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-letter "\def\papersize{letterpaper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-letter.log && exit 1); \
	 echo "Pass 2: Processing bibliography..."; \
        $(BIBER) chapter-$$CHNUM-letter > /dev/null || true; \
	 echo "Pass 3: Processing glossary..."; \
        $(GLOSSARIES) chapter-$$CHNUM-letter > /dev/null || true; \
	 echo "Pass 4: Processing index..."; \
        $(MAKEINDEX) chapter-$$CHNUM-letter > /dev/null || true; \
	 echo "Pass 5: Resolving references..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-letter "\def\papersize{letterpaper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-letter.log && exit 1); \
	 echo "Pass 6: Final compilation..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-letter "\def\papersize{letterpaper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-letter.log && exit 1); \
	 echo "Moving auxiliary files to temp directory..."; \
	 mv chapter-$$CHNUM-letter.aux chapter-$$CHNUM-letter.log chapter-$$CHNUM-letter.out chapter-$$CHNUM-letter.toc chapter-$$CHNUM-letter.bbl chapter-$$CHNUM-letter.blg chapter-$$CHNUM-letter.bcf chapter-$$CHNUM-letter.run.xml chapter-$$CHNUM-letter.synctex.gz chapter-$$CHNUM-letter.idx chapter-$$CHNUM-letter.ind chapter-$$CHNUM-letter.ilg chapter-$$CHNUM-letter.ist chapter-$$CHNUM-letter.glo chapter-$$CHNUM-letter.gls chapter-$$CHNUM-letter.glg temp/ 2>/dev/null || true; \
	 cp chapter-$$CHNUM-letter.pdf Deep-Learning101-PDF-Books/letter/chapter-$$CHNUM.pdf; \
	 echo "Chapter compiled successfully: Deep-Learning101-PDF-Books/letter/chapter-$$CHNUM.pdf"

a6-chapter-%: temp
	@CHNUM=$$(printf "%02d" $*); \
	 echo "Building chapter $$CHNUM (A6 paper)..."; \
	 mkdir -p Deep-Learning101-PDF-Books/a6; \
	 echo "Pass 1: Initial compilation..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a6 "\def\papersize{a6paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a6.log && exit 1); \
	 echo "Pass 2: Processing bibliography..."; \
        $(BIBER) chapter-$$CHNUM-a6 > /dev/null || true; \
	 echo "Pass 3: Processing glossary..."; \
        $(GLOSSARIES) chapter-$$CHNUM-a6 > /dev/null || true; \
	 echo "Pass 4: Processing index..."; \
        $(MAKEINDEX) chapter-$$CHNUM-a6 > /dev/null || true; \
	 echo "Pass 5: Resolving references..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a6 "\def\papersize{a6paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a6.log && exit 1); \
	 echo "Pass 6: Final compilation..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a6 "\def\papersize{a6paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a6.log && exit 1); \
	 echo "Moving auxiliary files to temp directory..."; \
	 mv chapter-$$CHNUM-a6.aux chapter-$$CHNUM-a6.log chapter-$$CHNUM-a6.out chapter-$$CHNUM-a6.toc chapter-$$CHNUM-a6.bbl chapter-$$CHNUM-a6.blg chapter-$$CHNUM-a6.bcf chapter-$$CHNUM-a6.run.xml chapter-$$CHNUM-a6.synctex.gz chapter-$$CHNUM-a6.idx chapter-$$CHNUM-a6.ind chapter-$$CHNUM-a6.ilg chapter-$$CHNUM-a6.ist chapter-$$CHNUM-a6.glo chapter-$$CHNUM-a6.gls chapter-$$CHNUM-a6.glg temp/ 2>/dev/null || true; \
	 cp chapter-$$CHNUM-a6.pdf Deep-Learning101-PDF-Books/a6/chapter-$$CHNUM.pdf; \
	 echo "Chapter compiled successfully: Deep-Learning101-PDF-Books/a6/chapter-$$CHNUM.pdf"

b5-chapter-%: temp
	@CHNUM=$$(printf "%02d" $*); \
	 echo "Building chapter $$CHNUM (B5 paper)..."; \
	 mkdir -p Deep-Learning101-PDF-Books/b5; \
	 echo "Pass 1: Initial compilation..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-b5 "\def\papersize{b5paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-b5.log && exit 1); \
	 echo "Pass 2: Processing bibliography..."; \
        $(BIBER) chapter-$$CHNUM-b5 > /dev/null || true; \
	 echo "Pass 3: Processing glossary..."; \
        $(GLOSSARIES) chapter-$$CHNUM-b5 > /dev/null || true; \
	 echo "Pass 4: Processing index..."; \
        $(MAKEINDEX) chapter-$$CHNUM-b5 > /dev/null || true; \
	 echo "Pass 5: Resolving references..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-b5 "\def\papersize{b5paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-b5.log && exit 1); \
	 echo "Pass 6: Final compilation..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-b5 "\def\papersize{b5paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-b5.log && exit 1); \
	 echo "Moving auxiliary files to temp directory..."; \
	 mv chapter-$$CHNUM-b5.aux chapter-$$CHNUM-b5.log chapter-$$CHNUM-b5.out chapter-$$CHNUM-b5.toc chapter-$$CHNUM-b5.bbl chapter-$$CHNUM-b5.blg chapter-$$CHNUM-b5.bcf chapter-$$CHNUM-b5.run.xml chapter-$$CHNUM-b5.synctex.gz chapter-$$CHNUM-b5.idx chapter-$$CHNUM-b5.ind chapter-$$CHNUM-b5.ilg chapter-$$CHNUM-b5.ist chapter-$$CHNUM-b5.glo chapter-$$CHNUM-b5.gls chapter-$$CHNUM-b5.glg temp/ 2>/dev/null || true; \
	 cp chapter-$$CHNUM-b5.pdf Deep-Learning101-PDF-Books/b5/chapter-$$CHNUM.pdf; \
	 echo "Chapter compiled successfully: Deep-Learning101-PDF-Books/b5/chapter-$$CHNUM.pdf"

trade-chapter-%: temp
	@CHNUM=$$(printf "%02d" $*); \
	 echo "Building chapter $$CHNUM (6\"x9\" trade paper)..."; \
	 mkdir -p Deep-Learning101-PDF-Books/trade; \
	 echo "Pass 1: Initial compilation..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-trade "\def\papersize{trade}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-trade.log && exit 1); \
	 echo "Pass 2: Processing bibliography..."; \
        $(BIBER) chapter-$$CHNUM-trade > /dev/null || true; \
	 echo "Pass 3: Processing glossary..."; \
        $(GLOSSARIES) chapter-$$CHNUM-trade > /dev/null || true; \
	 echo "Pass 4: Processing index..."; \
        $(MAKEINDEX) chapter-$$CHNUM-trade > /dev/null || true; \
	 echo "Pass 5: Resolving references..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-trade "\def\papersize{trade}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-trade.log && exit 1); \
	 echo "Pass 6: Final compilation..."; \
        $(LATEX) -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-trade "\def\papersize{trade}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-trade.log && exit 1); \
	 echo "Moving auxiliary files to temp directory..."; \
	 mv chapter-$$CHNUM-trade.aux chapter-$$CHNUM-trade.log chapter-$$CHNUM-trade.out chapter-$$CHNUM-trade.toc chapter-$$CHNUM-trade.bbl chapter-$$CHNUM-trade.blg chapter-$$CHNUM-trade.bcf chapter-$$CHNUM-trade.run.xml chapter-$$CHNUM-trade.synctex.gz chapter-$$CHNUM-trade.idx chapter-$$CHNUM-trade.ind chapter-$$CHNUM-trade.ilg chapter-$$CHNUM-trade.ist chapter-$$CHNUM-trade.glo chapter-$$CHNUM-trade.gls chapter-$$CHNUM-trade.glg temp/ 2>/dev/null || true; \
	 cp chapter-$$CHNUM-trade.pdf Deep-Learning101-PDF-Books/trade/chapter-$$CHNUM.pdf; \
	 echo "Chapter compiled successfully: Deep-Learning101-PDF-Books/trade/chapter-$$CHNUM.pdf"

# Clean temporary files
clean-temp:
	@echo "Cleaning temporary files..."
	@rm -rf temp/
	@echo "Temporary files cleaned."

# Clean all generated files
clean-all: clean-temp
	@echo "Cleaning all generated files..."
	@rm -f *.pdf
	@rm -rf Deep-Learning101-PDF-Books/
	@echo "All generated files cleaned."

# Clean build artifacts (legacy clean target)
clean: clean-temp
	@echo "Cleaning build artifacts..."
	@rm -f *.aux *.log *.out *.toc *.bbl *.blg *.bcf *.run.xml *.synctex.gz
	@rm -f *.idx *.ind *.ilg *.lot *.lof *.lol *.fdb_latexmk *.fls *.auxlock
	@rm -f *.acn *.acr *.alg *.glg *.glo *.gls *.ist
	@rm -f main.pdf main-a4.pdf main-a5.pdf main-letter.pdf main-a6.pdf main-b5.pdf main-trade.pdf
	@rm -f main-a4.* main-a5.* main-letter.* main-a6.* main-b5.* main-trade.*
	@rm -f chapters/*.aux
	@echo "Build artifacts cleaned"
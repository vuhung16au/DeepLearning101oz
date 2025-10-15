# Makefile for Deep Learning 101 Book

.PHONY: help pdf pdf-a4 pdf-a5 pdf-letter pdf-a6 pdf-b5 pdf-trade all clean glossary index publish

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
	@echo "  make all      - Clean and build all versions"
	@echo "  make publish  - Copy all PDFs (A4, A5, Letter, A6, B5, Trade) to Deep-Learning101-PDF-Books folder"
	@echo "  make glossary - Update the glossary"
	@echo "  make index    - Update the index"
	@echo "  make clean    - Remove build artifacts"
	@echo "  make <size>-chapter-<n> - Build a single chapter PDF (size: a4, a5, letter, a6, b5, trade)"

# Default PDF target (A5)
pdf: pdf-a5

# A4 paper version
pdf-a4: main-a4.pdf

main-a4.pdf: main.tex chapters/*.tex
	@echo "Building Deep Learning 101 (A4 paper)..."
	@echo "Pass 1: Initial compilation..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-a4 "\def\papersize{a4paper}\input{main.tex}" > /dev/null || (cat main-a4.log && exit 1)
	@echo "Pass 2: Processing bibliography..."
	@biber main-a4 > /dev/null || true
	@echo "Pass 3: Processing glossary..."
	@makeglossaries main-a4 > /dev/null || true
	@echo "Pass 4: Processing index..."
	@makeindex main-a4 > /dev/null || true
	@echo "Pass 5: Resolving references..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-a4 "\def\papersize{a4paper}\input{main.tex}" > /dev/null || (cat main-a4.log && exit 1)
	@echo "Pass 6: Final compilation..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-a4 "\def\papersize{a4paper}\input{main.tex}" > /dev/null || (cat main-a4.log && exit 1)
	@echo "Book compiled successfully: main-a4.pdf"

# A5 paper version
pdf-a5: main-a5.pdf

main-a5.pdf: main.tex chapters/*.tex
	@echo "Building Deep Learning 101 (A5 paper)..."
	@echo "Pass 1: Initial compilation..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-a5 "\def\papersize{a5paper}\input{main.tex}" > /dev/null || (cat main-a5.log && exit 1)
	@echo "Pass 2: Processing bibliography..."
	@biber main-a5 > /dev/null || true
	@echo "Pass 3: Processing glossary..."
	@makeglossaries main-a5 > /dev/null || true
	@echo "Pass 4: Processing index..."
	@makeindex main-a5 > /dev/null || true
	@echo "Pass 5: Resolving references..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-a5 "\def\papersize{a5paper}\input{main.tex}" > /dev/null || (cat main-a5.log && exit 1)
	@echo "Pass 6: Final compilation..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-a5 "\def\papersize{a5paper}\input{main.tex}" > /dev/null || (cat main-a5.log && exit 1)
	@echo "Book compiled successfully: main-a5.pdf"

# US Letter paper version
pdf-letter: main-letter.pdf

main-letter.pdf: main.tex chapters/*.tex
	@echo "Building Deep Learning 101 (US Letter paper)..."
	@echo "Pass 1: Initial compilation..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-letter "\def\papersize{letterpaper}\input{main.tex}" > /dev/null || (cat main-letter.log && exit 1)
	@echo "Pass 2: Processing bibliography..."
	@biber main-letter > /dev/null || true
	@echo "Pass 3: Processing glossary..."
	@makeglossaries main-letter > /dev/null || true
	@echo "Pass 4: Processing index..."
	@makeindex main-letter > /dev/null || true
	@echo "Pass 5: Resolving references..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-letter "\def\papersize{letterpaper}\input{main.tex}" > /dev/null || (cat main-letter.log && exit 1)
	@echo "Pass 6: Final compilation..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-letter "\def\papersize{letterpaper}\input{main.tex}" > /dev/null || (cat main-letter.log && exit 1)
	@echo "Book compiled successfully: main-letter.pdf"

# A6 paper version
pdf-a6: main-a6.pdf

main-a6.pdf: main.tex chapters/*.tex
	@echo "Building Deep Learning 101 (A6 paper)..."
	@echo "Pass 1: Initial compilation..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-a6 "\def\papersize{a6paper}\input{main.tex}" > /dev/null || (cat main-a6.log && exit 1)
	@echo "Pass 2: Processing bibliography..."
	@biber main-a6 > /dev/null || true
	@echo "Pass 3: Processing glossary..."
	@makeglossaries main-a6 > /dev/null || true
	@echo "Pass 4: Processing index..."
	@makeindex main-a6 > /dev/null || true
	@echo "Pass 5: Resolving references..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-a6 "\def\papersize{a6paper}\input{main.tex}" > /dev/null || (cat main-a6.log && exit 1)
	@echo "Pass 6: Final compilation..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-a6 "\def\papersize{a6paper}\input{main.tex}" > /dev/null || (cat main-a6.log && exit 1)
	@echo "Book compiled successfully: main-a6.pdf"

# B5 paper version
pdf-b5: main-b5.pdf

main-b5.pdf: main.tex chapters/*.tex
	@echo "Building Deep Learning 101 (B5 paper)..."
	@echo "Pass 1: Initial compilation..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-b5 "\def\papersize{b5paper}\input{main.tex}" > /dev/null || (cat main-b5.log && exit 1)
	@echo "Pass 2: Processing bibliography..."
	@biber main-b5 > /dev/null || true
	@echo "Pass 3: Processing glossary..."
	@makeglossaries main-b5 > /dev/null || true
	@echo "Pass 4: Processing index..."
	@makeindex main-b5 > /dev/null || true
	@echo "Pass 5: Resolving references..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-b5 "\def\papersize{b5paper}\input{main.tex}" > /dev/null || (cat main-b5.log && exit 1)
	@echo "Pass 6: Final compilation..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-b5 "\def\papersize{b5paper}\input{main.tex}" > /dev/null || (cat main-b5.log && exit 1)
	@echo "Book compiled successfully: main-b5.pdf"

# Trade paper version (6"x9")
pdf-trade: main-trade.pdf

main-trade.pdf: main.tex chapters/*.tex
	@echo "Building Deep Learning 101 (6\"x9\" trade paper)..."
	@echo "Pass 1: Initial compilation..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-trade "\def\papersize{trade}\input{main.tex}" > /dev/null || (cat main-trade.log && exit 1)
	@echo "Pass 2: Processing bibliography..."
	@biber main-trade > /dev/null || true
	@echo "Pass 3: Processing glossary..."
	@makeglossaries main-trade > /dev/null || true
	@echo "Pass 4: Processing index..."
	@makeindex main-trade > /dev/null || true
	@echo "Pass 5: Resolving references..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-trade "\def\papersize{trade}\input{main.tex}" > /dev/null || (cat main-trade.log && exit 1)
	@echo "Pass 6: Final compilation..."
	@xelatex -interaction=nonstopmode -halt-on-error -jobname=main-trade "\def\papersize{trade}\input{main.tex}" > /dev/null || (cat main-trade.log && exit 1)
	@echo "Book compiled successfully: main-trade.pdf"

# Update glossary
glossary:
	@echo "Updating glossary..."
	@makeglossaries main-a4 > /dev/null || true
	@makeglossaries main-a5 > /dev/null || true
	@echo "Glossary updated successfully!"

# Update index
index:
	@echo "Updating index..."
	@makeindex main-a4 > /dev/null || true
	@makeindex main-a5 > /dev/null || true
	@echo "Index updated successfully!"

# Build all versions
all: clean pdf-a4 pdf-a5 pdf-letter pdf-a6 pdf-b5 pdf-trade
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
# Single-chapter builds: <size>-chapter-<n>
# Example: `make a4-chapter-1` or `make a4-chapter-01`
# Output: Deep-Learning101-PDF-Books/<size>/chapter-<NN>.pdf
# ----------------------------------------------------------------------

a4-chapter-%:
	@CHNUM=$$(printf "%02d" $*); \
	 echo "Building chapter $$CHNUM (A4 paper)..."; \
	 mkdir -p Deep-Learning101-PDF-Books/a4; \
	 echo "Pass 1: Initial compilation..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a4 "\def\papersize{a4paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a4.log && exit 1); \
	 echo "Pass 2: Processing bibliography..."; \
	 biber chapter-$$CHNUM-a4 > /dev/null || true; \
	 echo "Pass 3: Processing glossary..."; \
	 makeglossaries chapter-$$CHNUM-a4 > /dev/null || true; \
	 echo "Pass 4: Processing index..."; \
	 makeindex chapter-$$CHNUM-a4 > /dev/null || true; \
	 echo "Pass 5: Resolving references..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a4 "\def\papersize{a4paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a4.log && exit 1); \
	 echo "Pass 6: Final compilation..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a4 "\def\papersize{a4paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a4.log && exit 1); \
	 mv chapter-$$CHNUM-a4.pdf Deep-Learning101-PDF-Books/a4/chapter-$$CHNUM.pdf; \
	 echo "Chapter compiled successfully: Deep-Learning101-PDF-Books/a4/chapter-$$CHNUM.pdf"

a5-chapter-%:
	@CHNUM=$$(printf "%02d" $*); \
	 echo "Building chapter $$CHNUM (A5 paper)..."; \
	 mkdir -p Deep-Learning101-PDF-Books/a5; \
	 echo "Pass 1: Initial compilation..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a5 "\def\papersize{a5paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a5.log && exit 1); \
	 echo "Pass 2: Processing bibliography..."; \
	 biber chapter-$$CHNUM-a5 > /dev/null || true; \
	 echo "Pass 3: Processing glossary..."; \
	 makeglossaries chapter-$$CHNUM-a5 > /dev/null || true; \
	 echo "Pass 4: Processing index..."; \
	 makeindex chapter-$$CHNUM-a5 > /dev/null || true; \
	 echo "Pass 5: Resolving references..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a5 "\def\papersize{a5paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a5.log && exit 1); \
	 echo "Pass 6: Final compilation..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a5 "\def\papersize{a5paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a5.log && exit 1); \
	 mv chapter-$$CHNUM-a5.pdf Deep-Learning101-PDF-Books/a5/chapter-$$CHNUM.pdf; \
	 echo "Chapter compiled successfully: Deep-Learning101-PDF-Books/a5/chapter-$$CHNUM.pdf"

letter-chapter-%:
	@CHNUM=$$(printf "%02d" $*); \
	 echo "Building chapter $$CHNUM (US Letter paper)..."; \
	 mkdir -p Deep-Learning101-PDF-Books/letter; \
	 echo "Pass 1: Initial compilation..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-letter "\def\papersize{letterpaper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-letter.log && exit 1); \
	 echo "Pass 2: Processing bibliography..."; \
	 biber chapter-$$CHNUM-letter > /dev/null || true; \
	 echo "Pass 3: Processing glossary..."; \
	 makeglossaries chapter-$$CHNUM-letter > /dev/null || true; \
	 echo "Pass 4: Processing index..."; \
	 makeindex chapter-$$CHNUM-letter > /dev/null || true; \
	 echo "Pass 5: Resolving references..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-letter "\def\papersize{letterpaper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-letter.log && exit 1); \
	 echo "Pass 6: Final compilation..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-letter "\def\papersize{letterpaper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-letter.log && exit 1); \
	 mv chapter-$$CHNUM-letter.pdf Deep-Learning101-PDF-Books/letter/chapter-$$CHNUM.pdf; \
	 echo "Chapter compiled successfully: Deep-Learning101-PDF-Books/letter/chapter-$$CHNUM.pdf"

a6-chapter-%:
	@CHNUM=$$(printf "%02d" $*); \
	 echo "Building chapter $$CHNUM (A6 paper)..."; \
	 mkdir -p Deep-Learning101-PDF-Books/a6; \
	 echo "Pass 1: Initial compilation..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a6 "\def\papersize{a6paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a6.log && exit 1); \
	 echo "Pass 2: Processing bibliography..."; \
	 biber chapter-$$CHNUM-a6 > /dev/null || true; \
	 echo "Pass 3: Processing glossary..."; \
	 makeglossaries chapter-$$CHNUM-a6 > /dev/null || true; \
	 echo "Pass 4: Processing index..."; \
	 makeindex chapter-$$CHNUM-a6 > /dev/null || true; \
	 echo "Pass 5: Resolving references..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a6 "\def\papersize{a6paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a6.log && exit 1); \
	 echo "Pass 6: Final compilation..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-a6 "\def\papersize{a6paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-a6.log && exit 1); \
	 mv chapter-$$CHNUM-a6.pdf Deep-Learning101-PDF-Books/a6/chapter-$$CHNUM.pdf; \
	 echo "Chapter compiled successfully: Deep-Learning101-PDF-Books/a6/chapter-$$CHNUM.pdf"

b5-chapter-%:
	@CHNUM=$$(printf "%02d" $*); \
	 echo "Building chapter $$CHNUM (B5 paper)..."; \
	 mkdir -p Deep-Learning101-PDF-Books/b5; \
	 echo "Pass 1: Initial compilation..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-b5 "\def\papersize{b5paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-b5.log && exit 1); \
	 echo "Pass 2: Processing bibliography..."; \
	 biber chapter-$$CHNUM-b5 > /dev/null || true; \
	 echo "Pass 3: Processing glossary..."; \
	 makeglossaries chapter-$$CHNUM-b5 > /dev/null || true; \
	 echo "Pass 4: Processing index..."; \
	 makeindex chapter-$$CHNUM-b5 > /dev/null || true; \
	 echo "Pass 5: Resolving references..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-b5 "\def\papersize{b5paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-b5.log && exit 1); \
	 echo "Pass 6: Final compilation..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-b5 "\def\papersize{b5paper}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-b5.log && exit 1); \
	 mv chapter-$$CHNUM-b5.pdf Deep-Learning101-PDF-Books/b5/chapter-$$CHNUM.pdf; \
	 echo "Chapter compiled successfully: Deep-Learning101-PDF-Books/b5/chapter-$$CHNUM.pdf"

trade-chapter-%:
	@CHNUM=$$(printf "%02d" $*); \
	 echo "Building chapter $$CHNUM (6\"x9\" trade paper)..."; \
	 mkdir -p Deep-Learning101-PDF-Books/trade; \
	 echo "Pass 1: Initial compilation..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-trade "\def\papersize{trade}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-trade.log && exit 1); \
	 echo "Pass 2: Processing bibliography..."; \
	 biber chapter-$$CHNUM-trade > /dev/null || true; \
	 echo "Pass 3: Processing glossary..."; \
	 makeglossaries chapter-$$CHNUM-trade > /dev/null || true; \
	 echo "Pass 4: Processing index..."; \
	 makeindex chapter-$$CHNUM-trade > /dev/null || true; \
	 echo "Pass 5: Resolving references..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-trade "\def\papersize{trade}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-trade.log && exit 1); \
	 echo "Pass 6: Final compilation..."; \
	 xelatex -interaction=nonstopmode -halt-on-error -jobname=chapter-$$CHNUM-trade "\def\papersize{trade}\def\includelist{chapters/chap$$CHNUM}\input{main.tex}" > /dev/null || (cat chapter-$$CHNUM-trade.log && exit 1); \
	 mv chapter-$$CHNUM-trade.pdf Deep-Learning101-PDF-Books/trade/chapter-$$CHNUM.pdf; \
	 echo "Chapter compiled successfully: Deep-Learning101-PDF-Books/trade/chapter-$$CHNUM.pdf"

clean:
	rm -f *.aux *.log *.out *.toc *.bbl *.blg *.bcf *.run.xml *.synctex.gz
	rm -f *.idx *.ind *.ilg *.lot *.lof *.lol *.fdb_latexmk *.fls *.auxlock
	rm -f *.acn *.acr *.alg *.glg *.glo *.gls *.ist
	rm -f main.pdf main-a4.pdf main-a5.pdf main-letter.pdf main-a6.pdf main-b5.pdf main-trade.pdf
	rm -f main-a4.* main-a5.* main-letter.* main-a6.* main-b5.* main-trade.*
	rm -f chapters/*.aux
	@echo "Build artifacts cleaned"

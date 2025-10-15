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
	@echo "  make publish  - Copy A4 and A5 PDFs to Deep-Learning101-PDF-Books folder"
	@echo "  make glossary - Update the glossary"
	@echo "  make index    - Update the index"
	@echo "  make clean    - Remove build artifacts"

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
publish: pdf-a4 pdf-a5
	@echo "Publishing PDFs to Deep-Learning101-PDF-Books folder..."
	@mkdir -p Deep-Learning101-PDF-Books
	@cp main-a4.pdf Deep-Learning101-PDF-Books/Deep-Learning-101-A4.pdf
	@cp main-a5.pdf Deep-Learning101-PDF-Books/Deep-Learning-101-A5.pdf
	@echo "PDFs published successfully!"
	@echo "  - Deep-Learning101-PDF-Books/Deep-Learning-101-A4.pdf"
	@echo "  - Deep-Learning101-PDF-Books/Deep-Learning-101-A5.pdf"

clean:
	rm -f *.aux *.log *.out *.toc *.bbl *.blg *.bcf *.run.xml *.synctex.gz
	rm -f *.idx *.ind *.ilg *.lot *.lof *.lol *.fdb_latexmk *.fls *.auxlock
	rm -f *.acn *.acr *.alg *.glg *.glo *.gls *.ist
	rm -f main.pdf main-a4.pdf main-a5.pdf main-letter.pdf main-a6.pdf main-b5.pdf main-trade.pdf
	rm -f main-a4.* main-a5.* main-letter.* main-a6.* main-b5.* main-trade.*
	rm -f chapters/*.aux
	@echo "Build artifacts cleaned"

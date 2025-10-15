# Changelog

All notable changes to the Deep Learning 101 book will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Hands-On Exercises (Problems) for all chapters (minimum 4, maximum 10 per chapter)
  - Chapters 1-3: Created new problem files with 5-8 problems each
  - Chapters 6-10: Created new problem files with 8 problems each
  - Chapters 4-5: Reduced inline problems from 16 to 8 each
  - Chapters 11-20: Reduced problems from 16 to 8 each
- Chapter structure requirements in Copilot and Gemini instruction policies
  - Requirement for brief chapter introductions (1-2 paragraphs)
  - Requirement for 4-10 Hands-On Exercises per chapter
  - Problems organised by difficulty (Easy/Medium/Hard)
  - All problems include hints for students

### Changed
- Updated `.github/copilot-instructions.md` with new chapter structure requirements
- Updated `.github/instructions/gemini.instructions.md` with new chapter structure requirements
- All chapter problem files now use British English spelling (e.g., "optimise", "categorise")
- Problem format standardised across all chapters with consistent difficulty categorisation

### Technical Details
- **Version**: 1.0.1
- **Date**: 15 Oct 2025
- **Modified Files**: 
  - `.github/copilot-instructions.md`
  - `.github/instructions/gemini.instructions.md`
  - `chapters/chap01.tex`, `chap02.tex`, `chap03.tex` (added problem file inputs)
  - `chapters/chap04.tex`, `chap05.tex` (reduced inline problems from 16 to 8)
  - `chapters/chap06.tex` through `chap10.tex` (added problem file inputs)
  - `chapters/chap01-problems.tex` through `chap10-problems.tex` (created new files)
  - `chapters/chap11-problems.tex` through `chap20-problems.tex` (reduced from 16 to 8 problems)
- **Problem Count Summary**:
  - Total chapters with exercises: 20/20 (100%)
  - Chapters 1-10: 8 problems each (Easy: 4, Medium: 2, Hard: 2)
  - Chapters 11-20: 8 problems each (Easy: 4, Medium: 2, Hard: 2)
  - All within required range of 4-10 problems per chapter
- **LaTeX Environments**: Using `\begin{problem}[Title]...\end{problem}` with hints
- **Difficulty Levels**: Easy (conceptual understanding), Medium (application/derivation), Hard (advanced theory/proof)

## [2025-10-15] - Previous Changes

### Changed
- Updated all chapter colors to use standardised book color scheme
- Replaced hard-coded colors (blue, green, yellow, orange, gray) with bookpurple and bookred variants
- Updated neural network diagram colors in multiple chapters
- Updated plot colors across all chapters for consistency

## [2025-10-15]

### Added
- CHANGELOG.md file for tracking book changes
- Comprehensive changelog policy in copilot instructions

### Changed
- Updated copilot instructions to include changelog requirements

## [2025-10-15] - Color Theme Update

### Changed
- Standardised all colors throughout the book to use defined book color scheme:
  - Purple: RGB(60,16,83) - `bookpurple`
  - Red: RGB(242,18,12) - `bookred`
  - Black: RGB(0,0,0) - `bookblack`
  - White: RGB(255,255,255) - `bookwhite`
- Updated neural network diagram colors:
  - chap06-sec01.tex: Changed blue/green/red to bookpurple/bookred variants
  - chap07-sec04.tex: Updated dropout diagrams with book colors
- Updated plot colors:
  - chap06-sec02.tex: Activation function plots (sigmoid, tanh, ReLU, etc.)
  - chap11-sec01.tex: ROC curves, confusion matrix, loss functions
  - chap03-sec01.tex, chap03-sec03.tex: Probability distributions
  - chap04-sec01.tex, chap04-sec04.tex: Numerical computation plots
- Updated diagram colors:
  - chap07-sec02.tex: Data augmentation examples
  - chap08-sec04.tex: Optimisation diagrams (Newton's method, Natural gradient)
  - chap07-sec03.tex: Training/validation curves
  - chap09-sec01.tex: Convolutional kernel highlights
  - chap12-sec04.tex: Learning curves
- Replaced gray colors with bookpurple opacity variants for better consistency
- Replaced blue colors with bookpurple variants
- Replaced green colors with bookpurple variants
- Replaced red/yellow/orange colors with bookred variants

### Technical Details
- **Version**: 1.0.1
- **Author**: Deep Learning 101 Contributors
- **License**: Creative Commons License Version 4.0 (CC BY 4.0)
- **Source**: Modified 13+ chapter files in chapters/ directory
- **Destination**: PDF output (A4 and A5 formats)
- **Dependencies**: No new dependencies added
- **Instructions**: No changes to build process
- **Notes**: 
  - Only style/color changes, no content modifications
  - Text visibility maintained with new colors
  - All colors now use book color scheme defined in main.tex
- **References**: No bibliography changes
- **Acknowledgements**: No changes to acknowledgements
- **Glossary**: No changes to glossary
- **Index**: No changes to index
- **Table of Contents**: No structural changes
- **Bibliography**: No bibliography changes

## [2025-10-15] - Initial Setup

### Added
- Unicode and CJK support in main.tex
- Enhanced author information section
- Improved chapter structure and organisation

### Changed
- Updated LaTeX configuration for better international support
- Refined document metadata and formatting

### Technical Details
- **Version**: 1.0.0
- **Author**: Deep Learning 101 Contributors
- **License**: [License information to be specified]
- **Source**: LaTeX source files in chapters/ directory
- **Destination**: PDF output (A4 and A5 formats)
- **Dependencies**: 
  - pdflatex
  - biber (bibliography processing)
  - makeglossaries (glossary processing)
  - makeindex (index processing)
- **Instructions**: See CONTRIBUTING.md and .github/copilot-instructions.md
- **Notes**: Initial changelog entry following project setup
- **References**: See references.bib for bibliography
- **Acknowledgements**: See chapters/acknowledgements.tex
- **Glossary**: See chapters/glossary.tex for term definitions
- **Index**: Auto-generated during compilation
- **Table of Contents**: Auto-generated during compilation
- **Bibliography**: Processed from references.bib

---

## Changelog Guidelines

### When to Update
- Every significant change to the book content
- Structural changes to LaTeX files
- Updates to build process or dependencies
- New chapters or sections added
- Glossary or index modifications
- Bibliography updates

### Required Information for Each Entry
- **Date**: ISO format (YYYY-MM-DD)
- **Changes**: Clear description of what was modified
- **Version**: Semantic version number
- **Author**: Who made the changes
- **License**: Current license information
- **Source**: Files or directories modified
- **Destination**: Output files affected
- **Dependencies**: Any new or updated dependencies
- **Instructions**: Special build or usage instructions
- **Notes**: Additional context or important information
- **References**: Related bibliography entries
- **Acknowledgements**: Credits for contributions
- **Glossary**: New or modified glossary entries
- **Index**: New or modified index entries
- **Table of Contents**: Structural changes
- **Bibliography**: New or updated references

### Entry Format
```markdown
## [YYYY-MM-DD]

### Added/Changed/Fixed/Removed
- Brief description of change
- Additional details if needed

### Technical Details
- **Version**: X.Y.Z
- **Author**: Contributor name
- **License**: License information
- **Source**: Modified files
- **Destination**: Output files
- **Dependencies**: Updated dependencies
- **Instructions**: Special instructions
- **Notes**: Additional context
- **References**: Related bibliography
- **Acknowledgements**: Credits
- **Glossary**: Glossary changes
- **Index**: Index changes
- **Table of Contents**: TOC changes
- **Bibliography**: Bibliography changes
```

### Categories
- **Added**: New features, chapters, sections, or content
- **Changed**: Modifications to existing content or structure
- **Fixed**: Bug fixes or corrections
- **Removed**: Deleted content or features
- **Security**: Security-related changes
- **Deprecated**: Features marked for removal

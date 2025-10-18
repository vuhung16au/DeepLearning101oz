# Changelog

All notable changes to the Deep Learning 101 book will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed
- Updated Requirements section in README.md to reflect current build system
  - Replaced `pdflatex` with `LuaLaTeX` as the default engine
  - Updated description to reflect LuaLaTeX as the primary engine with native Unicode support
  - Simplified CJK support description to "automatically configured" since main.tex has comprehensive engine detection
- Updated difficulty indicators from text-based to emoji-based visual indicators
  - Beginner sections now display 💫 emoji instead of [Beginner] text
  - Intermediate sections now display ⭐️ emoji instead of [Intermediate] text
  - Advanced sections now display 🌟 emoji instead of [Advanced] text
  - Refactored `\difficulty{}` LaTeX command to use separate emoji commands for maintainability
  - Emoji indicators appear automatically next to section titles (e.g., "7.1 Parameter Norm Penalties ⭐️")
- Updated all documentation files to reflect new emoji-based difficulty system
  - README.md: Added new "Difficulty Level Indicators" section with detailed explanation
  - CONTRIBUTING.md: Updated difficulty level guidelines and usage examples
  - .github/copilot-instructions.md: Updated with emoji mappings and implementation notes
  - .github/instructions/gemini.instructions.md: Updated difficulty level sections with emojis

### Technical Details
- **Version**: 1.2.1 (Requirements Update)
- **Author**: AI Assistant
- **Date**: 17 Oct 2025
- **License**: CC BY 4.0
- **Source**: `README.md` (Requirements section)
- **Destination**: Updated documentation for build requirements
- **Dependencies**: No changes to actual dependencies; documentation update only
- **Instructions**: No changes to build process; existing `make pdf` commands work unchanged
- **Notes**: 
  - Documentation now accurately reflects that LuaLaTeX is the default engine (not pdflatex)
  - Makefile clearly shows `LATEX ?= lualatex` as the default
  - Unicode and CJK support is automatically configured through engine detection in main.tex
  - Users now have correct information about what they need to build the book
- **References**: No bibliography changes required
- **Acknowledgements**: No changes to acknowledgements
- **Glossary**: No glossary changes required
- **Index**: No index changes required
- **Table of Contents**: No structural changes
- **Bibliography**: No bibliography changes required

### Technical Details (Previous - Emoji Difficulty Indicators)
- **Version**: 1.2.0 (Emoji Difficulty Indicators)
- **Author**: GitHub Copilot
- **Date**: 17 Oct 2025
- **License**: CC BY 4.0
- **Source**: `main.tex` (lines 162-183), `README.md`, `CONTRIBUTING.md`, `.github/copilot-instructions.md`, `.github/instructions/gemini.instructions.md`
- **Destination**: All 137 difficulty indicators across 20 chapters automatically updated
- **Dependencies**: No new dependencies required; uses native Unicode emoji support in XeLaTeX/LuaLaTeX
- **Instructions**: No changes to build process; existing `make pdf` commands work unchanged
- **Notes**: 
  - Implemented as reusable commands: `\difficultyBeginner`, `\difficultyIntermediate`, `\difficultyAdvanced`
  - No changes required to individual chapter files; all work automatically
  - Cleaner, more maintainable code structure than previous text-based label system
- **References**: Issue requested emoji indicators for better visual accessibility
- **Acknowledgements**: Original issue provided clear examples and requirements
- **Glossary**: No glossary changes required
- **Index**: No index changes required
- **Table of Contents**: Section titles now display with emoji indicators
- **Bibliography**: No bibliography changes required

## [Previous - Problem Numbering Instructions]

### Changed
- Updated GitHub Copilot instruction policies with clear problem numbering guidance
  - Added explicit documentation that problems are automatically numbered by LaTeX
  - Clarified that problem numbering format is "Problem X.Y" (X = chapter, Y = sequential)
  - Documented that problem counter is shared with theorems, definitions, and examples
  - Added hint formatting requirement using `\textbf{Hint:}` style
- Updated Gemini instruction policies with clear problem numbering guidance
  - Added theorem-like environments section explaining shared counter system
  - Included comprehensive problem environment pattern with full example
  - Documented automatic numbering system for problems within chapters
  - Clarified problem organisation by difficulty level (Easy/Medium/Hard subsections)

### Technical Details
- **Version**: 1.1.2 (Problem Numbering Instructions)
- **Author**: GitHub Copilot
- **Date**: 16 Oct 2025
- **License**: CC BY 4.0
- **Source**: `.github/copilot-instructions.md`, `.github/instructions/gemini.instructions.md`
- **Dependencies**: No changes to LaTeX dependencies
- **Instructions**: No build process changes required
- **Notes**: These changes only affect instruction files for AI assistants; no changes to book content or LaTeX code
- **References**: Related to problem environment defined in main.tex line 148
- **Acknowledgements**: Issue requested clearer problem numbering policies
- **Documentation**: Enhanced instruction clarity for both Copilot and Gemini assistants

## [Unreleased - Previous Changes]

### Added
- Enhanced Preface section in main.tex with four new key points:
  - Personal motivation: Started as study notes due to lack of suitable books
  - Book nature: Compressed version covering essential concepts and formulae
  - Prerequisites: Assumes fair understanding of maths, algorithms, and programming
  - Target audience: Those wanting to learn deep learning basics with focus on mathematics
- Paper margin policy in Copilot and Gemini instruction files
  - Defined standardised margin specifications for A4 paper (top: 2cm, bottom: 2cm, inner: 1.8cm, outer: 1.5cm)
  - Defined standardised margin specifications for A5 paper (left: 1.8cm, right: 1.5cm, top: 2cm, bottom: 2cm)
  - Added LaTeX implementation guidance using geometry package with `\papersize` custom command
  - Included important notes about inner/outer margins for two-sided printing
  - Policy ensures AI assistants maintain consistent margin settings
  - Added clarification that `\papersize` is a custom command allowing dynamic paper size selection
- LaTeX boxed styling for Summary and Key Takeaways sections using tcolorbox package
- Custom `summary` environment with pink title box, drop shadow, and auto-numbering
- Custom `keytakeaways` environment with yellow title box, drop shadow, and auto-numbering
- Key takeaways files for chapters 1-10 (chap01-key-takeaways.tex through chap10-key-takeaways.tex)
- Requirements in Copilot instruction policies for boxed summaries and takeaways
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
- Converted all existing key-takeaways files (chapters 11-20) to use boxed keytakeaways environment
- Updated chapter 8 section 6 (chap08-sec06.tex) to use keytakeaways environment
- Updated all chapter files (chap01.tex through chap10.tex) to include key-takeaways before problems
- Applied British English spelling throughout all new and modified content (optimisation, normalisation, etc.)
- Updated `.github/copilot-instructions.md` with boxed summary and takeaways requirements
- Updated `.github/instructions/gemini.instructions.md` with boxed summary and takeaways requirements
- All chapter problem files now use British English spelling (e.g., "optimise", "categorise")
- Problem format standardised across all chapters with consistent difficulty categorisation

### Technical Details
- **Version**: 1.1.1 (Improved Preface)
- **Date**: 15 Oct 2025
- **Modified Files**: 
  - `main.tex` (enhanced Preface section with four new paragraphs)
  - `CHANGELOG.md` (documented the changes)
- **Changes to Preface**:
  - Added personal motivation paragraph explaining book's origin
  - Added description of book as "compressed version" with essential concepts
  - Added prerequisites clarification (maths, algorithms, programming)
  - Added target audience definition (deep learning basics with maths focus)
- **Language**: British English maintained throughout (e.g., "realised", "formulae")
- **Formatting**: Maintained existing LaTeX formatting with \\[0.5em] spacing
- **Dependencies**: No new dependencies required
- **Build Process**: Standard `make pdf` workflow remains unchanged
- **Notes**: Addresses GitHub issue requesting improved Preface section with four specific points
- **Previous Version**: 1.1.0 (Boxed Summaries) / 1.0.1 (Problems)
- **Date**: 15 Oct 2025
- **Modified Files**: 
  - `main.tex` (added tcolorbox package and custom environments)
  - `.github/copilot-instructions.md` (added boxed summary/takeaways requirements)
  - `.github/instructions/gemini.instructions.md` (added boxed summary/takeaways requirements)
  - `chapters/chap01.tex` through `chap10.tex` (added key-takeaways file inputs)
  - `chapters/chap01-key-takeaways.tex` through `chap10-key-takeaways.tex` (created new files)
  - `chapters/chap08-sec06.tex` (converted to use keytakeaways environment)
  - `chapters/chap11-key-takeaways.tex` through `chap20-key-takeaways.tex` (converted to boxed format)
- **Key Takeaways Summary**:
  - Total chapters with key takeaways: 20/20 (100%)
  - All use boxed `keytakeaways` environment with tcolorbox
  - Styling: Yellow title box, drop shadow, auto-numbering
  - Chapter 8 uses chap08-sec06.tex (kept as section due to chapter structure)
- **Dependencies**: Added tcolorbox package with [most] option to main.tex
- **Build Process**: No changes required; standard `make pdf` workflow
- **LaTeX Environments**: 
  - `\begin{summary}...\end{summary}` (pink title box)
  - `\begin{keytakeaways}...\end{keytakeaways}` (yellow title box)
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

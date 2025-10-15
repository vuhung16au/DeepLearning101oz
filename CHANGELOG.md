# Changelog

All notable changes to the Deep Learning 101 book will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- CHANGELOG.md file for tracking book changes
- Comprehensive changelog policy in copilot instructions

### Changed
- Updated copilot instructions to include changelog requirements

## [2025-10-15]

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

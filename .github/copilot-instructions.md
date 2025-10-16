# GitHub Copilot Instructions for Deep Learning 101

## Project Overview
This is a comprehensive LaTeX book on Deep Learning with advanced features including glossary, index, and difficulty levels. The book is structured as a complete educational resource with 20 chapters covering fundamentals to advanced research topics.

## Language and Locale Policies

### Language Style
- **Use British English** for all content, comments, and documentation (not American English)
- Examples of British English spelling:
  - Use "colour" not "color"
  - Use "optimise" not "optimize"
  - Use "behaviour" not "behavior"
  - Use "centre" not "center"
  - Use "analyse" not "analyze"

### Locale and Date Formatting
- **Locale**: Use `en-GB` as the standard locale
- **Date Format**: Use English date format: `14 Oct 2025` (day-month-year with abbreviated month)
- **LaTeX Configuration**: The document uses `\usepackage[en-GB]{datetime2}` and `\DTMsetstyle{en-GB}` for consistent date formatting

## Paper Margin Policy

The book uses standardised margins for both A4 and A5 paper sizes to ensure optimal readability and binding:

### A4 Paper Margins
- **Top margin**: 2cm (good for headers)
- **Bottom margin**: 2cm (good for footers)
- **Inner margin**: 1.8cm (left margin for binding)
- **Outer margin**: 1.5cm (right margin)

### A5 Paper Margins
- **Left margin**: 1.8cm (inner margin for binding)
- **Right margin**: 1.5cm (outer margin)
- **Top margin**: 2cm (space for headers)
- **Bottom margin**: 2cm (space for footers)

### LaTeX Implementation
The margins are configured using the geometry package in `main.tex`:
```latex
% \papersize is a custom command defined earlier: \providecommand{\papersize}{a5paper}
% It allows dynamic paper size selection (a4paper or a5paper)
\usepackage[\papersize, top=2cm, bottom=2cm, inner=1.8cm, outer=1.5cm]{geometry}
```

### Important Notes
- The same margin values are used for both A4 and A5 papers
- `inner` margin refers to the binding edge (left on odd pages, right on even pages)
- `outer` margin refers to the outer edge (right on odd pages, left on even pages)
- These margins are optimised for two-sided printing with `twoside` document class option
- Do not modify margin settings without explicit authorisation as they affect print quality and binding

## Key Features to Maintain

### 1. Glossary and Index System
- **Glossary**: Technical terms are defined in `chapters/glossary.tex`
- **Usage**: Use `\gls{term}` for first occurrence of glossary terms
- **Index**: Use `\index{term}` or `\index{term!subterm}` for hierarchical indexing
- **Build Process**: Glossary and index are automatically processed during compilation

### 2. Difficulty Levels
- **Command**: Always use `\difficulty{level}` for sections
- **Levels**: 
  - `beginner` - Basic concepts, intuitive explanations
  - `intermediate` - Technical details, some background assumed  
  - `advanced` - Cutting-edge research, complex mathematics
- **Visual**: Color-coded indicators (green/orange/red)

### 3. LaTeX Structure
- **Main File**: `main.tex` contains document structure and packages
- **Chapters**: Each chapter in `chapters/chapXX.tex` includes sections
- **Sections**: Individual sections in `chapters/chapXX-secYY.tex`
- **Build**: Use `make clean && make pdf` for compilation

## Coding Guidelines

### LaTeX Best Practices
1. **Package Usage**: Use established packages (amsmath, hyperref, glossaries, makeidx)
2. **Cross-references**: Use `\label{}` and `\ref{}` for internal references
3. **Math**: Use proper mathematical notation with `\vect{}`, `\mat{}`, `\norm{}`
4. **Theorems**: Use defined environments (theorem, definition, example, etc.)

### Content Structure
```latex
\section{Section Title}
\label{sec:section-name}
\difficulty{beginner|intermediate|advanced}

% Content with glossary entries
\gls{neural-network} and \gls{backpropagation} are key concepts.

% Index entries
\index{deep learning!concepts}
\index{machine learning!neural networks}
```

### Glossary Entries
- Add new terms to `chapters/glossary.tex`
- Use clear, accessible definitions
- Match difficulty level of content
- Include mathematical notation when appropriate

### Index Entries
- Use hierarchical structure: `\index{main!subcategory}`
- Include both technical terms and conceptual topics
- Add entries throughout content, not just at section ends

## File Organization

### Core Files
- `main.tex` - Main document with packages and structure
- `Makefile` - Build automation with 6-pass compilation
- `references.bib` - Bibliography database
- `chapters/glossary.tex` - Glossary definitions

### Chapter Structure
- `chapters/chapXX.tex` - Chapter files that include sections
- `chapters/chapXX-secYY.tex` - Individual section files
- `chapters/acknowledgements.tex` - Front matter
- `chapters/notation.tex` - Mathematical notation guide

## Build Process

### Compilation Steps
1. Initial LaTeX compilation
2. Bibliography processing (biber)
3. Glossary processing (makeglossaries)
4. Index processing (makeindex)
5. Reference resolution
6. Final compilation

### Dependencies
- pdflatex
- biber (bibliography)
- makeglossaries (glossary)
- makeindex (index)

## Content Guidelines

### Writing Style
- Use clear, accessible language appropriate for difficulty level
- Provide intuitive explanations before mathematical details
- Include practical examples and applications
- Maintain consistent notation throughout

### Chapter Structure Requirements
- **Each chapter must have a brief introduction at the start**: A 1-2 paragraph overview that introduces the chapter's topic and provides context
- **Each chapter must have 15-20 Hands-On Exercises**: Practical problems categorised by difficulty (Easy/Medium/Hard) to reinforce learning
  - Use `\begin{problem}[Title]...\end{problem}` environment
  - Problems are automatically numbered as "Problem X.Y" where X is the chapter number and Y is the sequential problem number
  - Problem numbering uses the shared theorem counter, maintaining consistency with other numbered environments (theorems, definitions, examples)
  - Each problem must have a descriptive title in square brackets: `\begin{problem}[Descriptive Title]`
  - Include hints for each problem using `\textbf{Hint:}` format
  - Organise by difficulty level in subsections (Easy/Medium/Hard)
- **Each chapter must have a Key Takeaways section**: Use the boxed `keytakeaways` environment
  - Create a file named `chapters/chapXX-key-takeaways.tex`
  - Use `\begin{keytakeaways}...\end{keytakeaways}` with itemised key points
  - Include this file at the end of the chapter before problems
- **Summaries should use boxed format when present**: Use the `summary` environment
  - Use `\begin{summary}...\end{summary}` for chapter or section summaries
  - Both environments use tcolorbox for enhanced visual presentation

### Deep Learning Chapters Requirements
- **All deep learning chapters (6-20) must include a "Real World Applications" section**
- This section should:
  - Provide at least 3 concrete, practical examples
  - Focus on less technical, easy-to-understand explanations
  - Show how techniques solve real-world problems
  - Include proper index entries for applications

### Mathematical Content
- Provide step-by-step derivations for complex concepts
- Use appropriate mathematical notation
- Include visual aids (explanatory diagrams, plots, etc.) when helpful
- Ensure mathematical accuracy

### Code Examples
- Include practical, runnable code examples
- Use clear, well-commented code
- Provide expected outputs and explanations
- Match difficulty level of surrounding content

### Problem Numbering and Format
- **Numbering System**: Problems use automatic numbering via the LaTeX `\newtheorem{problem}[theorem]{Problem}` environment
  - Problems are numbered as "Problem X.Y" where X is the chapter number and Y is the sequential number
  - The problem counter is shared with theorems, definitions, examples, and other theorem-like environments
  - This ensures consistent cross-referencing throughout the book
- **Problem Structure**:
  ```latex
  \begin{problem}[Descriptive Title]
  Problem statement goes here. Provide clear instructions and context.
  
  \textbf{Hint:} Provide a helpful hint to guide problem-solving.
  \end{problem}
  ```
- **Difficulty Organisation**:
  - Problems are grouped under `\subsection*{Easy}`, `\subsection*{Medium}`, and `\subsection*{Hard}` headings
  - Use unnumbered subsections (with asterisk) to avoid subsection numbering
  - Distribute problems appropriately across difficulty levels
- **Problem Titles**: Each problem must have a concise, descriptive title in square brackets that summarises the problem topic

## Common Tasks

### Adding New Content
1. Create section file in appropriate chapter directory
2. Add difficulty level indicator
3. Include glossary entries for technical terms
4. Add relevant index entries
5. Update chapter file to include new section
6. Test compilation with `make clean && make pdf`

### Updating Glossary
1. Add new terms to `chapters/glossary.tex`
2. Use `\gls{term}` in content for first occurrence
3. Ensure definitions match content difficulty level
4. Test compilation to verify glossary processing

### Adding Index Entries
1. Use `\index{term}` throughout content
2. Use hierarchical structure for related concepts
3. Include both technical and conceptual topics
4. Test compilation to verify index generation

### Creating Problem Sets
1. Create a problems file: `chapters/chapXX-problems.tex`
2. Start with the section header:
   ```latex
   % Problems (Hands-On Exercises) for Chapter X: Chapter Title
   
   \section*{Problems}
   \addcontentsline{toc}{section}{Problems}
   ```
3. Organise problems by difficulty level using unnumbered subsections:
   ```latex
   \subsection*{Easy}
   
   \begin{problem}[Problem Title]
   Problem statement with clear instructions.
   
   \textbf{Hint:} Helpful hint for solving the problem.
   \end{problem}
   ```
4. Include problems for each difficulty level (Easy, Medium, Hard)
5. Aim for 15-20 problems per chapter, distributed across difficulty levels
6. Include the problems file in the chapter file: `\input{chapters/chapXX-problems}`
7. Test compilation to verify problem numbering is correct

## Changelog Management

### CHANGELOG.md Requirements
- **Mandatory**: Every significant change must be documented in `CHANGELOG.md`
- **Format**: Follow the established format with date, changes, and technical details
- **Categories**: Use Added/Changed/Fixed/Removed for categorising changes
- **Technical Details**: Include version, author, license, source, destination, dependencies, instructions, notes, references, acknowledgements, glossary, index, table of contents, and bibliography information

### When to Update CHANGELOG.md
- Every content change (chapters, sections, glossary, index)
- Structural changes to LaTeX files
- Build process modifications
- New dependencies or package updates
- Bibliography or reference updates
- Cross-reference or label changes

### Changelog Entry Format
```markdown
## [YYYY-MM-DD]

### Added/Changed/Fixed/Removed
- Brief description of change

### Technical Details
- **Version**: X.Y.Z
- **Author**: Contributor name
- **License**: License information
- **Source**: Modified files
- **Destination**: Output files affected
- **Dependencies**: Updated dependencies
- **Instructions**: Special build instructions
- **Notes**: Additional context
- **References**: Related bibliography entries
- **Acknowledgements**: Credits for contributions
- **Glossary**: New or modified glossary entries
- **Index**: New or modified index entries
- **Table of Contents**: Structural changes
- **Bibliography**: New or updated references
```

## Quality Assurance

### Before Committing
- Ensure `make clean && make pdf` completes successfully
- Verify all glossary entries are properly defined
- Check that index entries are meaningful and hierarchical
- Confirm difficulty levels are appropriate for content
- Test that all cross-references work correctly
- **Update CHANGELOG.md with all changes made**

### Content Review
- Technical accuracy of mathematical content
- Appropriateness of difficulty level indicators
- Clarity and accessibility of explanations
- Consistency with book style and notation
- Proper integration of glossary and index entries

## Troubleshooting

### Common Issues
- **Glossary not appearing**: Check `\loadglsentries{chapters/glossary}` in main.tex
- **Index not generating**: Verify `\makeindex` and `\printindex` commands
- **Build failures**: Check all required packages are installed
- **Cross-reference errors**: Ensure all labels are unique and properly referenced

### Build Verification
```bash
make clean
make pdf
# Should complete without errors and generate main.pdf
```

## Contributing Guidelines

### For Contributors
- Follow difficulty level guidelines in `CONTRIBUTING.md`
- Use appropriate `\difficulty{}` indicators
- Add glossary entries for technical terms
- Include relevant index entries
- Test compilation before submitting
- **Update CHANGELOG.md for all changes made**

### For Reviewers
- Verify technical accuracy
- Check difficulty level appropriateness
- Ensure proper glossary and index usage
- Test build process
- Validate cross-references
- **Verify CHANGELOG.md entries are complete and accurate**

This instruction set ensures consistent, high-quality contributions to the Deep Learning 101 book while maintaining the advanced features of glossary, index, and difficulty levels.

# Gemini Instructions for Deep Learning 101


## Project Context
Deep Learning 101 is a comprehensive LaTeX educational book with advanced features including automated glossary, subject index, and difficulty level indicators. The project uses a sophisticated build system with multiple compilation passes.

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

### Units of Measurement
- **Use metric units** for all measurements in examples and content (not imperial units)
- **Length/Height**: Use centimetres (cm) or metres (m), not feet or inches
  - Example: "170 cm, 170.5 cm, 170.52 cm" not "5.7 feet, 5.73 feet, 5.732 feet"
- **Temperature**: Use degrees Celsius (°C), not Fahrenheit (°F)
  - Example: "22.3°C, 22.34°C, 22.341°C" not "72.3°F, 72.34°F, 72.341°F"
- **Weight/Mass**: Use kilograms (kg) or grams (g), not pounds or ounces
- **Exception**: Metaphorical or idiomatic uses of imperial terms (e.g., "feel the slope under your feet") are acceptable as they are not measurements

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

## Core Architecture

### Document Structure
- **Main Document**: `main.tex` - Central file with packages, commands, and document structure
- **Chapter Organization**: Modular structure with `chapters/chapXX.tex` including `chapters/chapXX-secYY.tex`
- **Glossary System**: `chapters/glossary.tex` with technical term definitions
- **Build System**: `Makefile` with 6-pass compilation process

### Advanced Features
1. **Glossary Integration**: Automatic cross-referencing with `\gls{term}` command
2. **Index Generation**: Hierarchical indexing with `\index{term!subterm}` syntax
3. **Difficulty Levels**: Emoji indicators inline with headings using `\\difficultyInline{beginner|intermediate|advanced}` (💫 Beginner, ⭐ Intermediate, 🌟 Advanced)
4. **Mathematical Notation**: Custom commands for vectors, matrices, norms

## LaTeX Package Dependencies

### Essential Packages
```latex
\usepackage{makeidx}           % Index generation
\usepackage{glossaries}        % Glossary system
\usepackage{amsmath,amssymb}   % Mathematics
\usepackage{hyperref}          % Cross-references
\usepackage{xcolor}            % Color support for difficulty levels
```

### Theorem-Like Environments
The book uses LaTeX's `\newtheorem` command to define numbered environments:
- All theorem-like environments share the same counter per chapter
- Definition: `\newtheorem{problem}[theorem]{Problem}`
- Numbering format: "Environment X.Y" (X = chapter, Y = sequential number)
- Environments include: theorem, lemma, proposition, corollary, definition, example, problem, remark, algorithm

### Build Dependencies
- `pdflatex` - Primary LaTeX compiler
- `biber` - Bibliography processing
- `makeglossaries` - Glossary processing
- `makeindex` - Index processing

## Content Development Guidelines

### Difficulty Level Implementation
```latex
\section{Section Title \difficultyInline{beginner}} % or intermediate, advanced
\label{sec:section-name}

% Content with appropriate complexity
```

The `\difficulty{}` command automatically appends the appropriate emoji indicator to the section title:
- `beginner` → 💫 (Basic concepts, intuitive explanations)
- `intermediate` → ⭐️ (Technical details, some background assumed)
- `advanced` → 🌟 (Cutting-edge research, complex mathematics)

### Glossary Usage Pattern
```latex
% First occurrence of technical terms
The \gls{neural-network} uses \gls{backpropagation} for training.

% Subsequent occurrences
Neural networks can be trained using various optimization methods.
```

### Index Entry Patterns
```latex
% Hierarchical indexing
\index{deep learning!introduction}
\index{machine learning!neural networks}
\index{optimization!gradient descent}
\index{applications!computer vision}
```

## Build Process Understanding

### 6-Pass Compilation
1. **Initial Compilation**: Basic LaTeX processing
2. **Bibliography**: Biber processes references
3. **Glossary**: Makeglossaries processes glossary entries
4. **Index**: Makeindex processes index entries
5. **Reference Resolution**: Cross-references and citations
6. **Final Compilation**: Complete document generation

### Build Commands
```bash
make clean    # Remove all build artifacts
make pdf      # Complete compilation process
```

## Content Quality Standards

### Mathematical Content
- Use proper mathematical notation with custom commands
- Provide intuitive explanations before mathematical derivations
- Include step-by-step derivations for complex concepts
- Ensure mathematical accuracy and consistency

### Technical Writing
- Match content complexity to difficulty level
- Use clear, accessible language for target audience
- Include practical examples and applications
- Maintain consistent terminology throughout

### Chapter Structure Requirements
- **Each chapter must have a brief introduction at the start**: A 1-2 paragraph overview that introduces the chapter's topic and provides context
- **Each chapter must have 15-20 Hands-On Exercises**: Practical problems categorised by difficulty (Easy/Medium/Hard) to reinforce learning
  - Use `\begin{problem}[Title]...\end{problem}` environment
  - Problems are automatically numbered by LaTeX (e.g., Problem 2.1, Problem 2.2)
  - The numbering is shared with theorems, definitions, and examples within each chapter
  - Include hints for each problem using `\textbf{Hint:}` formatting
  - Organise by difficulty level in subsections (Easy, Medium, Hard)
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
  - Use inline beginner marker in its heading: `\difficultyInline{beginner}`
  - Provide at least 3 concrete, practical examples
  - Focus on less technical, easy-to-understand explanations
  - Show how techniques solve real-world problems
  - Include proper index entries for applications

### Cross-Reference Management
- Use descriptive labels: `\label{sec:neural-networks}`
- Create meaningful references: `\ref{sec:neural-networks}`
- Ensure all references resolve correctly
- Test compilation to verify reference integrity

## File Organization Patterns

### Chapter Structure
```
chapters/
├── chap01.tex              # Chapter file
├── chap01-sec01.tex        # Section files
├── chap01-sec02.tex
├── glossary.tex           # Glossary definitions
├── acknowledgements.tex   # Front matter
└── notation.tex           # Mathematical notation
```

### Content Integration
- Each chapter file includes multiple sections
- Sections contain difficulty indicators and content
- Glossary entries are defined once, used throughout
- Index entries are distributed throughout content

## Development Workflow

### Adding New Content
1. **Create Section File**: `chapters/chapXX-secYY.tex`
2. **Add Difficulty Level**: `\difficulty{appropriate-level}`
3. **Include Glossary Entries**: Use `\gls{term}` for technical terms
4. **Add Index Entries**: Use `\index{term}` throughout content
5. **Update Chapter File**: Include new section in chapter
6. **Test Compilation**: Verify `make clean && make pdf` works

### Glossary Management
1. **Define Terms**: Add to `chapters/glossary.tex`
2. **Use in Content**: First occurrence with `\gls{term}`
3. **Match Difficulty**: Ensure definitions match content level
4. **Test Integration**: Verify glossary appears in final PDF

### Index Development
1. **Add Entries**: Use `\index{term}` throughout content
2. **Hierarchical Structure**: Use `\index{main!subcategory}`
3. **Comprehensive Coverage**: Include technical and conceptual topics
4. **Test Generation**: Verify index appears in final PDF

## Quality Assurance

### Pre-Commit Checklist
- [ ] All glossary terms properly defined
- [ ] Index entries are meaningful and hierarchical
- [ ] Difficulty levels appropriate for content
- [ ] Cross-references resolve correctly
- [ ] Build process completes successfully
- [ ] Mathematical notation is consistent
- [ ] Content matches target difficulty level

### Testing Protocol
```bash
# Clean build environment
make clean

# Full compilation test
make pdf

# Verify output
ls -la main.pdf
```

## Common Patterns

### Section Template
```latex
% Chapter X, Section Y: Title
\section{Section Title \difficultyInline{beginner|intermediate|advanced}}
\label{sec:section-name}

% Introduction with glossary entries
The \gls{technical-term} is a fundamental concept...

% Main content with index entries
\index{main topic!subtopic}

% Examples and applications
\subsection{Examples}
% Content with appropriate difficulty level

% Index entries for section
\index{topic!examples}
```

### Glossary Entry Template
```latex
\newglossaryentry{term-name}{
    name={Display Name},
    description={Clear, accessible definition appropriate for difficulty level.}
}
```

### Index Entry Patterns
```latex
\index{deep learning!introduction}
\index{machine learning!neural networks}
\index{optimization!gradient descent}
\index{applications!computer vision}
\index{mathematics!linear algebra}
```

### Problem Environment Pattern
```latex
% Problems file: chapters/chapXX-problems.tex
\section*{Problems}
\addcontentsline{toc}{section}{Problems}

\subsection*{Easy}

\begin{problem}[Problem Title]
Problem statement or question goes here.

\textbf{Hint:} Helpful guidance for solving the problem.
\end{problem}

\begin{problem}[Another Problem]
Second problem statement.

\textbf{Hint:} Another hint.
\end{problem}

\subsection*{Medium}

\begin{problem}[Intermediate Problem]
More challenging problem statement.

\textbf{Hint:} Hint for intermediate problem.
\end{problem}

\subsection*{Hard}

\begin{problem}[Advanced Problem]
Most challenging problem statement.

\textbf{Hint:} Hint for advanced problem.
\end{problem}

% Note: Problems are automatically numbered as Problem X.1, X.2, X.3, etc.
% where X is the chapter number. The counter is shared with theorems,
% definitions, and examples within the chapter.
```

## Troubleshooting Guide

### Build Issues
- **Glossary not appearing**: Check `\loadglsentries{chapters/glossary}`
- **Index not generating**: Verify `\makeindex` and `\printindex`
- **Compilation errors**: Check package dependencies
- **Cross-reference failures**: Ensure unique labels

### Content Issues
- **Difficulty mismatch**: Review content complexity vs. indicator
- **Missing glossary entries**: Add terms to glossary.tex
- **Incomplete index**: Add relevant index entries
- **Mathematical errors**: Verify notation and derivations

## Contributing Guidelines

### For Content Contributors
- Follow difficulty level guidelines strictly
- Use appropriate `\difficulty{}` indicators
- Add glossary entries for all technical terms
- Include comprehensive index entries
- Test compilation before submitting

### For Technical Reviewers
- Verify mathematical accuracy
- Check difficulty level appropriateness
- Ensure proper glossary and index usage
- Validate build process
- Test all cross-references

This instruction set provides comprehensive guidance for maintaining the advanced features of the Deep Learning 101 book while ensuring consistent, high-quality contributions.

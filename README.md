# Deep Learning 101

**Author:** Vũ Hưng Nguyễn (阮武興)  
**License:** Creative Commons Attribution 4.0 International (CC BY 4.0)  
**Version:** 1.0.0  
**Language:** British English (en-GB)

## Overview

This book provides a comprehensive introduction to deep learning, covering fundamental mathematics, practical techniques, and advanced research topics. The book features enhanced international support with Unicode and CJK character support, making it accessible to a global audience.

## Book Structure

The book is organized into three main parts:

### Part I: Basic Math and Machine Learning Foundation
- Chapter 1: Introduction
- Chapter 2: Linear Algebra
- Chapter 3: Probability and Information Theory
- Chapter 4: Numerical Computation
- Chapter 5: Classical Machine Learning Algorithms

### Part II: Practical Deep Networks
- Chapter 6: Deep Feedforward Networks
- Chapter 7: Regularization for Deep Learning
- Chapter 8: Optimization for Training Deep Models
- Chapter 9: Convolutional Networks
- Chapter 10: Sequence Modeling: Recurrent and Recursive Nets
- Chapter 11: Practical Methodology
- Chapter 12: Applications

### Part III: Deep Learning Research
- Chapter 13: Linear Factor Models
- Chapter 14: Autoencoders
- Chapter 15: Representation Learning
- Chapter 16: Structured Probabilistic Models for Deep Learning
- Chapter 17: Monte Carlo Methods
- Chapter 18: Confronting the Partition Function
- Chapter 19: Approximate Inference
- Chapter 20: Deep Generative Models

## Building the Book

The book supports multiple paper sizes with enhanced build automation:

### Quick Build Commands

```bash
# Build A5 version (default)
make pdf

# Build A4 version
make pdf-a4

# Build A5 version (explicit)
make pdf-a5

# Build all versions (A4, A5, Letter, A6, B5, Trade 6"x9")
make all

# Clean build artifacts
make clean

# Publish PDFs to distribution folder
make publish
```

### Additional Paper Sizes and Targets

Supported paper sizes and their dedicated targets:

```bash
# US Letter
make pdf-letter

# A6
make pdf-a6

# B5
make pdf-b5

# Trade (6"x9")
make pdf-trade
```

Each target compiles the book with appropriate geometry and selects the matching full-bleed cover image.

### Enhanced Build Process

The build process uses a 6-pass compilation system:
1. **Pass 1**: Initial LaTeX compilation
2. **Pass 2**: Bibliography processing (biber)
3. **Pass 3**: Glossary processing (makeglossaries)
4. **Pass 4**: Index processing (makeindex)
5. **Pass 5**: Reference resolution
6. **Pass 6**: Final compilation

### Single-Chapter Build Targets (testing/debugging only)

These targets compile a single chapter for faster iteration. They are intended for testing/debugging and not for publishing the final book.

Supported sizes: `a4`, `a5`, `letter`, `a6`, `b5`, `trade`.

```bash
# Examples (chapter number can be 1 or 01; output is zero-padded)
make a4-chapter-1
make a5-chapter-02
make letter-chapter-3
make a6-chapter-4
make b5-chapter-12
make trade-chapter-7
```

Output files are written to:

- `Deep-Learning101-PDF-Books/<paper-size>/chapter-<NN>.pdf`

Notes:
- Only the specified chapter is compiled (internally uses `\includeonly`).
- Uses the same 6-pass build (biber, glossary, index) as full builds.
- For final distributions, prefer the full-book targets (`pdf-*`) or `make publish`.

### Requirements

- LaTeX distribution (TeX Live, MiKTeX, or similar)
- LuaLaTeX (default engine with native Unicode support)
- biber (for bibliography)
- makeglossaries (for glossary)
- makeindex (for index)
- Unicode and CJK font support (automatically configured)

### Cover Images

Cover images are generated per paper size (300 DPI) and automatically selected during build:

Generated files in `images/`:
- `DeepLearning101-cover-A4.png` (2481×3507)
- `DeepLearning101-cover-A5.png` (1748×2481)
- `DeepLearning101-cover-letter.png` (2550×3300)
- `DeepLearning101-cover-A6.png` (1240×1754)
- `DeepLearning101-cover-B5.png` (2079×2953)
- `DeepLearning101-cover-trade.png` (1800×2700)

If you need to regenerate from the source `DeepLearning101-cover.png`, use ImageMagick:

```bash
# A4 / A5 (already created previously)
convert images/DeepLearning101-cover.png -resize 2481x3507! images/DeepLearning101-cover-A4.png
convert images/DeepLearning101-cover.png -resize 1748x2481! images/DeepLearning101-cover-A5.png

# US Letter
convert images/DeepLearning101-cover.png -resize 2550x3300! images/DeepLearning101-cover-letter.png

# A6
convert images/DeepLearning101-cover.png -resize 1240x1754! images/DeepLearning101-cover-A6.png

# B5
convert images/DeepLearning101-cover.png -resize 2079x2953! images/DeepLearning101-cover-B5.png

# Trade (6"x9")
convert images/DeepLearning101-cover.png -resize 1800x2700! images/DeepLearning101-cover-trade.png
```

## Difficulty Level Indicators

The book uses visual emoji indicators to denote the difficulty level of each section, making it easy for readers to gauge the complexity at a glance:

- 💫 **Beginner**: Basic concepts with intuitive explanations, minimal prerequisites
- ⭐️ **Intermediate**: Technical details with moderate mathematical background expected
- 🌟 **Advanced**: Cutting-edge research topics with complex mathematics

These indicators appear next to section titles throughout the book. For example:
- "7.1 Parameter Norm Penalties ⭐️" indicates an intermediate-level section
- "20.3 Normalizing Flows 🌟" indicates an advanced-level section

The difficulty system is implemented using the `\difficulty{}` LaTeX command, which automatically appends the appropriate emoji to section titles based on the specified level (beginner, intermediate, or advanced).

## Current Status

**Completed:**
- ✅ Full table of contents structure
- ✅ Chapter 1: Introduction (complete with 5 sections)
- ✅ Chapter 2: Linear Algebra (complete with 6 sections)
- ✅ Chapter 3: Probability and Information Theory (complete)
- ✅ Chapter 4: Numerical Computation (complete)
- ✅ Chapter 5: Classical Machine Learning Algorithms (complete)
- ✅ Chapter 6: Deep Feedforward Networks (complete)
- ✅ Chapter 7: Regularization for Deep Learning (complete)
- ✅ Chapter 8: Optimization for Training Deep Models (complete)
- ✅ Chapter 9: Convolutional Networks (complete)
- ✅ Chapter 10: Sequence Modeling (complete)
- ✅ Chapter 11: Practical Methodology (complete)
- ✅ Chapter 12: Applications (complete)
- ✅ Chapter 13: Linear Factor Models (complete)
- ✅ Chapter 14: Autoencoders (complete)
- ✅ Chapter 15: Representation Learning (complete)
- ✅ Chapter 16: Structured Probabilistic Models (complete)
- ✅ Chapter 17: Monte Carlo Methods (complete)
- ✅ Chapter 18: Confronting the Partition Function (complete)
- ✅ Chapter 19: Approximate Inference (complete)
- ✅ Chapter 20: Deep Generative Models (complete)
- ✅ Front matter (Acknowledgements, Notation)
- ✅ Book infrastructure (main.tex, Makefile, bibliography)
- ✅ Extended bibliography with modern references
- ✅ Glossary with technical terms and definitions
- ✅ Comprehensive subject index
- ✅ Difficulty level indicators (💫 Beginner / ⭐️ Intermediate / 🌟 Advanced)
- ✅ Contributing guidelines with difficulty level policies
- ✅ AI assistant instruction policies (Copilot & Gemini)

**Book Statistics:**
- 📖 Around 200 pages
- 📝 20 chapters covering fundamentals to advanced topics
- 🎓 Comprehensive coverage from basics to research frontiers
- 🌍 Enhanced international support with Unicode and CJK characters
- 📚 Advanced features: glossary, index, and difficulty level indicators
- 🔧 Dual paper size support (A4, A5, US Letter, A6, B5, and Trade (6"x9"))
- 📖 Color-coded difficulty levels (Beginner/Intermediate/Advanced)

## File Structure

```
Deep-Learning-101/
├── main.tex                    # Main book file with Unicode/CJK support
├── Makefile                    # Enhanced build automation (A4/A5 support)
├── references.bib              # Bibliography (expanded with modern references)
├── README.md                   # This file
├── CHANGELOG.md                # Comprehensive changelog tracking
├── SUMMARY.txt                 # Book summary
├── .gitignore                  # Build artifact exclusion
├── .github/
│   └── copilot-instructions.md # AI assistant guidelines
└── chapters/                   # Chapter files
    ├── acknowledgements.tex    # Acknowledgements
    ├── notation.tex            # Notation guide
    ├── chap01.tex             # Chapter 1 (includes sections)
    ├── chap01-sec01.tex       # Chapter 1, Section 1
    ├── chap01-sec02.tex       # Chapter 1, Section 2
    ├── chap01-sec03.tex       # Chapter 1, Section 3
    ├── chap01-sec04.tex       # Chapter 1, Section 4
    ├── chap01-sec05.tex       # Chapter 1, Section 5
    ├── chap02.tex             # Chapter 2 (includes sections)
    ├── chap02-sec01.tex       # Chapter 2, Section 1
    ├── chap02-sec02.tex       # Chapter 2, Section 2
    ├── chap02-sec03.tex       # Chapter 2, Section 3
    ├── chap02-sec04.tex       # Chapter 2, Section 4
    ├── chap02-sec05.tex       # Chapter 2, Section 5
    ├── chap02-sec06.tex       # Chapter 2, Section 6
    ├── chap03.tex             # Chapter 3 (includes sections)
    ├── chap03-sec01.tex       # Chapter 3, Section 1: Probability Distributions
    ├── chap03-sec02.tex       # Chapter 3, Section 2: Conditional Probability and Bayes' Rule
    ├── chap03-sec03.tex       # Chapter 3, Section 3: Expectation, Variance, and Covariance
    ├── chap03-sec04.tex       # Chapter 3, Section 4: Common Probability Distributions
    ├── chap03-sec05.tex       # Chapter 3, Section 5: Information Theory Basics
    ├── chap04.tex             # Chapter 4 (includes sections)
    ├── chap04-sec01.tex       # Chapter 4, Section 1: Overflow and Underflow
    ├── chap04-sec02.tex       # Chapter 4, Section 2: Gradient-Based Optimization
    ├── chap04-sec03.tex       # Chapter 4, Section 3: Constrained Optimization
    ├── chap04-sec04.tex       # Chapter 4, Section 4: Numerical Stability and Conditioning
    ├── chap05.tex             # Chapter 5 (includes sections)
    ├── chap05-sec01.tex       # Chapter 5, Section 1: Linear Regression
    ├── chap05-sec02.tex       # Chapter 5, Section 2: Logistic Regression
    ├── chap05-sec03.tex       # Chapter 5, Section 3: Support Vector Machines
    ├── chap05-sec04.tex       # Chapter 5, Section 4: Decision Trees and Ensemble Methods
    ├── chap05-sec05.tex       # Chapter 5, Section 5: k-Nearest Neighbors
    ├── chap05-sec06.tex       # Chapter 5, Section 6: Comparison with Deep Learning
    ├── chap06.tex             # Chapter 6 (includes sections)
    ├── chap06-sec01.tex       # Chapter 6, Section 1: Introduction to Feedforward Networks
    ├── chap06-sec02.tex       # Chapter 6, Section 2: Activation Functions
    ├── chap06-sec03.tex       # Chapter 6, Section 3: Output Units and Loss Functions
    ├── chap06-sec04.tex       # Chapter 6, Section 4: Backpropagation
    ├── chap06-sec05.tex       # Chapter 6, Section 5: Design Choices
    ├── chap07.tex             # Chapter 7 (includes sections)
    ├── chap07-sec01.tex       # Chapter 7, Section 1: Parameter Norm Penalties
    ├── chap07-sec02.tex       # Chapter 7, Section 2: Dataset Augmentation
    ├── chap07-sec03.tex       # Chapter 7, Section 3: Early Stopping
    ├── chap07-sec04.tex       # Chapter 7, Section 4: Dropout
    ├── chap07-sec05.tex       # Chapter 7, Section 5: Batch Normalization
    ├── chap07-sec06.tex       # Chapter 7, Section 6: Other Regularization Techniques
    ├── chap08.tex             # Chapter 8 (includes sections)
    ├── chap08-sec01.tex       # Chapter 8, Section 1: Gradient Descent Variants
    ├── chap08-sec02.tex       # Chapter 8, Section 2: Momentum-Based Methods
    ├── chap08-sec03.tex       # Chapter 8, Section 3: Adaptive Learning Rate Methods
    ├── chap08-sec04.tex       # Chapter 8, Section 4: Second-Order Methods
    ├── chap08-sec05.tex       # Chapter 8, Section 5: Optimization Challenges
    ├── chap09.tex             # Chapter 9 (includes sections)
    ├── chap09-sec01.tex       # Chapter 9, Section 1: The Convolution Operation
    ├── chap09-sec02.tex       # Chapter 9, Section 2: Pooling
    ├── chap09-sec03.tex       # Chapter 9, Section 3: CNN Architectures
    ├── chap09-sec04.tex       # Chapter 9, Section 4: Applications of CNNs
    ├── chap10.tex             # Chapter 10 (includes sections)
    ├── chap10-sec01.tex       # Chapter 10, Section 1: Recurrent Neural Networks
    ├── chap10-sec02.tex       # Chapter 10, Section 2: Backpropagation Through Time
    ├── chap10-sec03.tex       # Chapter 10, Section 3: Long Short-Term Memory (LSTM)
    ├── chap10-sec04.tex       # Chapter 10, Section 4: Gated Recurrent Units (GRU)
    ├── chap10-sec05.tex       # Chapter 10, Section 5: Sequence-to-Sequence Models
    ├── chap10-sec06.tex       # Chapter 10, Section 6: Advanced Topics
    ├── chap11.tex             # Chapter 11 (includes sections)
    ├── chap11-sec01.tex       # Chapter 11, Section 1: Performance Metrics
    ├── chap11-sec02.tex       # Chapter 11, Section 2: Baseline Models and Debugging
    ├── chap11-sec03.tex       # Chapter 11, Section 3: Hyperparameter Tuning
    ├── chap11-sec04.tex       # Chapter 11, Section 4: Data Preparation and Preprocessing
    ├── chap11-sec05.tex       # Chapter 11, Section 5: Production Considerations
    ├── chap12.tex             # Chapter 12 (includes sections)
    ├── chap12-sec01.tex       # Chapter 12, Section 1: Computer Vision Applications
    ├── chap12-sec02.tex       # Chapter 12, Section 2: Natural Language Processing
    ├── chap12-sec03.tex       # Chapter 12, Section 3: Speech Recognition and Synthesis
    ├── chap12-sec04.tex       # Chapter 12, Section 4: Healthcare and Medical Imaging
    ├── chap12-sec05.tex       # Chapter 12, Section 5: Reinforcement Learning Applications
    ├── chap12-sec06.tex       # Chapter 12, Section 6: Other Applications
    ├── chap12-sec07.tex       # Chapter 12, Section 7: Ethical Considerations
    ├── chap13.tex             # Chapter 13 (includes sections)
    ├── chap13-sec01.tex       # Chapter 13, Section 1: Probabilistic PCA
    ├── chap13-sec02.tex       # Chapter 13, Section 2: Factor Analysis
    ├── chap13-sec03.tex       # Chapter 13, Section 3: Independent Component Analysis
    ├── chap13-sec04.tex       # Chapter 13, Section 4: Sparse Coding
    ├── chap14.tex             # Chapter 14 (includes sections)
    ├── chap14-sec01.tex       # Chapter 14, Section 1: Undercomplete Autoencoders
    ├── chap14-sec02.tex       # Chapter 14, Section 2: Regularized Autoencoders
    ├── chap14-sec03.tex       # Chapter 14, Section 3: Variational Autoencoders
    ├── chap14-sec04.tex       # Chapter 14, Section 4: Applications of Autoencoders
    ├── chap15.tex             # Chapter 15 (includes sections)
    ├── chap15-sec01.tex       # Chapter 15, Section 1: What Makes a Good Representation?
    ├── chap15-sec02.tex       # Chapter 15, Section 2: Transfer Learning and Domain Adaptation
    ├── chap15-sec03.tex       # Chapter 15, Section 3: Self-Supervised Learning
    ├── chap15-sec04.tex       # Chapter 15, Section 4: Contrastive Learning
    ├── chap16.tex             # Chapter 16 (includes sections)
    ├── chap16-sec01.tex       # Chapter 16, Section 1: Graphical Models
    ├── chap16-sec02.tex       # Chapter 16, Section 2: Inference in Graphical Models
    ├── chap16-sec03.tex       # Chapter 16, Section 3: Deep Learning and Structured Models
    ├── chap17.tex             # Chapter 17 (includes sections)
    ├── chap17-sec01.tex       # Chapter 17, Section 1: Sampling and Monte Carlo Estimators
    ├── chap17-sec02.tex       # Chapter 17, Section 2: Markov Chain Monte Carlo
    ├── chap17-sec03.tex       # Chapter 17, Section 3: Importance Sampling
    ├── chap17-sec04.tex       # Chapter 17, Section 4: Applications in Deep Learning
    ├── chap18.tex             # Chapter 18 (includes sections)
    ├── chap18-sec01.tex       # Chapter 18, Section 1: The Partition Function Problem
    ├── chap18-sec02.tex       # Chapter 18, Section 2: Contrastive Divergence
    ├── chap18-sec03.tex       # Chapter 18, Section 3: Noise-Contrastive Estimation
    ├── chap18-sec04.tex       # Chapter 18, Section 4: Score Matching
    ├── chap19.tex             # Chapter 19 (includes sections)
    ├── chap19-sec01.tex       # Chapter 19, Section 1: Variational Inference
    ├── chap19-sec02.tex       # Chapter 19, Section 2: Mean Field Approximation
    ├── chap19-sec03.tex       # Chapter 19, Section 3: Loopy Belief Propagation
    ├── chap19-sec04.tex       # Chapter 19, Section 4: Expectation Propagation
    ├── chap20.tex             # Chapter 20 (includes sections)
    ├── chap20-sec01.tex       # Chapter 20, Section 1: Variational Autoencoders (VAEs)
    ├── chap20-sec02.tex       # Chapter 20, Section 2: Generative Adversarial Networks (GANs)
    ├── chap20-sec03.tex       # Chapter 20, Section 3: Normalizing Flows
    ├── chap20-sec04.tex       # Chapter 20, Section 4: Diffusion Models
    └── chap20-sec05.tex       # Chapter 20, Section 5: Applications and Future Directions
```
## License

This work is licensed under the Creative Commons Attribution 4.0 International License.  
To view a copy of this license, visit: http://creativecommons.org/licenses/by/4.0/

## Acknowledgements

This book draws inspiration from:
- "Deep Learning" by Goodfellow, Bengio, and Courville
- "Understanding Deep Learning" by Simon J.D. Prince
- The broader deep learning research community

## Key Features

### Advanced LaTeX Features
- **Glossary System**: Technical terms with definitions and cross-references
- **Comprehensive Index**: Hierarchical subject indexing
- **Difficulty Levels**: Color-coded indicators (Beginner/Intermediate/Advanced)
- **International Support**: Unicode and CJK character support
- **Multiple Paper Sizes**: A4, A5, US Letter, A6, B5, and Trade (6"x9") with optimized layouts

### Content Organization
- **Structured Learning Path**: From fundamentals to advanced research
- **Real-World Applications**: Practical examples in every deep learning chapter
- **Mathematical Rigor**: Proper notation and step-by-step derivations
- **Cross-References**: Extensive internal linking between concepts

### Build System
- **6-Pass Compilation**: Ensures all references, glossary, and index entries are resolved
- **Error Handling**: Comprehensive error reporting and logging
- **Automated Publishing**: Direct PDF distribution to output folder
- **Clean Builds**: Automated artifact cleanup

## Contributing

Contributions, corrections, and suggestions are welcome. Please ensure any contributions align with the educational goals and style of the book.

### Contribution Guidelines
- Follow British English spelling conventions
- Use appropriate difficulty level indicators
- Include glossary entries for technical terms
- Add relevant index entries
- Test compilation before submitting
- **Update CHANGELOG.md for all changes**

### Changelog Requirements
Every significant change must be documented in `CHANGELOG.md` following the established format with:
- Date (ISO format)
- Change categories (Added/Changed/Fixed/Removed)
- Technical details (version, author, dependencies, etc.)
- Impact on glossary, index, and bibliography

# rmdNMUsimple: Reliable R Markdown Templates for Nelson Mandela University

[![License: GPL-3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![GitHub](https://img.shields.io/badge/GitHub-sjvrensburg%2FrmdNMUsimple-blue)](https://github.com/sjvrensburg/rmdNMUsimple)

## 1 Overview

The `rmdNMUsimple` package provides reliable, minimal R Markdown templates for Nelson Mandela University documents. This package represents a fundamental architectural redesign prioritising compilation stability and cross-platform compatibility over advanced typographical features.

### 1.1 Design Philosophy

The package adopts a pragmatic approach to academic document production, emphasising:

- **Reliability**: Consistent compilation across diverse LaTeX installations
- **Simplicity**: Minimal dependencies and straightforward template architecture  
- **Maintainability**: Reduced complexity for sustainable long-term support
- **Compatibility**: Standard pdflatex engine support without exotic requirements

## 2 Motivation and Background

### 2.1 Issues with the Original rmdNMU Package

The predecessor `rmdNMU` package, whilst feature-rich, suffered from critical reliability issues:

**Pandoc Compatibility Problems**: Complex LaTeX template architecture proved vulnerable to Pandoc version updates, resulting in frequent compilation failures and maintenance overhead.

**LaTeX Engine Dependencies**: The package's reliance on XeLaTeX created barriers for users with standard LaTeX installations, particularly in managed computing environments.

**Font Management Complexity**: Sophisticated font installation procedures and cross-platform path resolution introduced failure points that compromised user experience.

**Package Conflict Resolution**: Extensive conditional package loading and duplicate command definitions generated LaTeX compilation errors requiring constant maintenance.

### 2.2 Strategic Simplification

The `rmdNMUsimple` package addresses these limitations through architectural simplification:

- Standard pdflatex compilation engine compatibility
- Reduced dependency requirements (rmarkdown, bookdown only)
- Simplified LaTeX template structure without complex conditionals
- Standard font handling without custom installation procedures

## 3 Installation

### 3.1 GitHub Installation

The package remains available exclusively through GitHub, with no planned CRAN release:

```r
# Install from GitHub repository
if (!require(devtools)) install.packages("devtools")
devtools::install_github("sjvrensburg/rmdNMUsimple")
```

### 3.2 System Requirements

- R (≥ 3.5.0)
- LaTeX distribution with pdflatex support
- rmarkdown and bookdown packages

## 4 Template Overview

The package provides three core template types:

### 4.1 Available Templates

| Template | Function | Purpose |
|----------|----------|---------|
| **NMU Beamer Slides** | `nmu_beamer()` | Academic presentations |
| **NMU General Document** | `nmu_document()` | Notes, assignments, reports |
| **NMU Assessment** | `nmu_assessment()` | Tests, examinations |

### 4.2 Template Features

**NMU Branding**: Consistent application of university colours (blue #141c2b, yellow #ffce00) across all template types.

**Sans-serif Typography**: Global sans-serif font application including mathematical notation via the `sansmath` package.

**Enhanced Environments**: Support for styled note, warning, and example boxes through Lua filter processing.

## 5 Limitations and Trade-offs

### 5.1 Removed Functionality

The simplification process necessitated removing several advanced features:

**Typography**: No custom font integration; standard system fonts replace NMU's official Nunito Sans typeface.

**Faculty Theming**: Colour schemes are limited to primary NMU branding without faculty-specific variations.

**Advanced Environments**: Complex theorem environments require manual formatting or conversion to basic box environments.

**TikZ Integration**: Advanced graphics packages are not pre-configured, though users may add them manually.

### 5.2 Font Policy

**Important**: This package does not implement NMU's official Nunito Sans font family. Documents utilise standard sans-serif fonts available across LaTeX installations. Institutions requiring strict brand compliance should consider this limitation when adopting the package.

## 6 Important: Chunk Naming Convention

When using captions with `kable()`, avoid underscores in chunk labels:

✅ **Good**: `{r datatable}`, `{r summaryinfo}`  
❌ **Bad**: `{r data_table}`, `{r summary_info}`

This prevents cross-reference processing conflicts.

## 7 Support and Maintenance

### 7.1 Bug Reports and Feature Requests

Submit issues through the GitHub repository: https://github.com/sjvrensburg/rmdNMUsimple/issues

### 7.2 Contributing

The package welcomes contributions that maintain the core philosophy of simplicity and reliability. Please ensure all modifications preserve cross-platform compatibility and minimal dependency requirements.

## 8 License and Attribution

**License**: GNU General Public License (≥ 3)  
**Author**: Dr Stefan Janse van Rensburg  
**Institution**: Department of Statistics, Nelson Mandela University  
**Contact**: stefanj@mandela.ac.za

---

*This package prioritises reliable document production over advanced typographical features, providing a stable foundation for academic content creation within the NMU Statistics Department.*

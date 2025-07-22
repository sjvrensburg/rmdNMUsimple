# rmdNMUsimple

Simple R Markdown Templates for Nelson Mandela University (NMU) documents.

## Overview

This package provides minimal R Markdown templates aligned to NMU branding, compatible with `pdflatex` and depending only on the `rmarkdown` package.

## Templates

The package includes three templates:

1. **NMU Beamer Slides**: For presentations using the Beamer class
2. **NMU General Document**: For notes or assignments using the article class  
3. **NMU Assessment**: For exams or tests using the CTAN `exam` class

## Features

- **NMU Branding**: Uses official NMU colors (blue #141c2b, yellow #ffce00)
- **Sans-serif fonts**: Enforced globally including math via `sansmath` package
- **Flexible font sizes**: Support for custom font sizes via YAML `fontsize` parameter
- **Minimal dependencies**: Only essential LaTeX packages included
- **pdflatex compatible**: Works with standard LaTeX installations

## Installation

```r
# Install from GitHub
devtools::install_github("sjvrensburg/rmdNMUsimple")
```

## Usage

After installation, the templates will be available in RStudio under:
File → New File → R Markdown → From Template

Or create documents programmatically:

```r
# Beamer slides
rmarkdown::render("slides.Rmd", output_format = rmdNMUsimple::nmu_beamer())

# General document  
rmarkdown::render("document.Rmd", output_format = rmdNMUsimple::nmu_document())

# Assessment
rmarkdown::render("exam.Rmd", output_format = rmdNMUsimple::nmu_assessment())
```

## Font Size Support

Specify font size in the YAML header:

```yaml
---
title: "My Document"
fontsize: 14pt  # or 10pt, 11pt, 12pt, 14pt, 17pt, 20pt
output: rmdNMUsimple::nmu_document
---
```

## Author

Dr Stefan Janse van Rensburg  
Nelson Mandela University  
stefanj@mandela.ac.za

## License

GPL-3

# rmdNMUsimple Package Summary

## Package Structure

```
rmdNMUsimple/
├── DESCRIPTION                                    # Package metadata
├── README.md                                      # Package documentation
├── R/
│   └── outputs.R                                  # Custom output format functions
└── inst/
    └── rmarkdown/
        └── templates/
            ├── slides/                            # Beamer presentation template
            │   ├── template.yaml
            │   └── skeleton/
            │       ├── skeleton.Rmd
            │       └── template.tex
            ├── document/                          # General document template
            │   ├── template.yaml
            │   └── skeleton/
            │       ├── skeleton.Rmd
            │       └── template.tex
            └── assessment/                        # Assessment/exam template
                ├── template.yaml
                └── skeleton/
                    ├── skeleton.Rmd
                    └── template.tex
```

## Key Features Implemented

### 1. Package Metadata (DESCRIPTION)
- Package name: rmdNMUsimple
- Minimal dependencies: only rmarkdown
- GPL-3 license
- Author: Dr Stefan Janse van Rensburg

### 2. Custom Output Functions (R/outputs.R)
- `nmu_beamer()`: Beamer presentation with fontsize support
- `nmu_document()`: General PDF document with fontsize support  
- `nmu_assessment()`: Assessment document with fontsize support
- All functions pass fontsize as Pandoc variable and use pdflatex

### 3. Template Features
All templates include:
- **NMU Branding**: Official colors (blue #141c2b, yellow #ffce00)
- **Sans-serif fonts**: Global enforcement including math via sansmath
- **Font size flexibility**: Support for custom sizes via YAML fontsize parameter
- **Minimal LaTeX packages**: Only essentials (extsizes, xcolor, graphicx, amsmath, sansmath, hyperref, booktabs)
- **pdflatex compatibility**: Standard LaTeX engine support

### 4. Specific Template Details

#### Beamer Slides Template
- Uses beamer documentclass
- NMU colors for structure and block titles
- Sans-serif presentation style
- Math in sans-serif font

#### General Document Template  
- Uses article documentclass with extsizes
- 1-inch margins via geometry package
- NMU blue default text color
- Suitable for notes, assignments, reports

#### Assessment Template
- Uses CTAN exam documentclass
- Wraps content in questions environment
- Supports \question[points] syntax
- Includes solution environment support
- 1-inch margins for readability

## Installation Instructions

1. Create GitHub repository manually at https://github.com/new
2. Clone this package directory to the repository
3. Install in R using:
   ```r
   devtools::install_github("username/rmdNMUsimple")
   ```

## Usage Examples

### In RStudio
File → New File → R Markdown → From Template → Select NMU template

### Programmatically
```r
# Render with custom font size
rmarkdown::render("document.Rmd", 
                  output_format = rmdNMUsimple::nmu_document(fontsize = "14pt"))
```

### YAML Header Example
```yaml
---
title: "My Document"
author: "Your Name"
date: "`r Sys.Date()`"
fontsize: 12pt
output: rmdNMUsimple::nmu_document
---
```

## LaTeX Dependencies

The templates require these LaTeX packages (typically included in standard distributions):
- extsizes (font sizes)
- xcolor (colors)
- graphicx (images)
- amsmath (math)
- sansmath (sans-serif math)
- hyperref (links)
- booktabs (tables)
- geometry (margins - document/assessment only)
- exam (assessment template only)

## Git Repository Status

The package has been committed locally with all files. To create the GitHub repository:

1. Go to https://github.com/new
2. Create repository named "rmdNMUsimple"
3. Push the local repository:
   ```bash
   git remote add origin https://github.com/username/rmdNMUsimple.git
   git push -u origin main
   ```
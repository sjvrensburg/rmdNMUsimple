#' NMU Beamer Presentation
#'
#' @param ... Additional arguments to beamer_presentation
#' @export
nmu_beamer <- function(...) {
  logo <- system.file(
    "rmarkdown/templates/slides/resources/nmu-logo.png",
    package = "rmdNMUsimple"
  )
  rmarkdown::beamer_presentation(
    template = system.file("rmarkdown/templates/slides/resources/template.tex", package = "rmdNMUsimple"),
    pandoc_args = c(
      "--variable", sprintf("logo=%s", logo)
    ),
    latex_engine = "pdflatex",
    ...
  )
}

#' NMU General Document
#'
#' @param ... Additional arguments to pdf_document
#' @export
nmu_document <- function(...) {
  bookdown::pdf_document2(
    template = system.file("rmarkdown/templates/document/resources/template.tex", package = "rmdNMUsimple"),
    pandoc_args = c(
      "--lua-filter", system.file("rmarkdown/templates/document/resources/boxes.lua", package = "rmdNMUsimple")
    ),
    latex_engine = "pdflatex",
    ...
  )
}

#' NMU Assessment Document
#'
#' @param solutions Include solutions? (logical, default FALSE)
#' @param ... Additional arguments to pdf_document
#' @export
nmu_assessment <- function(solutions = FALSE, ...) {
  # Initialise pandoc arguments vector
  pandoc_args <- character(0)

  # Conditionally define solutions variable for pandoc processing
  if (isTRUE(solutions)) {
    pandoc_args <- c(pandoc_args, "--variable", "solutions=true")
  }

  # Process additional function arguments
  args <- list(...)

  # Handle addenda file specification with path normalisation
  if ("addenda" %in% names(args)) {
    addenda_path <- normalizePath(args$addenda, mustWork = FALSE)
    pandoc_args <- c(pandoc_args, "--variable", paste0("addenda=", addenda_path))
    args$addenda <- NULL
  }

  # Construct pdf_document with automated mark calculation
  do.call(rmarkdown::pdf_document, c(
    list(
      template = system.file("rmarkdown/templates/assessment/resources/template.tex",
                             package = "rmdNMUsimple"),
      pandoc_args = pandoc_args,
      latex_engine = "pdflatex"
    ),
    args
  ))
}

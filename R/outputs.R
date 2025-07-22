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
  rmarkdown::pdf_document(
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
  pandoc_args <- NULL
  if (solutions) {
    pandoc_args <- c("--variable", "solutions=true")
  }

  # Get the additional arguments
  args <- list(...)

  # Handle addenda file if specified
  if ("addenda" %in% names(args)) {
    # Convert to absolute path to ensure it's found during compilation
    addenda_path <- normalizePath(args$addenda, mustWork = FALSE)
    pandoc_args <- c(pandoc_args, "--variable", paste0("addenda=", addenda_path))
    # Remove from args so it's not passed twice
    args$addenda <- NULL
  }

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

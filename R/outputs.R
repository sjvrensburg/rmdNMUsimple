#' NMU Beamer Presentation
#'
#' @param fontsize Font size (e.g., "12pt")
#' @param ... Additional arguments to beamer_presentation
#' @export
nmu_beamer <- function(fontsize = "12pt", ...) {
  rmarkdown::beamer_presentation(
    ...,
    pandoc_args = c("--variable", paste0("fontsize=", fontsize)),
    latex_engine = "pdflatex"
  )
}

#' NMU General Document
#'
#' @param fontsize Font size (e.g., "12pt")
#' @param ... Additional arguments to pdf_document
#' @export
nmu_document <- function(fontsize = "12pt", ...) {
  rmarkdown::pdf_document(
    ...,
    pandoc_args = c("--variable", paste0("fontsize=", fontsize)),
    latex_engine = "pdflatex"
  )
}

#' NMU Assessment Document
#'
#' @param fontsize Font size (e.g., "12pt")
#' @param ... Additional arguments to pdf_document
#' @export
nmu_assessment <- function(fontsize = "12pt", ...) {
  rmarkdown::pdf_document(
    ...,
    pandoc_args = c("--variable", paste0("fontsize=", fontsize)),
    latex_engine = "pdflatex"
  )
}
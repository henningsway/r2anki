#' Starts Anki and Imports the Specified *.tsv-file to Your Collection
#'
#' Currently only implemented for Linux systems, but the other operating systems will be supported soon. This Function requires an installation of Anki.
#' @export
tsv2anki <- function(tsv_file) {
  if (is_linux())
    system2("anki", tsv_file)
}

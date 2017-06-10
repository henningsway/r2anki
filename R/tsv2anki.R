#' Start Anki (on Linux) and import a *.tsv-file to your Collections
#'
#' @export
tsv2anki <- function(tsv) {
  system(paste("anki", tsv))
}

#' Start Anki (on Linux) and import a *.tsv-file to your Collections
#'
#' @export
tsv2anki <- function(tsv_file) {
  if (is_linux())
    system2("anki", tsv_file)
}

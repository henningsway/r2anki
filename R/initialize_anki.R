#' Open an apgk-file in Anki Which Contains Template Cards for appropriate r2anki-styling
#' @export
initialize_anki <- function() {
  tsv2anki("inst/anki/r2anki_cardtype.apkg")
}

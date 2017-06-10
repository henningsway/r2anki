#' Open an apgk-file in Anki which contains template card for r2anki-styling
initialize_anki <- function() {
  tsv2anki("inst/anki/r2anki_cardtype.apkg")
}

#' Open an apgk-file in Anki Which Contains Template Cards for appropriate r2anki-styling
#'
#' Please import initialization file manually, if this function fails to find the *.apkg-file.
#' @export
initialize_anki <- function() {
  path_to_apkg <- file.path(.libPaths(), "r2anki/anki/r2anki_cardtype.apkg")[1]  # should be generalized soon.
  if(file.exists(path_to_apkg)) {
    message(paste("*.apkg-file was found successfully:", path_to_apkg))
  } else {
    message("Please go to package source and import r2anki_cardtype.apkg manually into Anki to prepare proper Rmarkdown-display in Anki.")
  }
  send_to_anki(path_to_apkg)
}

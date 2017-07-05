#' Open an apgk-file in Anki Which Contains Template Cards for appropriate r2anki-styling
#' @export
initialize_anki <- function() {
  ## "Guess" correct path to r2anki-library
  lib_paths <- .libPaths()
  has_r2anki <- sapply(lib_paths, function(x) "r2anki" %in% list.files(x))
  r2anki_lib <- lib_paths[has_r2anki][1]  # could be made more flexible

  ## create path to apkg-file
  r2anki_apkg_path <- file.path(r2anki_lib, "r2anki/anki/r2anki.apkg")

  send_to_anki(r2anki_apkg_path)
}

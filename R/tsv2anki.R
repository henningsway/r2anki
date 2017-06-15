#' Starts Anki and Imports the Specified *.tsv-file to Your Collection
#'
#' Currently only implemented for Linux systems, but the other operating systems will be supported soon. This Function requires an installation of Anki.
#' @param tsv_file Path to the (*.tsv-)file you wish to import into Anki.
#' @export
tsv2anki <- function(tsv_file) {
  if (is_linux())
    system2("anki", normalizePath(tsv_file), wait = FALSE)
  # alternative? tools::file_path_as_absolute(tsf_file)
  else if (is_osx()) {
    system2("anki", normalizePath(tsv_file), wait = FALSE)
    message("Not yet tested for OSX.")
  }
  else if(is_windows()){
    # shell(shQuote("path/to/anki.exe"), wait = FALSE)
    system2("C:\\Program Files (x86)\\Anki\\anki.exe", normalizePath(tsv_file), wait = FALSE)  # should allow flexible path to Anki (implement later)
    message("Not yet implemented for Windows.")
  }
}


# Sys.which("anki")  # try on windows?

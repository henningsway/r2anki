#' Go to the Web and find yourself the up-to-date Anki-version for your OS.
#'
#' This function will be substituted by a more automatic approach.
#' @export
install_anki <- function() {
  cat("For now, please install Anki manually. Thank you! :)")
  browseURL("https://apps.ankiweb.net/#download")
  if(is_windows())
    if (!require("installr")) install.packages("installr")
    installr::install.URL("https://apps.ankiweb.net/downloads/current/anki-2.0.44.exe")  # use regexp to be immune to upcount in version-number
  else if (is_osx()) {
    message("osx download not implemented yet.")
  }
  else if (is_linux()) {
    message("linux download not implemented yet.")
  }
}


## Find out operating-system, copyied from "blogdown"-pkg
is_linux <- function ()
  Sys.info()[["sysname"]] == "Linux"
is_osx <- function ()
  Sys.info()[["sysname"]] == "Darwin"
is_windows <- function ()
  .Platform$OS.type == "windows"

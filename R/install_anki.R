#' Go to the Web and Find Yourself the Up-to-date Anki-version for Your OS.
#'
#' For now this function opens https://apps.ankiweb.net/#download in your webbrowser, where you can then download the Anki-installer appropriate for your operating system. Please follow the (very simple) instructions on the Anki-webpage. This approach will be substituted by a more automatic approach in the near future.
#' @export
install_anki <- function() {
  cat("For now, please install Anki manually. Thank you! :)")
  if (is_linux()) {
    utils::browseURL("https://apps.ankiweb.net/#linux")
    message("Linux download not implemented yet.")
  }
  else if (is_osx()) {
    utils::browseURL("https://apps.ankiweb.net/#mac")
    message("OSX download not implemented yet.")
  }
  else if(is_windows()){
    # if (!require("installr")) install.packages("installr")
    # installr::install.URL("https://apps.ankiweb.net/downloads/current/anki-2.0.44.exe")  # use regexp to be immune to upcount in version-number
    utils::browseURL("https://apps.ankiweb.net/#windows")
    message("Windows download not implemented yet.")
  }
}

### Ideas for linux-install-functions
# utils::download.file()
# utils::unzip()
# utils::untar()
# Sys.chmod()
# Sys.which("anki")  # test if anki was sucesfulyy installed
# tryCatch()  # ?!

### Ideas for osx-install-functions
# copy mounted file to hdd




## Find out operating-system, copyied from "blogdown"-pkg
is_linux <- function (){
  Sys.info()[["sysname"]] == "Linux"
}
is_osx <- function (){
  Sys.info()[["sysname"]] == "Darwin"
}
is_windows <- function (){
  .Platform$OS.type == "windows"
}

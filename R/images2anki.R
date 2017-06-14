#' Copy Images from the `sourcefile` to the Anki `collection.Media`-Folder
#'
#' You will have to call this function, when you have images in your anki cards. When you notice empty plots in your Anki-cards you should copy the images over to the anki-collections.media-folder.
#'
#' @param rmd_sourcefile Path to the rmd-template
#' @param path_collections.media_folder Path to the Anki-template. Should be similar to /home/usrname/.local/share/Anki2/User 1/collection.media/"
#' @param delete_directory Should the image files be deleted after the copying?
#' @seealso https://apps.ankiweb.net/docs/manual.html#files
#' @importFrom magrittr %>%
images2anki <- function(rmd_sourcefile, user = "User 1",
                        path_collections.media_folder = anki_dir(user),
                        delete_directory = FALSE) {
  path_to_images <- tools::file_path_sans_ext(rmd_sourcefile) %>%
    paste0("_files/figure-html/")  #! make this more robust if possible
    # knitr::opts_chunk$set(fig.path = "images/")

  list.files(path_to_images) %>%
    paste0(path_to_images, .) %>%
    file.copy(path_collections.media_folder)

  if (delete_directory) {
    ## delete source and folders
    file.remove(path_to_images)
  }
}


#' Define Path-variables to Anki-folder
#'
#' Inspired by blogdown:::bin_paths.
#' @keywords internal
# Function should allow for custom path somehow.
anki_dir <- function (user = "User 1"){
  if (is_windows()) {
    path <-  Sys.getenv("APPDATA", "")
    path <- if (dir.exists(path))
      file.path(path, "Anki2")
  }
  else if (is_osx()) {
    path <- "~/Library/Application Support/Anki2"
    path <- if (dir.exists(path))
      file.path(path)
  }
  else {
    path <- "~/.local/share/Anki2"
    path <- if (dir.exists(path))
      file.path(path)
  }
  path <- file.path(path, user, "collection.media")
  path
}

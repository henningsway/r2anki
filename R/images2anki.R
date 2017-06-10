#' Copy images from the `sourcefile` to the Anki `collection.media` folder
#'
#' @param rmd_sourcefile Path to the rmd-template
#' @param collections.media_folder Path to the Anki-template
#' @param delete_directory Should the image files be deleted after the copying?
#' @seealso https://apps.ankiweb.net/docs/manual.html#files
#' @importFrom magrittr %>%


# how can i stably find the collections.media-folder?
# library(magrittr)

copy_images2anki <- function(rmd_sourcefile,
                             collections.media_folder,
                             delete_directory = FALSE) {
  path_to_images <- tools::file_path_sans_ext(rmd_sourcefile) %>%
    paste0("_files/figure-html/")  #! make this more robust if possible
    # knitr::opts_chunk$set(fig.path = "images/")

  list.files(path_to_images) %>%
    paste0(path_to_images, .) %>%
    file.copy(collections.media_folder)

  if (delete_directory) {
    ## delete source and folders
    file.remove()  # function needs no argument?
  }
}

## Example arguments
# src_test <- "inst/example-templates/testfile.Rmd"
# c.m_test <- "inst/example-templates/test_collection.media/"
# copy_images2anki(src_test, c.m_test)


#'  Updates the links to be appropriate for anki.
#'
#'  The Function replaces and shortes <img> paths in the html code.
#'  It seems to be operating on the line level, so it needs to be called before
#'  the html-code is collapsed. It would be really nice, if I could call it
#'  after. Maybe I can, would there be a problem?
imagelinks4anki <- function(html_srcfile,
                            rmd_sourcefile) {
  imagelinks <- html_srcfile[grep("<img src=", html_srcfile)]

  old_path <- basename(rmd_sourcefile) %>%
    tools::file_path_sans_ext() %>%
    paste0("_files/figure-html/")  # this could possibly be hardcoded?

  gsub(old_path, "", imagelinks)
}

## Testing the function
# html_srcfile <- readLines("inst/example-templates/testfile.html")
# imagelinks2anki(testsnippet, "inst/example-templates/testfile.Rmd")

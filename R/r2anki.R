#' Main Function to Export r2anki-notebooks to Anki.

#' @param rmd_sourcefile Path to R Markdown document to be parsed and exported to Anki.
#' @param invoke_anki Should Anki be started and the tsv imported? Defaults to `FALSE`
#' @export
r2anki <- function(rmd_sourcefile, invoke_anki = FALSE, init = FALSE, ...) {
  if(init){
    initialize_anki()
  } else {
    # create tsv
    rmd2tsv(rmd_sourcefile)

    # copy images to anki
    tsv_file <- paste0(tools::file_path_sans_ext(rmd_sourcefile), ".tsv")
    images2anki(tsv_file, ...)
    #! Should delete image folder per default.

    if (file.exists(tsv_file))
      message("*** r2anki-Output created: ", tsv_file, " ***")

    ## invoke anki with tsv-created
    if (invoke_anki){
      send_to_anki(tsv_file)
    }
  }
}

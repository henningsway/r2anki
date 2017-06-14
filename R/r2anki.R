#' General Function to Enable the Typical `r2anki`-workflow

#' @param path_collections.media_folder Path to the Anki-template. Should be similar to `"/home/usrname/.local/share/Anki2/User 1/collection.media/"`
#' @param invoke_anki Should Anki be started and the tsv imported? Defaults to `FALSE`
#' @export
r2anki <- function(rmd_sourcefile, invoke_anki = FALSE, ...) {
  # create tsv
  rmd2tsv(rmd_sourcefile)

  # copy images to anki
  tsv_file <- paste0(tools::file_path_sans_ext(rmd_sourcefile), ".tsv")
  images2anki(tsv_file, ...)
  #! Should delete image folder per default. :)

  if (file.exists(tsv_file))
  message("*** r2anki-Output created: ", tsv_file, " ***")

  ## invoke anki with tsv-created
  if (invoke_anki){
    tsv2anki(tsv_file)
  }
}

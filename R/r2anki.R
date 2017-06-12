#' General Function to enable the typical r2anki-workflow

#' @param path_collections.media_folder Path to the Anki-template. Should be similar to `"/home/usrname/.local/share/Anki2/User 1/collection.media/"`
#' @param invoke_anki Should Anki be started and the tsv imported? Defaults to `FALSE`
#' @export
r2anki <- function(rmd_sourcefile, path_collections.media_folder, invoke_anki = FALSE) {
  # create tsv
  rmd2tsv(rmd_sourcefile)

  # copy images to anki
  images2anki(rmd_sourcefile, path_collections.media_folder)

  ## invoke anki with tsv-created
  if (invoke_anki){
    tsv_file <- sub(pattern = "(.*?)\\..*$", replacement = "\\1.tsv", rmd_sourcefile)
    tsv2anki(tsv_file)
  }
}

#' Parse an Rmd-`r2anki`-**Template** to csv (for Import into Anki).
#'
#' The goal of `parse2csv` is to compile an Anki-Rmd-Template.
#'
#' @param sourcefile path to `r2Anki`-Template
#'
#' @examples
#' ## Define a Markdown-Template (read in from pkg-examples)
#' @author Henning Bumann, \email{h_b@@posteo.de}
#' @references https://en.wikipedia.org/wiki/Spaced_repetition
#' @seealso [addin_r2anki_flashcard]
#' @export

rmd2tsv <- function(rmd_sourcefile){
  require(tibble)  # where do I best put this requirement?
                   # (and do i really need it?)

  # render the source to html and read in result
  rmarkdown::render(rmd_sourcefile)
  html_srcfile <- sub(pattern = "(.*?)\\..*$",
                      replacement = "\\1.html", rmd_sourcefile)
      # i think, the above statement could also be done with basefile() now.
  lines_srcfile <- readLines(html_srcfile)
  file.remove(html_srcfile)

  # parse html
  ## get relevant line numbers
  card <- grep("<h4>", lines_srcfile)
  start_backside <- grep("<!-- start backside -->", lines_srcfile)
  end_backside <- grep("<!-- end backside -->", lines_srcfile)

  ## collapse multiline input
  frontside <- unlist(lapply(Map(seq, card + 1, start_backside - 1),
                         function(x) paste(lines_srcfile[x], collapse = "<br>")))
  backside <- unlist(lapply(Map(seq, start_backside + 1, end_backside),
                        function(x) paste(lines_srcfile[x], collapse = "<br>")))

  ## shorten links to images
  frontside <- shorten_imagelinks(frontside, rmd_sourcefile)
  backside  <- shorten_imagelinks(frontside, rmd_sourcefile)


  ## Combine in dataframe
  cards <- data.frame(frontside,
                   backside,
                   id = lines_srcfile[card])

  ## Write to csv
  write.table(cards, sub(pattern = "(.*?)\\..*$", replacement = "\\1.tsv", rmd_sourcefile),
              sep = "\t",
              row.names = FALSE, col.names = FALSE,
              fileEncoding = "utf-8", quote = FALSE)
}

# parse2csv("examples/example_tasks.Rmd")

# Should the image-moving be done per default?
  # It would be nice and convenient (should be default), but the anki-media-
  # collection-folder would have to be specified. The csv should also be
  # generated, if no or a wrong path to the collection-folder has been
  # specified.

# length(start_backside) == length(end_backside)  # check, should be automated
#  start_backside < card[-1]  # some checks, if some cards have just one side
  #! This actually seems important right now. :)

# add print message, where the *.tsv-file can be found?
# kann ich hier einen progress-bar einbauen?
# add a variable for the file-path (default, same name, same directory)
# add parsing for tags also
# add some warnings to this file also.
# add logic if either front or backside are missing (requires some thinking.)
  # (values need to be between the two values of the other ... else its missing or so)
# Later: parse multiple files (concatanate these files)



#'  Shorten image-links in html as appropriate for Anki.
#'
#'  The Function replaces and shortes <img> paths in the html code.
#'  It seems to be operating on the line level, so it needs to be called before
#'  the html-code is collapsed. It would be really nice, if I could call it
#'  after. Maybe I can, would there be a problem?
shorten_imagelinks <- function(html_source,
                               rmd_sourcefile) {
  imagelinks <- html_source[grep("<img src=", html_source)]

  old_path <- basename(rmd_sourcefile) %>%
    tools::file_path_sans_ext() %>%
    paste0("_files/figure-html/")  # could this be made more robust?

  gsub(old_path, "", imagelinks)
}

## Testing the function
##


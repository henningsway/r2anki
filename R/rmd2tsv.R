#' Parse an Rmd-`r2anki`-**template** to tsv (for Import into Anki)
#'
#' The goal of `rmd2csv` is to compile an r2nki-Flashcard-Template. The output file is a tab-separed file. The name of the input-sourcefile should be uniqe across the collection, because the images in the Anki-cards will be named after the sourcefile and need to be unique within the Anki-database.
#'
#' @param sourcefile path to `r2Anki`-Template
#' @param ... Pass `quiet = TRUE` to `rmarkdown::render()` to suppress messages from pandoc comand line.
#' @examples
#' ## Define a Markdown-Template (read in from pkg-examples)
#' @author Henning Bumann, \email{h_b@@posteo.de}
#' @references https://en.wikipedia.org/wiki/Spaced_repetition
#' @seealso [addin_r2anki_flashcard]
#' @export

rmd2tsv <- function(rmd_sourcefile, ...){
  # render the source to html and read in result
  knitr::opts_knit$set(unnamed.chunk.label = tools::file_path_sans_ext(rmd_sourcefile))
  rmarkdown::render(rmd_sourcefile, ...)
  html_file <- paste0(tools::file_path_sans_ext(rmd_sourcefile), ".html")
  html_source <- readLines(html_file)
  file.remove(html_file)

  # parse html
  ## get relevant line numbers
  card <- grep("<h4>", html_source)
  start_backside <- grep("<!-- start backside -->", html_source)
  end_backside <- grep("<!-- end backside -->", html_source)
  # tags <- parse_tags(html_source)

  ## collapse multiline input
  frontside <- unlist(lapply(Map(seq, card, start_backside - 1),
                         function(x) paste(html_source[x], collapse = "")))
  backside <- unlist(lapply(Map(seq, start_backside + 1, end_backside),
                        function(x) paste(html_source[x], collapse = "")))

  ## Shorten links to images
  frontside <- shorten_imagelinks(frontside, rmd_sourcefile)
  backside  <- shorten_imagelinks(backside, rmd_sourcefile)


  ## Combine in dataframe
  cards <- data.frame(frontside,
                   backside,
                   id = html_source[card],
                   stringsAsFactors = FALSE)  # paste0(html_source, 1:length(fronside))
                   #tags)

  ## Write to csv
  utils::write.table(cards, sub(pattern = "(.*?)\\..*$", replacement = "\\1.tsv", rmd_sourcefile),
              sep = "\t",
              row.names = FALSE, col.names = FALSE,
              fileEncoding = "utf-8", quote = FALSE)
}


#'  Shorten image-links in html as appropriate for Anki.
#'
#'  The Function replaces and shortes <img> paths in the html code.
#'  It seems to be operating on the line level, so it needs to be called before
#'  the html-code is collapsed. It would be really nice, if I could call it
#'  after. Maybe I can, would there be a problem?
#'  @keywords internal
shorten_imagelinks <- function(html_source,
                               rmd_sourcefile) {
    old_path <- basename(rmd_sourcefile) %>%
    tools::file_path_sans_ext() %>%
    paste0("_files/figure-html/")  # could this be made more robust?

  gsub(old_path, "", html_source)
}

## Add tags to Your Anki-cards
##
parse_tags <- function(html_source){
  taglines <- grep("<!-- Tags:", html_source)  # extend this to allow global tags soon
  tags <- html_source[taglines] %>%
    gsub("<!-- Tags: \\*", "", .) %>%
    gsub("\\* -->", "", .)
  return(tags)

  # If you want to add tag1 and tag2 to every line you’re importing, add the following to the top of the text file:
  #   tags:tag1 tag2
}

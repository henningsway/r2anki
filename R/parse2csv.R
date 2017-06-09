#' Parse an Rmd-`r2anki`-**Template** to csv (for Import into Anki).
#'
#' This is an example for a link to an other package [roxygen2::roxygenize()] (from `roxygen2`).
#' The goal of `parse2csv` is to compile an Anki-Rmd-Template.
#'
#'
#' @param sourcefile path to `r2Anki`-Template
#'
#' @examples
#' parse2csv()
#' @author Henning Bumann, \email{h_b@@posteo.de}
#' @references https://en.wikipedia.org/wiki/Spaced_repetition
#' @seealso [brocolors]
#' @export


parse2csv <- function(srcfile){
  require(tibble)

  # render the source to html
  rmarkdown::render(srcfile)
  srcfile_html <- sub(pattern = "(.*?)\\..*$", replacement = "\\1.html", srcfile)
  src <- readLines(srcfile_html)
  unlink(srcfile_html)

  # parse html
  ## get relevant line numbers
  card <- grep("<h4>", src)
  back1 <- grep("<!-- start backside -->", src)
  back2 <- grep("<!-- end backside -->", src)

  ## collapse multiline input
  front <- unlist(lapply(Map(seq, card + 1, back1 - 1),
                         function(x) paste(src[x], collapse = "<br>")))
  back <- unlist(lapply(Map(seq, back1 + 1, back2),
                        function(x) paste(src[x], collapse = "<br>")))

  ## combine in dataframe
  df <- data.frame(front,
                   back,
                   id = src[card])

  ## Write to csv
  write.table(df,sub(pattern = "(.*?)\\..*$", replacement = "\\1.tsv", srcfile),
              sep = "\t",
              row.names = FALSE, col.names = FALSE,
              fileEncoding = "utf-8", quote = FALSE)
}

#parse2csv("examples/example_tasks.Rmd")

#length(back1) == length(back2)  # check, should be automated
# back1 < card[-1]  # some checks, if some cards have just one side


# add print message, where the *.tsv-file can be found?
# kann ich hier einen progress-bar einbauen?
# welcher output wäre optimal?
  # und wie gehe ich mit dem rmarkdown-ouptut am besten um?
# add a variable for the file-path (default, same name, same directory)
# add parsing for tags also
# add some warnings to this file also.
# add logic if either front or back are missing (requires some thinking.)
  # (values need to be between the two values of the other ... else its missing or so)
# Later: parse multiple files (concatanate these files)

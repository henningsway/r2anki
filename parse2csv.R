library(magrittr)
library(tibble)
library(purrr)

parse2csv <- function(srcfile){
  
}


## render the source to html
srcfile <- "examples/example_tasks.Rmd"

rmarkdown::render(srcfile)
srcfile_html <- sub(pattern = "(.*?)\\..*$", replacement = "\\1.html", srcfile)
src <- readLines(srcfile_html)
unlink(srcfile_html)


## parse html
## get relevant line numbers
card <- grep("<h4>", src)
back1 <- grep("<!-- start backside -->", src)
back2 <- grep("<!-- end backside -->", src)

length(back1) == length(back2)  # check, should be automated

# back1 < card[-1]  # some checks, if some cards have just one side


frontseq <- Map(seq, card + 1, back1 - 1)
front <- lapply(frontseq, function(x) paste(src[x], collapse = "<br>")) %>% 
  unlist

backseq <- Map(seq, back1 + 1, back2)
back <- lapply(backseq, function(x) paste(src[x], collapse = "<br>")) %>% 
  unlist

## Combine in dataframe
# (needs to be extended to multi-lines!)
df <- tibble(front,
             back,
             id = src[card])

## Write to csv
write.table(df,sub(pattern = "(.*?)\\..*$", replacement = "\\1.tsv", srcfile),
            sep = "\t",
            row.names = FALSE, col.names = FALSE,
            fileEncoding = "utf-8", quote = FALSE)



# add some warnings to this file also.


# Later: parse multiple files

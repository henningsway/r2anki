textlines <- replicate(10, paste0(letters[sample(26, 15)], collapse = ""))
is_code <- sample(c(TRUE, FALSE), 10, replace = TRUE)

two_code_lines_in_a_row <- is_code[-10] == TRUE & is_code[-1] == TRUE  # checks for 2 consecutive code lines

# first approach (didn't work)
paste0(textlines, collapse = ifelse(two_code_lines_in_a_row, "<br>", ""))

# second approach
delim <- character(length(two_code_lines_in_a_row))
delim[two_code_lines_in_a_row] <- "<br>"
delim[!two_code_lines_in_a_row] <- ""

paste_code <- function(x1, x2, y) paste0(x1, x2, sep = y)
purrr::reduce2(textlines, delim, paste_code)

# now with base R?
?Reduce(paste_code, list(textlines, textlines, delim))

## rle_x <- rle(is_code)

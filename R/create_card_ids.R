#' Parse a file for cardids and return the highest number.
#'
#' This is useful to find a starting-value to start counting for new card-ids.
#' @param file Path to file to be parsed. Usually an RMarkdown-document.
#' @param pattern Regexp-pattern to define cardids.
get_max_cardid <- function(file, pattern = "^<!-- cardid: .* -->$"){

  parsed_file <- readLines(file)

  existing_cardids <- grep(pattern, parsed_file, value = TRUE) %>%
    regmatches(., gregexpr("\\d* -->$", .)) %>%  # extract last digits only
    gsub(" -->", "", .) %>%
    as.integer()

  # Assign 0 for files without cardids
  filename <- ifelse(current_editor_file() == "", "Untitled", basename(file))
  if(!length(existing_cardids)){
    message(paste0("No cardids were detected in '", filename,
                   "'.\n--> First cardid will be set to 001."))
    max_cardid <- 0L
  } else {
    max_cardid <- max(existing_cardids)
    message(
      paste0("Existing cardids were detected in '", filename,
             "'.\n--> The next cardid will be set to ",
             sprintf("%03d.", max_cardid + 1))
    )
  }

  stopifnot(is.integer(max_cardid))
  max_cardid
}

#' Create a cardid.
#'
create_card_id <- function() {
  # initialize counter, if current document wasn't parsed so far.
  if(!exists(".increase_cardid")) {
    initialize_counter()
  }
  if(attr(.increase_cardid, "file_id") != current_editor_file_id()){
    initialize_counter()
  }

  # return formated cardid
  paste0("<!-- cardid: ", shorten_documentname(), "_",
         sprintf("%03d", .increase_cardid()), " -->")
}

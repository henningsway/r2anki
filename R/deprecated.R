#' Insert a timebased card-id
#'
#' @export
addin_insert_timebased_cardid <- function(){
  rstudioapi::insertText(
    paste0("<!-- card-id: ", Sys.time(), " -->")  # maybe use date() instead
  )
}

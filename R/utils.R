#' Shorten the name of the currently active file in the RStudio-Editor to a specified lenght.
#'
#' @param stop Define length of the filename (to be used as a prefix for the cardid).
shorten_documentname <- function(stop = 12){
  file_id <- basename(tools::file_path_sans_ext(rstudioapi::getSourceEditorContext()[["path"]]))

  # use internal RStudio_hashcode, if file is unnamed
  if(file_id == "") file_id <- rstudioapi::getSourceEditorContext()[["id"]]

  file_id <- substr(file_id, 1, stop)
  file_id
}

current_editor_file <- function(){
  rstudioapi::getSourceEditorContext()$path
}

current_editor_file_id <- function(){
  rstudioapi::getSourceEditorContext()$id
}

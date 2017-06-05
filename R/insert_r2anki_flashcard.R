#' Insert a new emtpy flashcard.
#'
#' Call this function as an addin to insert a new flashcard at the cursor position.
#'
#' @export
insert_r2anki_flashcard <- function() {
  rstudioapi::insertText("# Topic
<!-- Tags: *general tags for all cards in the topic* -->
  ## Subtopic
  #### [id] Title for the Task
  <!-- Tags: *additional tags for this specific card* -->
  ##### ------ FrontSide ------
Description of the task.

##### ------ BackSide ------
Solution for the task
")
}

#' Insert a new emtpy flashcard.
#'
#' Call this function as an addin to insert a new flashcard at the cursor position.
#'
#' @export
addin_r2anki_flashcard <- function() {
  rstudioapi::insertText("#### Title of Card
<!-- Tags: *additional tags for this specific card* -->
**<Describe the Task>**

<!-- start backside --><br>
<Answer the Task here.>
<!-- end backside -->

")
}

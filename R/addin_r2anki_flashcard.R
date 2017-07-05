#' Insert a new emtpy flashcard.
#'
#' Call this function as an addin from RStudio to insert a new flashcard at the cursor position. **Protipp**: Bind this function to a keyboard shortcut via Tools > Modify Keyboard Shortcuts. (Search for "addin" or "r2anki flashcard" to find the right functioncall.)
#'
#' @export
addin_r2anki_flashcard <- function() {
  rstudioapi::insertText("******************
#### Title of Card
<!-- #tags: additional tags for this specific card -->
<Describe the Task>

<!-- start backside -->
<Answer the Task here.>
<!-- end backside -->

")
}

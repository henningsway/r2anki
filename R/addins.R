#' Insert a new emtpy flashcard.
#'
#' Call this function as an addin from RStudio to insert a new flashcard at the cursor position. **Protipp**: Bind this function to a keyboard shortcut via Tools > Modify Keyboard Shortcuts. (Search for "addin" or "r2anki flashcard" to find the right functioncall.)
#'
#' @export
addin_r2anki_flashcard <- function() {
  rstudioapi::insertText(paste0("******************
#### Title of Card\n",
create_card_id(),
"\n<!-- #tags: additional tags for this specific card -->
<Describe the Task>

<!-- start backside -->
<Answer the Task here.>
<!-- end backside -->

")
)
}

#' Create an `.increase_cardid`-function, with a prespecified startpoint
#'
initialize_counter <- function(i = 0){
  # "Code Factory" to create Counter
  create_counter <- function(i){
    function() {
      i <<- i + 1
      i
    }
  }

  # Finding the right startvalue for the counter
  rstudioapi::documentSave(id = current_editor_file_id()) %>%
    invisible()  # Save active document in editor

  startvalue <- current_editor_file() %>%
    get_max_cardid()

  # create counter and assign to global environment
  counter <- create_counter(startvalue)
  attr(counter, "file_id") <- current_editor_file_id()
  .increase_cardid <<- counter
}

#' Insert a filebased card-id
#'
addin_insert_cardid <- function(){
  card_id <- create_card_id()
  rstudioapi::insertText(card_id)
}


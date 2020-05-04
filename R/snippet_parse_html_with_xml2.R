library(xml2)
library(magrittr)

x <- xml2::read_html("test_ankiscripts/test_parsing_structure.html")

## find all cards
cards <- xml_find_all(x, "//div[@class='section level1'] |
                 //div[@class='section level2'] |
                 //div[@class='section level3'] |
                 //div[@class='section level4']")

# cards <- xml_find_all(x, "//div[@class='section level4']")

## return comments
anki_parse_comments <- function(cardnode, pattern) {
  # should only be computed once... (save assignments, etc)
  # to be improved later
  cardnode %>%
    xml_find_all(".//comment()") %>%
    xml_text() %>%
    as.character() %>%
    trimws() %>%
    grep(pattern, ., value = TRUE) %>%
    sub(pattern, "", .) %>%
    trimws()
}

## get question (header for now)
anki_get_questions <- function(cardnode, pattern) {
  cardnode %>%
    xml_find_first(pattern) %>%
    as.character()
}

## get answer
anki_parse_answer <- function(cardnode) {
  cardnode %>%
    xml_find_all("h4") %>%
    xml_siblings() %>%
    as.character()
}

lapply(cards, anki_parse_comments, "^cardid:")
lapply(cards, anki_parse_comments, "^tags:")
# would be nice to add a cardname...
# maybe split this up later...
lapply(cards, anki_get_questions, "h4")
lapply(cards, anki_parse_answer)


anki_parse_cards <- function(html_file){
  # parse html_file with xml2
  # select appropriate sub-nodes
}

anki_parse_uid <- function(card_nodes){
  #
  # return vector with uid (as a string)

  # allow for missing values right now
}

anki_parse_tags <- function(card_nodes){
  # eventually include hierarchical-tag-squashing. =)

  # return character vector with tags delimited by space
}

anki_parse_question <- function(card_nodes){
  # just use level 4 headers for now
    # eventually expand to also use optional expanded frontside
  # return string with <h4> questions
}

anki_parse_answer <- function(card_nodes){
  # substitute \n with <br> for sourceCode elements
  # return a string with collapsed answer-elements
}
# maybe short the 'anki_'part later


anki_html2df <- function(html_file, remove_html_file = FALSE){
  html_source <- readLines(html_file)
  if(remove_html_file) file.remove(html_file)



  df_ankicards <- data.frame(
    uid,
    front,
    back,
    tags,
    stringsAsFactors = FALSE
  )

  df_ankicards
    # does this cost performance?
    # does it make sense to write the df in this function or
    #   should this be externalized?
}

anki_df2tsv <- function(df_ankicards) {
  utils::write.table(
    df_ankicards,
    file = paste0(tools::file_path_sans_ext(rmd_sourcefile), ".tsv"),  # not working atm
    sep = "\t",
    quote = FALSE,
    row.names = FALSE,
    col.names = FALSE,
    fileEncoding = "utf-8"
  )
}

# ------- some xml2-vocabulary -----------------------------------------
xml_attr("class")
write_xml("../../foooo.html")  # write a single node to disk
# xml_children()
# xml_contents()

x %>% xml_text()
y %>% xml_comment()

xml_root(x)

x %>%
  xml_attr("class") %>%
  grepl("^section level", .)

xml2::as_list(x)

x %>%
  xml_find_all(".//pre") %>%
  as.character() %>%
  gsub("\n", "<br>", .)


## find some codeblock
x %>%
  xml_find_first(".//pre") %>%
  xml_attr("class")


## use xpath
xml_find_all("following::*")

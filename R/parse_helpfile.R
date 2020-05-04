parse_helpfile <- function(fun, ...){
  rd <- utils:::.getHelpFile(help(fun, ...))  # not fully working
  rd_txt <- capture.output(rd)  # messes up the Rd-like formatting
  tmp.Rd <- tempfile(fileext = ".Rd")
  writeLines(rd_txt, tmp.Rd)
  tmp.md <- tempfile(fileext = ".md")
  out1 <- Rd2md::Rd2markdown(tmp.Rd, tmp.md)
  out1[c("title", "description", "usage")]
}
parse_helpfile("select", package = "dplyr")


another_parser <- function(fun, ...){
  rd <- utils:::.getHelpFile(help(fun, ...))  # not fully working
  parsed <- Rd2md::parseRd(rd)
  out <- parsed[c("title", "description", "usage")]  # rename variable
  out  # identical output?!
  # paste(paste(out), collapse = "")
}

another_parser("select", "dplyr")


#? Wie mach ich daraus markdown code?
# bzw, wie kriege ich das in eine nette Struktur? :-)
# vielleicht mit stich? (variablen zuweisen und einfügen?!)

# oder ich erstelle ein ankitemlate mit markdowncode, paste da die variablen rein und probiere den asis output aus.

# auf jdn fall ncohmal checken, ob das mit dem ...-Argument die richtige Lösung ist.

rd4anki <- function(){

}

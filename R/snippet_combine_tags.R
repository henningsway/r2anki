# create_tag_vector <- function(n = 3) replicate(n, paste0(letters[sample(26, sample(8))], collapse = ""))
#
# ## create two lists (1st list is shorter and on a higher hierarchy level)
# list1 <- replicate(sample(2:4, 1), create_tag_vector(sample(2:5, 1)),  simplify = FALSE)
# names(list1) <- paste0("l", seq_along(list1))
#
# list2 <- replicate(4, create_tag_vector(sample(2:10, 1)),  simplify = FALSE)
# names(list2) <- sample(names(list1), length(list2), replace = TRUE)  # assures same hierarchy names
#
#
# ## merge list1-tags into list2-tags
# rep_h1_elements <- rle(sort(names(list2)))$lengths  #TODO: Could the "copying" of list-elements be avoided?
# list1_xtnd <- rep(list1, times = rep_h1_elements)  # bring both lists to same length
#
# Map(c, list1_xtnd, list2)
# # TODO: How to do in base R?
#
# # purrr::map2(list1_xtnd, list2, c)
#
#
# # ----- parse tags (without xml2) --------------
# ## find header
# headers <- html_source[grep("^<h[1-4]>", html_source)]
# hierarchies <- substr(headers, 2, 3)  # combine into one statement maybe
#
# rle(hierarchies)
#
# ## find tags
# taglines <- grep("^<!-- tags:.* -->$", html_source)
# html_source[taglines]
#
# # parse tags
# tags <- sub("^<!-- tags:", "", html_source[taglines])
# tags <- sub("-->$", "", tags)
# tags <- gsub("\\s", "", tags)
# tags <- strsplit(tags, ",")
# names(tags) <- hierarchies
#
# ## pull apart?
# h1 <- tags[names(tags) == "h1"]
# h2 <- tags[names(tags) == "h4"]
#
# h1_xtnd <- rep(h1, times = rle(hierarchies)[["lengths"]])
# # sth is still missing
#
#
# ## find all backside lines
#
#
# ## find all code lines
# start_codeblocks <- grep("<pre.*><code>", html_source)
# html_source[start_codeblocks]
# end_codeblocks   <- grep("</code></pre>$", html_source)
# html_source[end_codeblocks]
#
#
# Map(seq, start_codeblocks, end_codeblocks)

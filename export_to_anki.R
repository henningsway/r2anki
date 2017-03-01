l <- readLines("testrmd.html", n=6)
a <- l[1:3]
b <- l[4:6]


testdat <- tibble::tibble(Task = c("<h2>Task 1</h2>", "<h2>Task 2</h2>"),
                          Solution = c(a, b))


tasks <-  c("<h2>Task 1</h2>", "<h2>Task 2</h2>")

solutions <- list(a, b)


testdat <- cbind(tasks, solutions)


write.csv(testdat, "testdat.csv")



paste(unlist(solutions), collapse = ", ")

http://stackoverflow.com/questions/13545547/how-to-write-a-data-frame-with-one-column-a-list-to-a-file
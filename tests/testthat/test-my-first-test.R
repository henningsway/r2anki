context("test-my-first-test.R")

test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("multiplication works well", {
  expect_equal(2 * 2, 8 / 2)
})

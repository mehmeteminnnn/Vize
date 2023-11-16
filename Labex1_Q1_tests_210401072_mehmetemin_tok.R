library(testthat)

test_that("Workspace'teki t??m de??i??kenleri silme", {
  rm(list = ls())
  expect_equal(length(ls()), 0)
})

test_that("E??er mevcut ise veri setini silme", {
  if ("MapsThatChangedOurWorld_StoryMap_Data.csv" %in% list.files()) {
    file.remove("MapsThatChangedOurWorld_StoryMap_Data.csv")
  }
  expect_equal("MapsThatChangedOurWorld_StoryMap_Data.csv" %in% list.files(), FALSE)
})

current_dir <- getwd()
relative_path <- file.path(current_dir,"Labex1_Q1_210401072_mehmetemin_tok.R")
source(relative_path)

test_that("Test : MapsThatChangedOurWorld_StoryMap_Data.csv adl?? dosya belirtilen dizinde mevcuttur.", {
  file_path <- file.path(current_dir,"MapsThatChangedOurWorld_StoryMap_Data.csv")
  expect_true(file.exists(file_path), info = "Dosya mevcut de??il.")
})
test_that("Test : maps adl?? de??i??ken Global Workspace???de mevcuttur.", {
  expect_true(exists("maps", envir = .GlobalEnv), info = "maps adl?? de??i??ken mevcut de??il.")
  
})
test_that("Test : maps nesnesi bir data.frame'dir.", {
  expect_is(maps, "data.frame", info = "maps nesnesi bir data.frame de??il.")
})
test_that("Test : maps adl?? data.frame'in ilk s??tunu 'City' olmal??d??r.", {
  expect_equal(colnames(maps)[1], "City", info = "??lk s??tun 'City' de??il.")
  
})
test_that("Test : maps adl?? data.frame'in 5. s??tununun ad??nda 'Title' kelimesi ge??melidir.", {
  expect_true(grepl("Title", colnames(maps)[5], fixed = TRUE), info = "5. s??tunun ad??nda 'Title' kelimesi ge??miyor.")
})
library(dsdatawiz)

test_that("hg_word_cloud", {
  test <- sample_data("Txt-Txt-Txt", names = c("txt1", "txt2", "txt3"))

  hg_word_cloud(
    data = test,
    var_cat = c("txt1")
  )

  hg_word_cloud(
    data = test,
    var_cat = c("txt1", "txt2")
  )

  hg_word_cloud(
    data = test,
    var_cat = c("txt1", "txt2", "txt3")
  )

  hg_word_cloud(
    data = iris,
    var_cat = "Species",
    title = "My first word cloud",
    subtitle = "This is a subtitle",
    caption = "This is a caption"
  )

  hg_word_cloud(
    data = iris,
    var_cat = "Species",
    var_num = "Sepal.Length",
    title = "My first word cloud",
    subtitle = "This is a subtitle",
    caption = "This is a caption"
  )
})

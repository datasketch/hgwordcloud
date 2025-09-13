#' @keywords internal
process_wordcloud <- function(data) {
  list(
    data = purrr::pmap(
      list(data[[1]], data[[2]], data$..labels),
      function(word, freq, label) {
        list(
          name = word,
          weight = freq,
          label = label
        )
      }
    )
  )
}

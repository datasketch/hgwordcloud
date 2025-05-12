#' @keywords internal
text_prep <- function(text, ...) {
  opts <- dsopts::dsopts_merge(..., categories = "textprep")
  text <- ifelse(is.na(text), "", as.character(text))

  text <- text |>
    quanteda::tokens(remove_punct = TRUE, remove_numbers = TRUE) |>
    quanteda::tokens_tolower()

  if (!is.null(opts$stopwords_source) && !is.null(opts$stopwords_language)) {
    text <- text |>
      quanteda::tokens_remove(
        quanteda::stopwords(
          language = opts$stopwords_language,
          source = opts$stopwords_source
        )
      )
  }

  if (!is.null(opts$stopwords_custom)) {
    text <- text |>
      quanteda::tokens_remove(opts$stopwords_custom)
  }

  as.character(text)
}

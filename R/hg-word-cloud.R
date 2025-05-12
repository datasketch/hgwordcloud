#' Create a word cloud visualization
#'
#' @description
#' Generates a word cloud using highcharter.
#'
#' @param data A data frame containing the text data to visualize.
#' @param dic Optional. A data dictionary for variable mapping and formatting.
#' @param var_cat Character. The name of the categorical variable containing the
#' text data.
#' @param var_num Optional. The name of the numerical variable to use for word
#' sizing.
#' @param ... Additional \code{dsopts} arguments passed for customization,
#' for example:
#'   \itemize{
#'     \item \code{title}: Main title of the visualization
#'     \item \code{subtitle}: Subtitle text
#'     \item \code{caption}: Caption text
#'   }
#'
#' @return A highcharter object containing the word cloud visualization.
#'
#' @examples
#' \dontrun{
#' # Basic word cloud from text data
#' data <- data.frame(text = c("word1", "word2", "word3", "word1"))
#' hg_word_cloud(data, var_cat = "text")
#'
#' # Word cloud with frequency
#' data <- data.frame(
#'   text = c("word1", "word2", "word3"),
#'   freq = c(10, 5, 3)
#' )
#' hg_word_cloud(data, var_cat = "text", var_num = "freq")
#' }
#'
#' @export
hg_word_cloud <- function(data, dic = NULL,
                          var_cat  = NULL,
                          var_num  = NULL,
                          ...) {
  if (is.null(data)) stop("Data must be provided.")
  if (is.null(var_cat)) stop("var_cat must be provided.")

  data <- data |>
    dplyr::select(dplyr::any_of(var_cat), dplyr::any_of(var_num))

  if (is.null(var_num)) {
    data <- data |>
      dplyr::select(dplyr::all_of(var_cat)) |>
      purrr::map(function(x) text_prep(x, ...)) |>
      unlist(use.names = FALSE)

    data <- data.frame(word = data)
    var_cat <- "word"
  }

  ht <- hdtable::hdtable(data, dic)

  data_viz <- ht$data |>
    data_prep(ht$dic, var_cat, var_num, agg_text = "freq", ...) |>
    dsdatawiz::colors_data(color_by = names(ht$data)[1], ...)

  highcharter::highchart() |>
    highcharter::hc_chart(type = "wordcloud") |>
    highcharter::hc_add_theme(hg_theme(...)) |>
    highcharter::hc_colors(data_viz$..colors) |>
    highcharter::hc_series(process_wordcloud(data_viz)) |>
    highcharter::hc_tooltip(
      useHTML = TRUE,
      formatter = highcharter::JS("function () {return this.point.label;}")
    ) |>
    hg_titles(...)
}

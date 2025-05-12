#' @keywords internal
hg_titles <- function(hc, ...) {
  opts <- dsopts::dsopts_merge(..., categories = "titles")

  hc |>
    highcharter::hc_title(text = opts$title, useHTML = TRUE) |>
    highcharter::hc_subtitle(text = opts$subtitle, useHTML = TRUE) |>
    highcharter::hc_credits(
      enabled = opts$caption_show,
      text = opts$caption,
      useHTML = TRUE
    )
}

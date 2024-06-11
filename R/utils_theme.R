#' @keywords internal
hgch_theme <- function(opts = NULL) {
  message("in theme")

  highcharter::hc_theme(
    useHTML = TRUE,
    #colors = opts$palette_colors,
    styledMode = TRUE,
    chart = list(
      backgroundColor = opts$background_color,
      marginBottom = opts$plot_margin_bottom,
      marginLeft = opts$plot_margin_left,
      marginRight = opts$plot_margin_right,
      marginTop = opts$plot_margin_top,

      plotBackgroundColor = opts$plot_background_color,
      borderColor = opts$plot_border_color,
      borderWidth = opts$plot_border_width,
      style = list (
        fontFamily = opts$text_family,
        fontSize = paste0(opts$text_size, 'px')
      )),
    title = list(
      useHTML = TRUE,
      align = opts$title_align,
      style = list(
        fontFamily = opts$title_family,
        fontSize = paste0(opts$title_size, 'px'),
        color = opts$title_color %||% opts$text_color,
        fontWeight = opts$title_weight
      )
    ),
    subtitle = list(
      useHTML = TRUE,
      align = opts$subtitle_align,
      style = list(
        fontFamily = opts$title_family %||% opts$text_family,
        fontSize = paste0(opts$subtitle_size, 'px'),
        color = opts$subtitle_color %||% opts$text_color,
        fontWeight = opts$subtitle_weight
      )
    ),
    credits = list(
      useHTML = TRUE,
      href = opts$caption_link,
      margin = opts$caption_margin,
      style = list(
        fontFamily = opts$caption_family %||% opts$text_family,
        fontSize = paste0(opts$caption_size, 'px'),
        color = opts$caption_color
      )
    ),
    tooltip = list(
      useHTML = TRUE,
      backgroundColor = opts$tooltip_background,
      borderColor = opts$tooltip_border_color,
      borderRadius = opts$tooltip_border_radius,
      borderWidth =  opts$tooltip_border_width,

      style = list(
        width = paste0(opts$tooltip_width, "px"),
        whiteSpace = 'normal',
        color = opts$tooltip_text_color,
        fontFamily = opts$tooltip_text_family %||% opts$text_family,
        fontSize = paste0(opts$text_size, 'px')
      )
    )
  )
}

#' @keywords internal
hg_theme <- function(...) {
  opts <- dsopts::dsopts_merge(..., categories = "theme")

  highcharter::hc_theme(
    useHTML = TRUE,
    styledMode = TRUE,
    chart = list(
      # Chart background
      backgroundColor = opts$background_color,
      # Chart border
      borderColor = opts$plot_border_color,
      borderWidth = opts$plot_border_width,
      # Chart margin
      marginBottom = opts$plot_margin_bottom,
      marginLeft = opts$plot_margin_left,
      marginRight = opts$plot_margin_right,
      marginTop = opts$plot_margin_top,
      # Plot background
      plotBackgroundColor = opts$plot_background_color,
      # Font style
      style = list (
        color = opts$text_color,
        fontFamily = opts$text_family,
        fontSize = paste0(opts$text_size, 'px')
      )),
    title = list(
      useHTML = TRUE,
      # Title alignment
      align = opts$title_align, # left, center, right
      # Title style
      style = list(
        color = opts$title_color %||% opts$text_color,
        fontFamily = opts$title_family %||% opts$text_family,
        fontSize = paste0(opts$title_size %||% opts$text_size, 'px'),
        fontWeight = opts$title_weight
      )
    ),
    subtitle = list(
      useHTML = TRUE,
      # Subtitle alignment
      align = opts$subtitle_align, # left, center, right
      # Subtitle style
      style = list(
        color = opts$subtitle_color %||% opts$text_color,
        fontFamily = opts$title_family %||% opts$text_family,
        fontSize = paste0(opts$subtitle_size %||% opts$text_size, 'px'),
        fontWeight = opts$subtitle_weight
      )
    ),
    credits = list(
      useHTML = TRUE,
      # Credits alignment
      href = opts$caption_link,
      # Caption margin
      margin = opts$caption_margin,
      # Caption style
      style = list(
        color = opts$caption_color %||% opts$text_color,
        fontFamily = opts$caption_family %||% opts$text_family,
        fontSize = paste0(opts$caption_size %||% opts$text_size, 'px'),
        fontWeight = opts$caption_weight
      )
    ),
    tooltip = list(
      useHTML = TRUE,
      # Tooltip background
      backgroundColor = opts$tooltip_background,
      # Tooltip border
      borderColor = opts$tooltip_border_color,
      borderRadius = opts$tooltip_border_radius,
      borderWidth =  opts$tooltip_border_width,
      # Tooltip style
      style = list(
        color = opts$tooltip_text_color %||% opts$text_color,
        fontFamily = opts$tooltip_text_family %||% opts$text_family,
        fontSize = paste0(opts$tooltip_text_size %||% opts$text_size, 'px'),
        width = paste0(opts$tooltip_width, "px"),
        whiteSpace = 'normal'
      )
    )
  )
}

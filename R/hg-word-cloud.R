#' @export
hg_word_cloud <- function(data,
                          dic = NULL,
                          clean_text = TRUE,
                          var_cat = NULL,
                          var_num = NULL, ...) {


   if (is.null(var_cat)) return(stop("You must indicate the name of the column with text in var_cat"))
  opts_theme <-  dsopts_merge(..., categories = "theme")
   if (clean_text) {
     data <- data.frame(words = clean_text(data[[var_cat]]))
     names(data) <- var_cat
   }

  ht <- hdtable(data, dic)
  data_viz <- data_prep(ht$data, ht$dic, var_cat, var_num, ...)
  color_by <- var_cat[1]
  data_viz <- colors_data(data_viz, color_by = color_by, ...)
  data_viz <- data_viz |> rename(label = ..labels)
  if (is.null(var_num)) var_num <- "Conteo"

  hchart(data_viz, "wordcloud",
         hcaes_(name = var_cat, weight = var_num), name = var_num, zoomType= 'xy') |>
    hc_titles(opts = dsopts_merge(..., categories = "titles")) |>
    hc_colors(data_viz$..colors) |>
    # hc_tooltip(useHTML = TRUE,
    #           formatter = JS(paste0("function () {return this.point.label;}"))
    #           ) |>
    hc_add_theme(hgch_theme(opts = opts_theme))


}

#' @export
hg_word_cloud_Cat <- function(data, dic = NULL, clean_text = TRUE, ...) {
  vars <- data_vars(data)
  hg_word_cloud(data, dic, var_cat = vars[1], clean_text = clean_text, ...)
}

#' @export
hg_word_cloud_CatNum <- function(data, dic = NULL, ...) {
  vars <- data_vars(data)
  hg_word_cloud(data, dic, var_cat = vars[1], var_num = vars[2], clean_text = FALSE, ...)
}



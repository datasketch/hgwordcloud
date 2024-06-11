data_prep <- function(data,
                      dic = NULL,
                      var_group = NULL,
                      var_num = NULL,
                      ...) {


  dic <- dic %||% hdtable(data)$dic
  var_group <- var_group %||% default_var_group(dic)

  data <- aggregate_data(data = data,
                         dic = dic,
                         group_vars = var_group,
                         var_num_to_agg = var_num, ...)
  data

}

clean_text <- function(text) {
  text <- tolower(text)
  text <- tokens(text, remove_punct = TRUE)
  text <- tokens_remove(text, stopwords("spanish"))
  text <- tokens_tolower(text)
  as.character(text)
}

#' @keywords internal
data_prep <- function(data, dic = NULL,
                      var_group = NULL,
                      var_num = NULL,
                      ...) {
  dic <- dic %||% hdtable::hdtable(data)$dic

  dsdatawiz::aggregate_data(
    data = data,
    dic = dic,
    group_vars = var_group,
    var_num_to_agg = var_num,
    ...
  )
}

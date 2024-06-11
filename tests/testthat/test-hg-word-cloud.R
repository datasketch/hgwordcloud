test_that("hg_word_cloud", {
  texto <- data.frame(text =
                        c("¡Hola! hola ¿Cómo están? este es un mensaje de saludo desde la galaxia andromeda. un test de comunicación!!!",
                          "respondan, chaooo, a todos los habitantes de la tierra")
  )

  hg_word_cloud(texto, var_cat = "text")

})

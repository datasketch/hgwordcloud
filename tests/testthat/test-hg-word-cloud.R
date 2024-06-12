test_that("hg_word_cloud", {
  texto <- data.frame(text =
                        c("¡Hola! hola ¿Cómo están? este es un mensaje de saludo desde la galaxia andromeda. un test de comunicación!!!",
                          "respondan, chaooo, a todos los habitantes de la tierra")
  )

  hg_word_cloud(texto, var_cat = "text")

})


test_that("hg_word_cloud_Cat", {
  texto <- data.frame(text =
                        c("¡Hola! hola ¿Cómo están? este es un mensaje de saludo desde la galaxia andromeda. un test de comunicación!!!",
                          "respondan, chaooo, a todos los habitantes de la tierra")
  )

  hg_word_cloud_Cat(texto)

})


test_that("hg_word_cloud_CatNum", {
  texto <- data.frame(text = c("hola", "mensaje", "galaxia", "andromeda", "Buenas", "Bien","Saludo"),
                      frecuencia = c(2, 5, 3, 10, 1, 3, 2)
  )

  hg_word_cloud_CatNum(texto, text_size = 20)

})

setwd("C:/Users/601545/Desktop/projetos/estat/shiny/")



data <- data.frame(
  cidade = sample(c("SP","RJ","BH","BSB"), 50, replace = T),
  estacao = sample(c("VER","PRI","IN","OUT"), 50, replace = T),
  tempo = sample(c("Ensolarado","Chuvoso"), 50, replace = T),
  idade = sample(c(">16", "<=16"), 50, replace = T),
  trafego = sample(c("de boas","agitado"), 50, replace = T),
  cidade1 = sample(c("SP","RJ","BH","BSB"), 50, replace = T),
  estacao1 = sample(c("VER","PRI","IN","OUT"), 50, replace = T),
  tempo1 = sample(c("Ensolarado","Chuvoso"), 50, replace = T),
  idade1 = sample(c(">16", "<=16"), 50, replace = T),
  trafego1 = sample(c("de boas","agitado"), 50, replace = T),
  cidade2 = sample(c("SP","RJ","BH","BSB"), 50, replace = T),
  estacao2 = sample(c("VER","PRI","IN","OUT"), 50, replace = T),
  tempo2 = sample(c("Ensolarado","Chuvoso"), 50, replace = T),
  idade2 = sample(c(">16", "<=16"), 50, replace = T),
  trafego2 = sample(c("de boas","agitado"), 50, replace = T)
)


write.csv(data, "data.csv")

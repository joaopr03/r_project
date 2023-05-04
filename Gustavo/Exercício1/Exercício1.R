#Libraries
library(openxlsx)
library(ggplot2)

#Reading excel file and creating necessary variables
setwd("C:\\Users\\gusta\\OneDrive\\Ambiente de Trabalho\\IST\\2º Ano 2º Semestre\\PE\\Projeto Computacional\\Gustavo\\Exercício1")
excelTable <- read.xlsx(xlsxFile="Exercício1.xlsx", sheet = 1, rows = c(1, 224:575),colNames = TRUE)
year <- convertToDate(excelTable$tempo)
excelTable <- subset(excelTable, tempo >= 1986, select = c("ddesemp", "tpp"))
dados_z <- data.frame(lapply(excelTable, function(x) (x - mean(x))/sd(x)))


#Creating the graphic
ggplot(dados_z, aes(x = year, colour = Legenda)) +
  geom_line(aes(y = ddesemp, colour = "Duração mediana do desemprego")) +
  geom_line(aes(y = tpp, colour = "Taxa de poupança pessoal")) +
  scale_colour_manual(values = c("#F8766D", "#00BFC4")) +
  labs(x = "Ano", y = "",
  title = "          Evolução da Duração Mediana do Desemprego 
       e da Taxa Poupança Pessoal nos EUA (1986-2015)") +
  theme_bw() + theme(plot.title = element_text(hjust = 0.5))













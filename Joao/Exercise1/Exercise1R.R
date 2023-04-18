library(ggplot2)
library(openxlsx)

setwd("C:\\Programming\\PE_project\\Exercise1")

dataExcel <- read.xlsx(xlsxFile="econ.xlsx", sheet = 1, rows = c(1, 8:575),
                       cols = c(1, 3, 5), colNames = TRUE)

x1 <- dataExcel$ddesemp
x2 <- dataExcel$pop
date <- convertToDate(dataExcel$tempo)

#Xk for ddesemp
X1 <- (x1 - mean(x1)) / sd(x1)
#Xk for pop
X2 <- (x2 - mean(x2)) / sd(x2)

data <- data.frame(date, X1, X2)

#Building the graph
ggplot(data, aes(x = date, colour = Legenda)) +
  geom_line(aes(y = X1, colour = "Duração mediana do desemprego")) +
  geom_line(aes(y = X2, colour = "População total")) +
  labs(x = "Ano", y = "" ,
       title = "Evolução da Duração Mediana do Desemprego 
       e da População Total nos EUA (1986-2015)") + 
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))



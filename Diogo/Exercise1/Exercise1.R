setwd("C:\\Users\\diogo\\Desktop\\IST\\2\\2_semestre\\PE\\Projeto\\Exercise1")

library(openxlsx)
library(ggplot2)

# Read data from excel file
excelTable <- read.xlsx(xlsxFile="econ.xlsx", sheet = 1, rows = 1:575, colNames = TRUE)

# Filter by year
excelTable <- excelTable[convertToDate(excelTable$tempo) >= as.Date("1973-01-01"), ]

# Step a) select data
x1 <- excelTable$ddesemp
x2 <- excelTable$pop
date <- convertToDate(excelTable$tempo)

# Step b) convert data to the same scale
z1 <- (x1 - mean(x1)) / sd(x1)
z2 <- (x2 - mean(x2)) / sd(x2)

dados <- data.frame(date, z1, z2)

# Create graphic using ggplot package
ggplot(dados, aes(x = date, colour = Legenda)) +
  geom_line(aes(y = z1, colour = "Duração mediana do desemprego")) +
  geom_line(aes(y = z2, colour = "População total")) +
  scale_colour_manual(values = c("#F8766D", "#00BFC4")) +
  labs(x = "Ano", y = "", title = "Evolução da Duração Mediana do Desemprego 
       e da População total nos EUA (1973-2015)") + theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

setwd("C:\\Users\\diogo\\Desktop\\IST\\2\\2_semestre\\PE\\Projeto\\Exercise2")

# Read data from csv file
dataOCDE <- read.csv("TIME_USE_24092022.csv", sep=",", header=TRUE)

# Remove "África do Sul" data
dataOCDE <- dataOCDE[dataOCDE$País != "África do Sul", ]

# Keep only data from "Mulheres"
dataOCDE <- dataOCDE[dataOCDE$Sexo == "Mulheres", ]

# Store each occupation in a variable
TNR <- dataOCDE[dataOCDE$Ocupação == "Trabalho não remunerado", ]
CP <- dataOCDE[dataOCDE$Ocupação == "Cuidados pessoais", ]

averageTime <- data.frame(CP$Tempo, TNR$Tempo)

# Create graphic
boxplot(averageTime, main = "Tempos médios diários registados(em minutos): Mulheres",
        names = c("", ""), col = c("#4C72B0", "#DD8452"), border = "gray30",
        ylab = "Tempo", xlab = "Ocupação")
legend("bottomleft", legend = c("Cuidados pessoais", "Trabalho não remunerado"),
       col = c("#4C72B0", "#DD8452"), bty = "n", pch = 20, pt.cex = 3,
       cex = 1, horiz = FALSE, inset = c(0.03,0.01))

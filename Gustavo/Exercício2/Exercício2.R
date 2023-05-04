#Reading the csv file
setwd("C:\\Users\\gusta\\OneDrive\\Ambiente de Trabalho\\IST\\2º Ano 2º Semestre\\PE\\Projeto Computacional\\Gustavo\\Exercício2")
data <- read.csv("Exercício2.csv", sep=",", header=TRUE)


#Removing África do Sul data
data <- data[data$País != "África do Sul", ]

#Filter data for men only
data <- data[data$Sexo == "Homens", ]

#Creating some variables
TNR <- data[data$Ocupação == "Trabalho não remunerado", ]
CP <- data[data$Ocupação == "Cuidados pessoais", ]

averageTime <- data.frame(CP$Tempo, TNR$Tempo)

#Creating the graphic
boxplot(averageTime, main = "Tempos médios diários registados(em minutos): Homens",
        names = c("", ""), col = c("#4C72B0", "#DD8452"), border = "gray30",
        ylab = "Tempo", xlab = "Ocupação")
legend("bottomleft", legend = c("Cuidados pessoais", "Trabalho não remunerado"),
       col = c("#4C72B0", "#DD8452"), bty = "n", pch = 20, pt.cex = 3,
       cex = 1, horiz = FALSE, inset = c(0.03,0.01))

























setwd("C:\\Programming\\PE_project\\Exercise2")

data <- read.csv("TIME_USE_24092022.csv", sep=",", header=TRUE)

#Removing África do Sul data
data <- data[data$País != "África do Sul", ] 

#Filter data for women only
data <- data[data$Sexo == "Mulheres", ]

CP <- data[data$Ocupação == "Cuidados pessoais", ]
TNR <- data[data$Ocupação == "Trabalho não remunerado", ]

dados <- data.frame(CP$Tempo,TNR$Tempo)

boxplot(dados, main = "Tempos médios diários registados(em minutos): Mulheres" ,
        names = c("", "") ,
        col = c("#4C72B0", "#DD8452"), border = "gray30" ,
        ylab = "Tempo" , xlab = "Ocupação")

legend("bottomleft", legend = c("Cuidados pessoais", "Trabalho não remunerado") , 
       col = c("#4C72B0", "#DD8452") , bty = "n", pch=20 , pt.cex = 3, cex = 1, horiz = FALSE, inset = c(0.03, 0.1))
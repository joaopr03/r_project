setwd("C:\\Users\\diogo\\Desktop\\IST\\2\\2_semestre\\PE\\Projeto\\Exercise2")

#read data from csv file
dataOCDE <- read.csv("TIME_USE_24092022.csv", sep=",", header=TRUE)

#remover dados da África do Sul
dataOCDE <- dataOCDE[dataOCDE$País != "África do Sul", ]

#filtrar dados de modo a apenas ter Mulheres
dataOCDE <- dataOCDE[dataOCDE$Sexo == "Mulheres", ]

#guardar cada ocupação numa variável
TNR <- dataOCDE[dataOCDE$Ocupação == "Trabalho não remunerado", ]
CP <- dataOCDE[dataOCDE$Ocupação == "Cuidados pessoais", ]

averageTime <- data.frame(CP$Tempo, TNR$Tempo)

#OPCAO VERTICAL
#dev.new()
#criar o gráfico
boxplot(averageTime, main = "Tempos médios diários registados(em minutos): Mulheres",
        names = c("", ""), col = c("#4C72B0", "#DD8452"), border = "gray30",
        ylab = "Tempo", xlab = "Ocupação")
legend("bottomleft", legend = c("Cuidados pessoais", "Trabalho não remunerado"),
       col = c("#4C72B0", "#DD8452"), bty = "n", pch = 20, pt.cex = 3,
       cex = 1, horiz = FALSE, inset = c(0.03,0.01))



#OPCAO HORIZONTAL
colnames(averageTime) <- c("Cuidados pessoais", "Trabalho não remunerado")

#dev.new()
#criar o gráfico
par(mar=c(5, 5, 2, 5)) #set margins
boxplot(averageTime, main = "Tempos médios diários registados(em minutos): Mulheres",
        xlab = "Tempo", horizontal = TRUE, col = c("#4C72B0", "#DD8452"), border = "gray30",
        ylim = c(0, 800), yaxt = "n", las = 1, cex.axis = 0.8, cex.lab = 0.8, font.lab = 2)

mtext("Ocupação", side = 2, line = 2, font = 2, cex = 1)
axis(2, at = c(1,2), labels = c("Cuidados\npessoais", "Trabalho não\nremunerado"),
     tick = FALSE, las = 1, cex.axis = 0.8)

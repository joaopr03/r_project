#Reading the csv file
setwd("C:\\Users\\gusta\\OneDrive\\Ambiente de Trabalho\\IST\\2º Ano 2º Semestre\\PE\\Projeto Computacional")
data <- read.csv("Exercício2.csv", sep=",", header=TRUE)


#Removing África do Sul data
data <- data[data$País != "África do Sul", ]

#Filter data for men only
data <- data[data$Sexo == "Homens", ]

#Creating some variables
TNR <- data[data$Ocupação == "Trabalho não remunerado", ]
CP <- data[data$Ocupação == "Cuidados pessoais", ]

#Creating the graphic
averageTime <- data.frame(CP$Tempo, TNR$Tempo)
colnames(averageTime) <- c("Cuidados pessoais", "Trabalho não remunerado")

#Improving the graphic
par(mar=c(5, 6, 2, 4)) #set margins
boxplot(averageTime, main = "Tempos médios diários registados(em minutos): Homens",
        xlab = "Tempo", horizontal = TRUE, col = c("#4C72B0", "#DD8452"), border = "gray30",
        ylim = c(0, 800), yaxt = "n", las = 1, cex.axis = 0.8, cex.lab = 1, font.lab = 2)

#Add y-axis label
mtext("Ocupação", side = 2, line = 2, font = 2, cex = 1)

#Add x-axis labels
axis(2, at = c(1,2), labels = c("Cuidados\npessoais","Trabalho não\nremunerado"),
     tick = FALSE, las = 1, cex.axis = 0.9)


























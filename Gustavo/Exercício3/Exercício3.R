#Libraries
library(ggplot2)

#Reading the txt file
setwd("C:\\Users\\gusta\\OneDrive\\Ambiente de Trabalho\\IST\\2º Ano 2º Semestre\\PE\\Projeto Computacional\\Gustavo\\Exercício3")
data <- read.delim("Exercício3.txt", header = TRUE, sep = "\t", quote = "", dec = ".", fill = TRUE, comment.char = "")

# Filter for Italy and the age groups
filtered_data <- data[data$Country == "Italy" & data$Age.Group %in% c("15-24", "25-54", "55-64") & data$Sex %in% c("Men", "Women") & data$IND == "EMP2", ]

# Creating the plot
ggplot(filtered_data, aes(x = AGE, y = Value, fill = SEX)) + 
  geom_col(position = "dodge") + 
  scale_x_discrete(labels = c("15-24", "25-54", "55-64")) + 
  scale_fill_manual(values = c("#e41a1c", "#377eb8"), name = "Sex") +
  labs(title = "Employment/Population Ratio by Sex and Age Group in Italy (2019)",
       x = "Age Group",
       y = "Employment/Population Ratio") +
  theme(plot.title = element_text(hjust = 0.5))


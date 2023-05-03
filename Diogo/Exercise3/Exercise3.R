setwd("C:\\Users\\diogo\\Desktop\\IST\\2\\2_semestre\\PE\\Projeto\\Exercise3")

# Read data from txt file
dataOCDE <- read.delim("GENDER_EMP_19032023152556091.txt", header=TRUE)

# Filter data as requested in the exercise
filteredData <- dataOCDE[dataOCDE$Country == "Sweden" & dataOCDE$TIME == "2019" &
                           dataOCDE$Age.Group %in% c("15-24", "25-54", "55-64") &
                           dataOCDE$Sex %in% c("Men", "Women") &
                           dataOCDE$IND == "EMP1", ]
library(ggplot2)
# Create graphic using ggplot package
ggplot(filteredData, aes(x = AGE, y = Value, fill = SEX)) + 
  geom_col(position = "dodge") +
  scale_x_discrete(labels = c("15-24", "25-54", "55-64")) + 
  scale_fill_manual(values = c("#377eb8", "#DE3163"), name = "Sex") +
  labs(title = "Labour force participation rate, by sex and age group in Sweden (2019)",
       x = "Age Group",
       y = "Labour force participation rate, by sex and age group") +
  theme(plot.title = element_text(hjust = 0.5)) + theme_bw()

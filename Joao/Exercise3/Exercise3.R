setwd("C:\\Programming\\PE_project\\Exercise3")

#read data from txt file
dataOCDE <- read.delim("GENDER_EMP_19032023152556091.txt", header=TRUE)

#filter data by country, age group, sex and variable
filteredData <- dataOCDE[dataOCDE$Country == "Sweden" &
                           dataOCDE$TIME == "2000" &
                           dataOCDE$Age.Group %in% c("15-24", "25-54", "55-64") &
                           dataOCDE$Sex %in% c("Men", "Women") &
                           dataOCDE$IND == "EMP3", ]
library(ggplot2)
#create graphic using ggplot package
ggplot(filteredData, aes(x = AGE, y = Value, fill = SEX)) + 
  geom_col(position = "dodge") +
  scale_x_discrete(labels = c("15-24", "25-54", "55-64")) + 
  scale_fill_manual(values = c("#377eb8", "#DE3163"), name = "Sex") +
  labs(title = "Unemployment rate, by sex and age group in Greece (2000)",
       x = "Age Group",
       y = "Unemployment rate, by sex and age group") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))
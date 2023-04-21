set.seed(1657) #set seed
n <- 194

# Calculate the probabilities i/(n+1), i = 1,...,n
prob <- 1:n
for(i in 1:n){
  prob[i] <- i / (n+1)
}

#Generate the sample and sort the values
amostra <- rcauchy(n,3.2,1.2)
amostra <- sort(amostra)

quantileCauchy <- quantile(amostra,prob)
quantileNormal <- qnorm(prob, mean = 3.8, sd = sqrt(4))

#Creating the graphic-------------------------------------------------------#
#Line relating amostra and quantileCauchy                                   #
plot(amostra, quantileCauchy, type = "l", col = "red",                      #
     xlab = "Valores gerados ordenados por ordem crescente",                # 
     ylab = "Quantis da população gerada e da população normal",            #
     main = "Distribuição Cauchy x Distribuição Normal")                    #
#Line relating amostra and quantileNormal                                   #
lines(amostra,quantileNormal, col = "blue")                                 #
#Line that represents the odd quadrant bistroz                              # 
lines(c(-36,88),c(-36,88), col = "darkgreen")                           #
#Add legend                                                               #
legend("bottomright", legend = c("Distribuição Cauchy",                     #  
                             "Distribuição Normal",                         #
                             "Bissetriz dos Quadrantes Ímpares"),           #
       col = c("red", "blue", "darkgreen"), lty = 1, cex = 0.7, bty = "n")  #
#---------------------------------------------------------------------------#





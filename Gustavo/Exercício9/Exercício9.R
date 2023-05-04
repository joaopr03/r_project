set.seed(1038)
ns <- c(30, 50, 100, 200, 300, 500, 1000)

k <- 1500
p <- 0.3
y <- 0.94

#Vector to store the means of the k differences for each value n
medias <- 1:7

for (i in 1:7) {
  
  n <- ns[i]
  diferencas <- 1:k
  
  for (j in 1:k) {
    #Generate Bernoulli random sample
    amostra <- rbinom(n, 1, p)
    
    #Method 1
    x <- mean(amostra)
    z <- qnorm((1 + y) / 2)
    
    #Data to solve the second-degree equation at p
    a <- 1 + z^2 / n
    b <- -2 * x - z^2 / n
    c <- x^2
    delta <- b^2 - 4 * a * c
    
    dif1 <- #Calculates the difference between the solutions of the equation
      abs((-b + sqrt(delta)) / (2 * a) - (-b - sqrt(delta)) / (2 * a))
    
    
    
    #Method 2
    #z value already calculated in method 1
    sd_estimado <- sqrt(x * (1 - x) / n)
    
    dif2 <- abs((x - z * sd_estimado) - (x + z * sd_estimado))
    
    
    
    #Calculation of the difference between the confidence limits of the 2 methods
    diferencas[j] <- dif2 - dif1
  }
  
  #Mean of k differences for each value of n
  medias[i] <- mean(diferencas)
}

#Creating the graphic
plot(ns, medias, main = "Diferenças médias em função do tamanho da amostra",
     ylab = "Diferença média entre os comprimentos dos ICs", 
     xlab = "Tamanho da amostra (n)",
     col = "#006699", pch = 19)
lines(ns, medias, col = "#FF6666", lwd = 2)
# Comments:
#   Os métodos tendem a ter resultados mais semelhantes quanto maior for o
#   tamanho da amostra
















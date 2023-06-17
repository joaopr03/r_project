set.seed(1364)
n <- 170

# Calcular as probabilidades i/(n+1), i = 1, ..., n
probs <- 1:n
for(i in 1:n) {
  probs[i] <- probs[i] / (n+1)
}

# Gerar a amostra e ordenar os valores
amostra <- rcauchy(n, -1, 1.8)
amostra <- sort(amostra)

quantileCauchy <- quantile(amostra, probs)

quantileNorm <- qnorm(probs, mean = -1.4, sd = sqrt(2.6))

# Criar o gráfico apenas com a linha que relaciona amostra e quantileCauchy
plot(amostra, quantileCauchy, type = "l", col = "red",
     xlab = "Valores gerados ordenados por ordem crescente",
     ylab = "Quantis da população gerada e da população normal",
     main = "Distribuição Cauchy x Distribuição Normal")

# Adicionar linha que relaciona amostra e quantileNorm
lines(amostra,quantileNorm, col = "blue")

# Adicionar bissetriz dos quadrantes ímpares
lines(c(-2000,2000),c(-2000,2000), col = "darkgreen")

# Adicionar legenda
legend("bottomright", legend = c("Distribuição Cauchy", "Distribuição Normal",
                                 "Bissetriz dos Quadrantes Ímpares"),
       col = c("red", "blue", "darkgreen"), lty = 1, cex = 0.7, bty = "n") 

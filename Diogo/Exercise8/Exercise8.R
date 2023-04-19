set.seed(1364)
n <- 170

#calcular as probabilidades i/(n+1), i = 1, ..., n
probs <- 1:n
for(i in 1:n) {
  probs[i] <- probs[i] / (n+1)
}

#gerar a amostra e ordenar os valores
amostra <- rcauchy(n, -1, 1.8)
amostra <- sort(amostra)

quantileCauchy <- quantile(amostra, probs)

quantileNorm <- qnorm(probs, mean = -1.4, sd = sqrt(2.6))

#criar o gráfico apenas com a linha que relaciona amostra e quantileCauchy
plot(amostra, quantileCauchy, type = "l", col = "red",
     xlab = "Valores gerados ordenados por ordem crescente",
     ylab = "Quantis da população gerada e da população normal")
#acrescenta a linha que relaciona amostra e quantileNorm
lines(amostra, quantileNorm, col = "blue")
#acrescenta a bissetriz dos quadrantes ímpares
lines(c(-65, 65), c(-65, 65), col = "green")

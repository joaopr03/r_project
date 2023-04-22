set.seed(627)

m <- 300
n <- 48
mu <- 23.5
sdx <- sqrt(4)

#gerar a n amostras de tamanho m
amostras <- matrix(replicate(m, rnorm(n, mean = mu, sd = sdx)), ncol = n)

mu0 <- 22.3

count <- 0
#contar o número de vezes que H0 é rejeitada
for (i in 1:m){
  z <- (mean(amostras[i,]) - mu0) / (sdx / sqrt(n)) #fórmula teste de hipótese
  p <- 2 * (1 - pnorm(abs(z)))  #fórmula valor p bilateral em distribuição normal 
  if (p < 0.02) {
    count <- count + 1
  }
}

#nr de vezes que H0 não é rejeitada a dividir pelo nr de amostras
prob <- (m - count) / m

cat(round(prob, 3))

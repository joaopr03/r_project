set.seed(1999)

m <- 2096
n <- 14

#gerar a população (n amostras de tamanho m)
pop <- matrix(replicate(m, rnorm(n, mean = 0, sd = 1)), ncol = n)

#soma dos quadrados dos valores observados para cada amostra
pop <- rowSums(pop**2)

observado <- quantile(pop, 0.63, type = 2)
teorico <- qchisq(0.63, 14)

diferenca <- abs(observado - teorico)

cat(round(diferenca, 4))

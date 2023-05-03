set.seed(1999)

m <- 2096
n <- 14

#gerar a população (m amostras de tamanho n)
pop <- matrix(replicate(m, rnorm(n, mean = 0, sd = 1)), ncol = n)

#soma dos quadrados dos valores observados para cada amostra
pop <- rowSums(pop**2)

p <- 0.63

observado <- quantile(pop, p, type = 2)
teorico <- qchisq(p, n)

diferenca <- abs(observado - teorico)

cat(round(diferenca, 4))

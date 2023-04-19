set.seed(1074)

m <- 1351
n <- 11

#Generate the population (n samples of size m)
pop <- matrix(replicate(m, rnorm(n, mean = 0, sd = 1)), ncol = n)

#Sum of squares of observed values for each sample
pop <- rowSums(pop**2)

observado <- quantile(pop, 0.38, type = 2)
teorico <- qchisq(0.38, n)

diferenca <- abs(observado - teorico)

cat(round(diferenca, 4))


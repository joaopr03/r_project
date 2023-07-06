seed <- 1999
m <- 2096
n <- 14
a <- 0.63

set.seed(seed)

chi <- vector(length = m)
for (i in 1:m){
  amostra <- rnorm(n)
  chi[i] <- sum(amostra^2)
}

res <- round(abs(quantile(chi, a, names = FALSE, type = 2) - qchisq(a, n)), 4)

cat(round(res, 4))

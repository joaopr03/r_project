set.seed(1805)

n <- 15
m <- 1740


pop <- matrix(replicate(m, rnorm(n, mean = 0, sd = 1)), ncol = n)



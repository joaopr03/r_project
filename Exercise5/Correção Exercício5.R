seed <- 1629
p <- 0.3
n <- 1139

set.seed(seed)
u <- runif(n)

x <- ceiling(log(1 - u) / log(1 - p)) - 1

q1 <- sum(x > mean(x) + sd(x))
q2 <- sum(x > mean(x))
res <- q1 / q2

cat(round(res, 4))

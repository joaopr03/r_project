set.seed(1463)

m <- 250
n <- 49
mu <- 71.4
sdx <- sqrt(4)
nsignif <- 0.08

#Generate n samples of size m
amostras <- matrix(replicate(m, rnorm(n, mean = mu, sd = sdx)), ncol = n)

mu0 <- 69.9

#Count the number of times H0 is rejected
count <- 0
a <- qnorm(1 - nsignif/2)  #Tails of normal distribution
for (i in 1:m){
  z <- (mean(amostras[i,]) - mu0) / (sdx / sqrt(n)) #Hypothesis test formula
  if (z < -a || z > a) {
    count <- count + 1
  }
}

#Number of times H0 is not rejected to divide by the number of samples
prob <- (m - count) / m

#Show result
cat(round(prob, 3))


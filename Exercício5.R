set.seed(1662)  # set seed

n <- 1032 
p <- 0.35

# Simulate geometric variable values
u <- runif(n)
x <- floor(log(u/p) / log(1-p))

# Calculate sample mean and standard deviation
mean_x <- mean(x)
sd_x <- sd(x)

# Calculate proportion of simulated values that are 
# greater than the mean + standard deviation and higher than the sample mean
prop <- mean(x > mean_x + sd_x & x > mean_x)

# Show result
cat(round(prop, 4))


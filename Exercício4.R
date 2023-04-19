#First Point
set.seed(3744)
k <- 4973
lambda <- 13.5
amostra <- rexp(k,lambda)

#Second Point
soma <- cumsum(amostra)
T <- ceiling(soma[k])

#Third Point
intervalos <- rep(0,T)
i <- 1

for(t in soma){
  while(t>i) {i <- i + 1}
  intervalos[i] <- intervalos[i] + 1
}

#Four Point
media_teorica <- lambda
media_real <- mean(intervalos)
desvio_absoluto <- abs(media_real - media_teorica)

#Show result
cat(round(desvio_absoluto, 4))






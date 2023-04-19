#1) P(X = 2) V P(X = 9)
prob <- log10(1+(1/2)) + log10(1+(1/9))

#2)
m = 9
M = 27

count = 0
for (i in m:M){
  x <- 2**i
  x <- strsplit(as.character(x), "")[[1]]
  if (x[1] %in% c("2", "9"))
    count <- count + 1
}

fracao <- count / (M-m+1)

#3)
desvio <- abs(prob - fracao)

#4)
cat(round(desvio, 4))


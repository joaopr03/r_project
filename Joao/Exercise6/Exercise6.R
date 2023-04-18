#1) P(X = 3) V P(X = 6)
prob <- log10(1+(1/3)) + log10(1+(1/6))

#2)
m = 2
M = 26

count = 0
for (i in m:M){
  x <- 2**i
  x <- strsplit(as.character(x), "")[[1]]
  if (x[1] %in% c("3", "6"))
    count <- count + 1
}

fracao <- count / (M-m+1)

#3)
desvio <- abs(prob - fracao)

#4)
cat(round(desvio, 4))

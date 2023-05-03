#1) P(X = 2) V P(X = 8)
prob <- log10(1+(1/2)) + log10(1+(1/8))

#2)
m = 10 #mínimo do intervalo
M = 21 #máximo do intervalo

count = 0
for (i in m:M){
  x <- 2**i
  x <- strsplit(as.character(x), "")[[1]]
  if (x[1] %in% c("2", "8")) #verificar se o primeiro algarismo é 2 ou 8
    count <- count + 1
}

fracao <- count / (M-m+1)

#3)
desvio <- abs(prob - fracao)

#4)
cat(round(desvio, 4))

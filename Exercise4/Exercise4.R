#1)
set.seed(4749)

k <- 1163
lambda <- 7

amostra <- rexp(k, lambda)

#2)
tempos <- cumsum(amostra) #soma sucessiva das observações
T <- ceiling(tempos[k])   #arredondar o último nr para cima (para ser maior ou igual ao decimal)

#3)
ocorrencias <- rep(0, T)  #inicializa o vetor de tamanho T a 0
i <- 1  #começa-se no intervalo de 0 a 1

#percorre k instantes e guarda o nr de ocorrencias em cada intervalo
for (t in tempos) {
  while(t > i) { i <- i + 1 }         #se o valor não fizer parte do intervalo
  ocorrencias[i] <- ocorrencias[i]+1  #passa para o intervalo seguinte
}

#4)
media <- mean(ocorrencias)
esperado <- lambda        #teorico = lambda x tamanho do intervalo
desvio <- abs(media - esperado)
cat(round(desvio, 4))

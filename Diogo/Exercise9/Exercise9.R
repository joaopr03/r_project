set.seed(1926)
ns <- c(30, 50, 100, 200, 300, 500, 1000)

k <- 2000
p <- 0.6
y <- 0.92

# Vetor para armazenar as médias das k diferenças para cada valor n
medias <- 1:7

for (i in 1:7) {
  
  n <- ns[i]
  diferencas <- 1:k
  
  for (j in 1:k) {
    # Gerar amostra aleatória de Bernoulli
    amostra <- rbinom(n, 1, p)
    
    # Método 1
    x <- mean(amostra)
    z <- qnorm((1 + y) / 2)
    
    # Dados para resolver a equação de segundo grau em p
    a <- 1 + z^2 / n
    b <- -2 * x - z^2 / n
    c <- x^2
    delta <- b^2 - 4 * a * c
    
    dif1 <- #calcula a diferença entre as soluções da equação
      abs((-b + sqrt(delta)) / (2 * a) - (-b - sqrt(delta)) / (2 * a))
    
    
    
    # Método 2
    # valor de z já calculado no método 1
    sd_estimado <- sqrt(x * (1 - x) / n)
    
    dif2 <- abs((x - z * sd_estimado) - (x + z * sd_estimado))
    
    
    
    # Cálculo da diferença entre os limites de confiança dos 2 métodos
    diferencas[j] <- dif2 - dif1
  }
  
  # Média das k diferenças para cada valor de n
  medias[i] <- mean(diferencas)
}

# Criar gráfico
plot(ns, medias, main = "Diferenças médias em função do tamanho da amostra",
     ylab = "Diferença média entre os comprimentos dos ICs", 
     xlab = "Tamanho da amostra (n)")

# Comentários:

#   Os métodos tendem a ter resultados mais semelhantes quanto maior for o
#   tamanho da amostra

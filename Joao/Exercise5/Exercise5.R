set.seed(1292)

p <- 0.45
n <- 1113

#transformação inversa para gerar distribuição geométrica
u <- runif(n)
x <- floor(log(u/p) / log(1-p))

#calcular média e desvio padrão da amostra
mean_x <- mean(x)
sd_x <- sd(x)

#(x > mean + sd | x > mean) = (x > mean + sd & x > mean) / (x > mean)
#como sd é sempre positivo (x > mean + sd & x > mean) = (x > mean + sd)
#=> (x > mean + sd) / (x > mean)
prop <- mean(x > mean_x + sd_x) / mean(x > mean_x)

cat(round(prop, 4))
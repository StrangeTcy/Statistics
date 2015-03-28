x <-  rexp(50)
par(mfrow=c(2,2))
hist(x, plot = TRUE, freq = F, breaks = 5)
hist(x, plot = TRUE, freq = F, breaks = 8)
hist(x, plot = TRUE, freq = F, breaks = 12)
hist(x, plot = TRUE, freq = F, breaks = 16)

mean(x)
49/50*sd(x)*sd(x)

x_2 <-  rexp(500)
par(mfrow=c(2,2))
hist(x_2, plot = TRUE, freq = F, breaks = 5)
hist(x_2, plot = TRUE, freq = F, breaks = 8)
hist(x_2, plot = TRUE, freq = F, breaks = 12)
hist(x_2, plot = TRUE, freq = F, breaks = 16)

mean(x_2)
499/500*sd(x_2)*sd(x_2)

#с увеличением N реальное среднее (mean(x)) становится ближе к заданному: 
# для N = 500 разница в 3-ем десятичном знаке.
# дисперсия с ростом N уменьшается.
# Гистограммы становятся более похожими на график функции с ростом N и breaks


mx <-c()
my_sd <-c()
d_star <- c()
par(mfrow=c(1,1))
for(k in 1:1000)
{
  x <- rexp(100)
  #hist(x,plot = TRUE, freq = F, breaks = 16)
  mx[k] <- mean(x)
  my_sd[k] <- sd(x)
  d_star[k] <-99/100*my_sd[k]*my_sd[k]
  
}
#mx
#d_star

hist(mx, plot = TRUE,freq = F, breaks = 100)
hist(d_star, plot = TRUE, freq = F, breaks = 100)

# среднее распределено,похоже, по нормальному закону, с пиком в 1
# оценка дисперсии распределена по нормальному закону с длинным правым хвостом


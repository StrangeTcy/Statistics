# x_1 <- rnorm(50,1,1)
# x_2 <- rnorm(200,1,1)
# x_3 <- rnorm(1000,1,1)
# 
# n_1 <- rexp(50)
# n_2 <- rexp(200)
# n_3 <- rexp(1000)
# 
# par(mfrow=c(2,2))
# 
# boxplot(x_1,x_2,x_3)
# hist(x_3, plot = TRUE, freq = F, breaks = 12)
# #выбросы равномерно распределяются по краям интервала с ростом N
# 
# 
# 
# boxplot(n_1,n_2,n_3)
# hist(n_3, plot = TRUE, freq = F, breaks = 12)
# 
# means_1 <- c()
# means_2 <- c()
# 
# for (i in 1:500)
# {
#   x_1 <-rnorm(50,1,1)
#   x_2 <- rnorm(400,1,1)
#   means_1[i] <- mean(x_1)
#   means_2[i] <- mean(x_2)
# }
# par(mfrow = c(1,2))
# boxplot(means_1, means_2, main = 'normal')
# #выборочная дисперсия уменьшается: она делится на объём выборки
# 
# #посмотрим на exp:
# 
# means_1 <- c()
# means_2 <- c()
# 
# for (i in 1:500)
# {
#   x_1 <-rexp(50)
#   x_2 <- rexp(400)
#   means_1[i] <- mean(x_1)
#   means_2[i] <- mean(x_2)
# }
# par(mfrow = c(1,2))
# boxplot(means_1, means_2, main = 'exponential')
# #выборочная дисперсия уменьшается. Это важное наблюдение =)
# 
# #посмотрим на poiss:
# 
# means_1 <- c()
# means_2 <- c()
# 
# for (i in 1:500)
# {
#   x_1 <-rpois(50,1)
#   x_2 <-rpois(400,1)
#   means_1[i] <- mean(x_1)
#   means_2[i] <- mean(x_2)
# }
# par(mfrow = c(1,2))
# boxplot(means_1, means_2, main = 'poisson')
# 
# # и тут дисперсия уменьшается с ростом n.
# # сами boxplot'ы выглядят похоже, но выбросы распределены по-разному 
# # (в соотв. с законами)
# # см. асимптотическую нормальность
# 



counter <-0
m <- c()
it <- c()
for (i in 1:500)
{
  x <- rnorm(40,2,1)
  m[i] <- mean(x)
  gamma <- 0.95
  u_left <- qnorm((1-gamma)/2)
  u_right <- qnorm((1+gamma)/2)
  it[i] <- (m[i]-2)/ (1/sqrt(40))
  if (u_left < it[i] && it[i] < u_right )
    counter<-counter+1
}

counter/500


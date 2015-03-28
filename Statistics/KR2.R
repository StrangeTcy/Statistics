#Выяснить, как рост детей зависит от роста родителей. 
# Для этого провести опрос и собрать выборку объемом 16 
# роста родителей (отца и матери) и их детей (дети от 20 лет)
# составить регрессию
# (рост ребенка) ~ A(рост отца) + B(рост матери)+e
# Построить выборочную линию регрессию.
# Найти точечные и интервальные оценки неизвестных параметров модели. 
# Провести графический анализ остатков. 
# Проверить постоянство дисперсий ошибок наблюдений.

children <- c(1.87,1.62,1.89,1.85,1.86,1.82,1.68,1.68,1.79,1.74,1.65,1.67,1.67,1.70,1.72,1.58)
fathers <-c(1.81,1.73,1.78,1.79,1.68,1.80,1.81,1.76,1.74,1.71,1.80,1.83,1.70,1.85,1.81,1.69)
mothers <-c(1.69,1.67,1.70,1.57,1.75,1.66,1.62,1.75,1.60,1.67,1.72,1.72,1.66,1.63,1.74,1.72)

plot (fathers,children)
plot (mothers,children)

#X <- matrix(c(1.81,1.73,1.78,1.79,1.68,1.80,1.81,1.76,1.74,1.71,1.80,1.83,1.70,1.85,1.81,1.69,1.69,1.67,1.70,1.57,1.75,1.66,1.62,1.75,1.60,1.67,1.72,1.72,1.66,1.63,1.74,1.72), nrow=length(children), byrow = TRUE)
ones <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

X <-cbind(ones,fathers, mothers)
X
X_transp <- t(X)   #transpose a matrix
Temp <- X_transp%*%X
Temp_inv <- solve(Temp)
beta_hat <- matrix((Temp_inv%*%X_transp)%*%children) 
beta_hat
y_hat <-c()
for (i in 1:length(children))
{
  y_hat[i] <-beta_hat[1,1]+beta_hat[2,1]*fathers[i]+beta_hat[3,1]*mothers[i]
}
#y_hat
Q_e <-0
for (i in 1:length(children))
{
  Q_e <-Q_e+(children[i]-y_hat[i])*(children[i]-y_hat[i])
}
#Q_e
s <- sqrt(Q_e/(16-2-1))
alpha <- 0.05
beta_hat[1,1]-qt((1-alpha)/2,16-2-1)*s*sqrt(Temp_inv[1,1])
beta_hat[1,1]+qt((1-alpha)/2,16-2-1)*s*sqrt(Temp_inv[1,1]) #beta_0 interval
beta_hat[2,1]-qt((1-alpha)/2,16-2-1)*s*sqrt(Temp_inv[2,2])
beta_hat[2,1]+qt((1-alpha)/2,16-2-1)*s*sqrt(Temp_inv[2,2]) #beta_1 interval
beta_hat[3,1]-qt((1-alpha)/2,16-2-1)*s*sqrt(Temp_inv[3,3])
beta_hat[3,1]+qt((1-alpha)/2,16-2-1)*s*sqrt(Temp_inv[3,3]) #beta_2 interval

Q_e*(16-2-1)/qchisq((1-alpha)/2,16-2-1)
Q_e*(16-2-1)/qchisq(alpha/2,16-2-1)


plot (fathers, children - y_hat)
plot(mothers,children - y_hat)


qqplot(fathers,children-y_hat)
qqplot( mothers,children-y_hat)
qqplot(children,children-y_hat)
qqnorm(children-y_hat)
#qqplot
 errors <- c(children-y_hat)
errors
errors_1 <-c()
for (i in 1:7) {errors_1[i] <- errors[i]}
errors_2 <-c()
for(i in 1:7) {errors_2[i] <- errors[9+i] }
errors_1
errors_2
s_1<-0
s_2<-0
for (i in 1:length(errors_1)) {s_1 <-s_1+(errors_1[i]-mean(errors_1))*(errors_1[i]-mean(errors_1))}
for (i in 1:length(errors_2)) {s_2 <-s_2+(errors_2[i]-mean(errors_2))*(errors_2[i]-mean(errors_2))}
first <- s_1/(length(errors_1)-1)
second <- s_2/(length(errors_2)-1)
(length(errors_1)-1)*first/(second*(length(errors_2)-1))
qf(alpha/2,length(errors_1), length(errors_2))
qf(1-alpha/2,length(errors_1), length(errors_2))
var.test(errors_1,errors_2)
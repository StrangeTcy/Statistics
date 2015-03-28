x <- c(51,32,80,73,64,45,83,44,93,28)
y <- c(52.7,15.2,89.5,94.8,76,39.3,114.8,36.5,137.4,5.3)
x_mean <-mean(x)
y_mean <- mean(y)
covar <- 0
disp <- 0
for (i in 1:10)
{
  covar <-covar+(x[i]-x_mean)*(y[i]-y_mean)
  disp <- disp + (x[i]-x_mean)*(x[i]-x_mean)
}
covar
disp
beta1 <-covar/disp
beta0 <- y_mean-beta1*x_mean
beta0
Q_e <-0
for (i in 1:10)
{
  Q_e <- Q_e+ (y[i]-beta0-beta1*x[i])*(y[i]-beta0-beta1*x[i])
}
Q_e/(10-2)

alpha <-0.05
s <-sqrt(Q_e/(10-2))
sum_sq <-0
for (i in 1:10) {sum_sq <- sum_sq + x[i]*x[i]}
beta0-qt((1-alpha/2), 10-2)*s*sqrt(sum_sq/(10*disp))
beta0+qt((1-alpha/2), 10-2)*s*sqrt(sum_sq/(10*disp))
beta1-qt((1-alpha/2), 10-2)*s*sqrt(1/disp)
beta1+qt((1-alpha/2), 10-2)*s*sqrt(1/disp)
Q_e/qchisq((1-alpha/2),10-2)
Q_e/qchisq(alpha/2,10-2)

x_given <-80
left_border <- beta0+beta1*x_given-qt((1-alpha/2),10-2)*s*sqrt(1/10+(x_given-x_mean)*(x_given-x_mean)/disp)
left_border
right_border <- beta0+beta1*x_given+qt((1-alpha/2),10-2)*s*sqrt(1/10+(x_given-x_mean)*(x_given-x_mean)/disp)
right_border
Q_r <-0
for (i in 1:10) {Q_r <- Q_r + (beta0+beta1*x[i]-y_mean)*(beta0+beta1*x[i]-y_mean)}
Q_r/Q_e
qf(1-alpha,1,10-2)

e <-c()
for (i in 1:10)
{
  e[i] <- y[i]-(beta0+beta1*x[i])
}
glm(y~x)  #general linear models
plot(x,e)
length(x)
# то значение, которое соответствует выбросу в e, можно исключить из рассмотрения,
# и всё пересчитать
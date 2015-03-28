data_x <-c(-3,-2,-1,0,1,2,3)
data_y <- c(-10,0,4,5,4,2,-2)
plot(data_x, data_y)
d<-matrix(c(7,0,28,0,28,0,28,0,196),nrow=3)
d_inv <- solve(d)
X_transp <- matrix(c(1,1,1,1,1,1,1,-3,-2,-1,0,1,2,3,9,4,1,0,1,4,9),nrow=3,byrow=T)
X_transp
##   a%*%b  --matrix multiplication for matrices a and b (in specified order)
temp <- d_inv%*%X_transp
Y <- matrix (c(data_y), nrow = 7)
beta_hat <- temp %*%Y
beta_hat
Q_e <-0
for (i in 1:7)
{
  Q_e <- Q_e+ (data_y[i]-beta_hat[1,1]-beta_hat[2,1]*data_x[i]-beta_hat[3,1]*data_x[i]*data_x[i])* (data_y[i]-beta_hat[1,1]-beta_hat[2,1]*data_x[i]-beta_hat[3,1]*data_x[i]*data_x[i])
}
y_pred <- c()
for (i in 1:7)
{
  y_pred[i] <- beta_hat[1,1]+beta_hat[2,1]*data_x[i]+beta_hat[3,1]*data_x[i]*data_x[i]
}
y_pred
s <-Q_e/(7-2-1)  #s^2 - смотри конспект
alpha <- 0.05
beta_hat[1,1]-qt(1-alpha/2,7-2-1)*sqrt(s)*sqrt(d_inv[1,1])
beta_hat[1,1]+qt(1-alpha/2,7-2-1)*sqrt(s)*sqrt(d_inv[1,1])
beta_hat[2,1]-qt(1-alpha/2,7-2-1)*sqrt(s)*sqrt(d_inv[2,2])
beta_hat[2,1]+qt(1-alpha/2,7-2-1)*sqrt(s)*sqrt(d_inv[2,2])
beta_hat[3,1]-qt(1-alpha/2,7-2-1)*sqrt(s)*sqrt(d_inv[3,3])
beta_hat[3,1]+qt(1-alpha/2,7-2-1)*sqrt(s)*sqrt(d_inv[3,3])
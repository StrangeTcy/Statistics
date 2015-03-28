n_1 <-20
n_2 <-50
n_3 <- 500
a <-3
a_0 <-3.1
a_1 <-4
sigma <-1
# hypo_0 <- a==a_0
# hypo_1 <-  a==a_1

mx_1_1 <-c()
mx_2_1 <-c()
mx_3_1 <-c()
mx_1_2 <-c()
mx_2_2 <-c()
mx_3_2 <-c()

z_hyp0_1 <-c()
z_hyp0_2 <-c()
z_hyp0_3 <-c()

z_hyp1_1 <-c()
z_hyp1_2 <-c()
z_hyp1_3 <-c()

for(i in 1:10000)
{
  sel_1_1 <-rnorm(n = 20, mean = a_0, sd = sigma)
  sel_1_2 <-rnorm(n = 20, mean = a_1, sd = sigma)
  mx_1_1[i] <- mean(sel_1_1)
  mx_1_2[i] <- mean(sel_1_2)
  z_hyp0_1[i] <-(mx_1_1[i]-a_0)/(sigma/sqrt(20))
  z_hyp1_1[i] <-(mx_1_2[i]-a_1)/(sigma/sqrt(20))
  sel_2_1 <-rnorm(n = 50, mean = a_0, sd = sigma)
  sel_2_2 <-rnorm(n = 50, mean = a_1, sd = sigma)
  mx_2_1[i] <- mean(sel_2_1)
  mx_2_2[i] <- mean(sel_2_2)
  z_hyp0_2[i] <-(mx_2_1[i]-a_0)/(sigma/sqrt(50))
  z_hyp1_2[i] <-(mx_2_2[i]-a_1)/(sigma/sqrt(50))
  sel_3_1 <-rnorm(n = 500, mean = a_0, sd = sigma)
  sel_3_2 <-rnorm(n = 500, mean = a_1, sd = sigma)
  mx_3_1[i] <- mean(sel_3_1)
  mx_3_2[i] <- mean(sel_3_2)
  z_hyp0_3[i] <-(mx_3_1[i]-a_0)/(sigma/sqrt(500))
  z_hyp1_3[i] <-(mx_3_2[i]-a_1)/(sigma/sqrt(500))
}

par(mfrow=c(1,3))
hist(z_hyp0_1, freq = F,col='red')
hist(z_hyp1_1, freq = F,add=T, col='blue')

hist(z_hyp0_2, freq = F,col='red')
hist(z_hyp1_2, freq = F,add=T, col='blue')

hist(z_hyp0_3, freq = F,col='red')
hist(z_hyp1_3, freq = F,add=T, col='blue')

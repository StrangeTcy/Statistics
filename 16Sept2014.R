# mx <-c()
# my_sd <-c()
# d_star <- c()
# par(mfrow=c(2,2))
# for(k in 1:4)
# {
#   x <- rnorm(30,2,3)
#   
#   hist(x,plot = TRUE)
#   mx[k] <- mean(x)
#   my_sd[k] <- sd(x)
#   d_star[k] <-29/30*my_sd[k]*my_sd[k]
#   
# }
# mx
# d_star

mx <-c()
my_sd <-c()
d_star <- c()
par(mfrow=c(1,1))
for(k in 1:500)
{
  x <- rnorm(1000,2,3)
  x <- c(x,100) #это "выброс"
  #hist(x,plot = TRUE, freq = F, breaks = 16)
  mx[k] <- mean(x)
  my_sd[k] <- sd(x)
  d_star[k] <-99/100*my_sd[k]*my_sd[k]
  
}
#mx
#d_star

hist(mx, plot = TRUE,freq = F, breaks = 30)
hist(d_star, plot = TRUE, freq = F, breaks = 30)






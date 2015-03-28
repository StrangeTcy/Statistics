#qnorm(p = 0.01)
sel_1 <- rbinom(n=1000, size = 10,  prob = 0.05)
#length(cell[1]=1)
counter <- 0
for(i in 1:1000)
{
  if (sel_1[i] == 1)
    counter <-counter+1  
}
1-counter/1000

# смотри задачу про брак с практики
# можно менять alpha
qchisq(p=0.95,df=9)
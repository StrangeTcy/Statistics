m <- c()
it <- c()
gamma <- 0.95
for (i in 1:5)
{
  x <- rnorm(40,1,1)
  m[i] <- mean(x)
  u_left <- qnorm((1-gamma)/2)
  u_right <- qnorm((1+gamma)/2)
  it[i] <- (m[i]-2)/ (1/sqrt(40))
  if (u_left < it[i] && it[i] < u_right )
}


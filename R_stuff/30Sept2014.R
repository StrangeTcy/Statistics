# # thing <-c()
# # thing <- (1.92*1.92+1.02*1.02+ 0.69*0.69 +0.33*0.33+ 0.99*0.99+1.45*1.45)/5
# # sqrt(thing)
# # gamma <-0.9
# # qt((1-gamma)/2, 5)
# # qt((1+gamma)/2, 5)    #degrees of freedom == number of elements in a ... в выборке
# # 
# # -0.06-(2.015*1.296)/sqrt(6)
# # -0.06+(2.015*1.296)/sqrt(6)
# 
# 
# 
# n_1 <-10
# n_2 <-100
# n_3 <-1000
# p_0<-0.5
# gamma <- 0.95
# #
# sel_1 <-c()
# sel_2 <-c()
# sel_3 <-c()
# 
# counter_1 <-0
# counter_2 <-0
# counter_3 <-0
# 
# our_p_1<-c()
# our_p_2<-c()
# our_p_3<-c()
# denom_1<-c()
# denom_2<-c()
# denom_3<-c()
# left_1<-c()
# right_1<-c()
# left_2<-c()
# right_2<-c()
# left_3<-c()
# right_3<-c()
# 
# sel_1 <-rbinom(10000,n_1,p_0)      #возвращает m - количество успехов из формулы для распред. Бернулли
# sel_2 <- rbinom(10000,n_2,p_0)
# sel_3 <- rbinom(10000,n_3,p_0)
# 
# for (i in 1:10000)
# {
# our_p_1[i] <- sel_1[i]/n_1
# our_p_2[i] <- sel_2[i]/n_2
# our_p_3[i] <- sel_3[i]/n_3
# denom_1[i] <-sqrt(our_p_1[i]*(1-our_p_1[i]))/sqrt(n_1)
# denom_2[i] <-sqrt(our_p_2[i]*(1-our_p_2[i]))/sqrt(n_2)
# denom_3[i] <-sqrt(our_p_2[i]*(1-our_p_3[i]))/sqrt(n_3)
# 
# 
# left_1[i] <- our_p_1[i] - qnorm((1+gamma)/2)*denom_1[i]
# right_1[i] <- our_p_1[i] - qnorm((1-gamma)/2)*denom_1[i]
# 
# left_2[i] <- our_p_2[i]- qnorm((1+gamma)/2)*denom_2[i]
# right_2[i] <- our_p_2[i] - qnorm((1-gamma)/2)*denom_2[i]
# 
# left_3[i] <- our_p_3[i] - qnorm((1+gamma)/2)*denom_3[i]
# right_3[i] <- our_p_3[i] - qnorm((1-gamma)/2)*denom_3[i]
# 
# if (left_1[i] < p_0 && p_0 < right_1[i] ) counter_1 <-counter_1+1
# if (left_2[i] < p_0 && p_0 < right_2[i] ) counter_2 <-counter_2+1
# if (left_3[i] < p_0 && p_0 < right_3[i] ) counter_3 <-counter_3+1
# }
# 
# counter_1/10000
# counter_2/10000
# counter_3/10000
# 
# #с ростом объёма выборки количество попаданий оценки в доверительный интервал 
# # приближается к мат.ожиданию этой величины. Что и требовалось ожидать
# # При разных p_0 скорость стремления оценки разная (см. sqrt(p*(1-p))) , но всё равно она стремится
# # к истинной
# 
# 
# 

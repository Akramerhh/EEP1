
library(ggplot2)
library(tidyverse)
library(gamlss.dist)

set.seed(1)

trialsPerCond=60


simulate <- function(N, trialsPerCond){
  mean.rt = 1000
  sd.rt = 100
  nu.rt = 200
  var.rt = sd.rt**2 + 1/nu.rt**2
  var.rt.part = var.rt/trialsPerCond
  
  mean.acc = 0.8
  
  condition1 <- c(-1, 1)
  condition2 <- c(-1, 1)
  
  
  anzCond <- length(condition1)*length(condition2)
  
  conditions = expand.grid(condition1, condition2)
  ind = rep(1:nrow(conditions),each=trialsPerCond)
  conditions = tibble(conditions[ind,])
  
  
  beta1_ = 1
  effect1_ = 0.4
  beta2_ = 1
  effect2_ = 0.05
  interaction_ = -1
  effect.interaction_ = 0.6
  
  
  var.effect1 = effect1_*var.rt.part/(1-effect1_)
  beta1 = sqrt(var.effect1)*beta1_
  var.effect2 = effect2_*var.rt.part/(1-effect2_)
  beta2 = sqrt(var.effect2)*beta2_
  var.interaction = effect.interaction_*var.rt.part/(1-effect.interaction_)
  interaction = sqrt(var.interaction)*interaction_
  
  beta.acc = 0.05
  
  
  
  for (i in 1:N){
    
    
    
    intercept <- mean.rt + rnorm(1, 0, 50)
    
    data <- conditions %>% 
      rename(Condition1= Var1 , Condition2= Var2) %>%
      rowwise()%>%
      mutate(id=paste0("K", i),
                rt = rexGAUS(1, intercept + beta1*Condition1 + beta2*Condition2 + interaction*Condition1*Condition2, 
                          sd.rt, 
                          nu.rt),
             p= mean.acc + beta.acc*Condition1 + beta.acc*Condition2,
             corr = sample(c(0,1), p=c(1- p, p ), size=1),
             
             vpnr = i,
             Condition1= as.factor(Condition1),
             Condition2= as.factor(Condition2))%>%
      group_by(Condition1,Condition2) %>%
      mutate(
        phase = rep(c("uebung", "experiment"), c(trialsPerCond/10, trialsPerCond*9/10))
      ) %>%
      group_by() %>%
      mutate(
        age  = sample(18:40, 1),
        gender = sample(c("m", "w", "d", "keine Angabe"),1, prob= c(0.3, 0.3, 0.05, 0.35)),
        hand = sample(c("l", "r"), size= 1, prob= c(0.3, 0.7))
      )
    
    
    if (i==1){
      data_all = data
    } else {
      data_all= rbind(data_all, data)
    }
    write.csv(data, paste0("Alle Daten/K", formatC(i, width=2, flag="0"), "_example_eep.csv" ), )
  }
  
  data_all <- data_all %>% 
    group_by(vpnr,Condition1,Condition2) %>%
    summarise(rt= mean(rt, na.rm=T),
              corr= mean(corr, na.rm=T) )
  
  
  plot1 <- ggplot2::ggplot(data_all, aes(x= as.factor(Condition2), y =rt, group= as.factor(Condition1), color = as.factor(Condition1) )) +
    geom_point(aes(group= interaction(vpnr  ,Condition1)),alpha=0.3) +
    geom_line(aes(group= interaction(vpnr  ,Condition1)),alpha=0.2)+
    stat_summary(fun=mean , geom="line", size=1)+
    stat_summary(fun=mean , geom="point", size=2)+
    stat_summary(aes(group=1), fun=mean , geom="line")+
    stat_summary(aes(group=1),fun=mean , geom="point", size=2) + xlab("Condition 2")
  
  plot2 <- ggplot2::ggplot(data_all, aes(x= as.factor(Condition1), y =rt, group= as.factor(Condition2), color = as.factor(Condition2) )) +
    geom_point(aes(group= interaction(vpnr  ,Condition2)),alpha=0.3) +
    geom_line(aes(group= interaction(vpnr  ,Condition2)),alpha=0.2)+
    stat_summary(fun=mean , geom="line", size=1)+
    stat_summary(fun=mean , geom="point", size=2)+
    stat_summary(aes(group=1), fun=mean , geom="line")+
    stat_summary(aes(group=1),fun=mean , geom="point", size=2)+ xlab("Condition 1")
  
  plot3 <- ggplot2::ggplot(data_all, aes(x= as.factor(Condition1), y =corr, group= as.factor(Condition2), color = as.factor(Condition2) )) +
    geom_point(aes(group= interaction(vpnr  ,Condition2)),alpha=0.3) +
    geom_line(aes(group= interaction(vpnr  ,Condition2)),alpha=0.2)+
    stat_summary(fun=mean , geom="line", size=1)+
    stat_summary(fun=mean , geom="point", size=2)+
    stat_summary(aes(group=1), fun=mean , geom="line")+
    stat_summary(aes(group=1),fun=mean , geom="point", size=2)+ xlab("Condition 1")
  
  anova <- ezANOVA(data_all, rt, wid = vpnr, within = .(Condition1 , Condition2), detailed = T, return_aov=T, type=2)
  anova$ANOVA$F*anova$ANOVA$DFn/(anova$ANOVA$F*anova$ANOVA$DFn + anova$ANOVA$DFd)
  print(c(effect1_, effect2_, effect.interaction_))
  
  return(list(plot1, plot2,plot3, anova))
}



res=simulate(20,trialsPerCond )


# for (i in 1:10){
# #### Reaction Times
# rt.AC = rexGAUS(9/10*trialsPerCond, mean.rt + rnorm(1, 0, 100) - 25 , sd.rt, nu.rt)
# rt.AC = c(rt.AC, rexGAUS(1/10*trialsPerCond, mean.rt.o + rnorm(1, 0, 100), sd.rt.o, nu.rt.o))
# 
# rt.BC = rexGAUS(9/10*trialsPerCond, mean.rt + rnorm(1, 0, 100)  +25, sd.rt, nu.rt)
# rt.BC = c(rt.BC, rexGAUS(1/10*trialsPerCond, mean.rt.o + rnorm(1, 0, 100), sd.rt.o, nu.rt.o))
# 
# rt.AD = rexGAUS(9/10*trialsPerCond, mean.rt + rnorm(1, 0, 100) + 100 , sd.rt, nu.rt)
# rt.AD = c(rt.AD, rexGAUS(1/10*trialsPerCond, mean.rt.o + rnorm(1, 0, 100), sd.rt.o, nu.rt.o))
# 
# rt.BD = rexGAUS(9/10*trialsPerCond, mean.rt + rnorm(1, 0, 100) + 200 , sd.rt, nu.rt)
# rt.BD= c(rt.BD, rexGAUS(1/10*trialsPerCond, mean.rt.o + rnorm(1, 0, 100), sd.rt.o, nu.rt.o))
# 
# 
# rt.AE = rexGAUS(9/10*trialsPerCond, mean.rt + rnorm(1, 0, 100) + 150 , sd.rt, nu.rt)
# rt.AE = c(rt.AE, rexGAUS(1/10*trialsPerCond, mean.rt.o + rnorm(1, 0, 100), sd.rt.o, nu.rt.o))
# 
# rt.BE = rexGAUS(9/10*trialsPerCond, mean.rt + rnorm(1, 0, 100) + 250 , sd.rt, nu.rt)
# rt.BE= c(rt.BE, rexGAUS(1/10*trialsPerCond, mean.rt.o + rnorm(1, 0, 100), sd.rt.o, nu.rt.o))
# 
# 
# rt = c(rt.AC, rt.BC,  rt.AD,  rt.BD , rt.AE, rt.BE)
# phase = rep(rep(c("uebung", "experiment"), c(trialsPerCond/10, trialsPerCond*9/10)), 6)
# #### Proportion Correct
# 
# corr = sample(c(1,0), anzCond*trialsPerCond, prob= c(0.8, 0.2), replace=T)
# 
# data = cbind(conditions, rt = rt, corr = corr)
# data$id = i
# data = data[sample(1:nrow(data), nrow(data)),]
# data$phase <- phase
# data <- data[order(data$phase, decreasing = T),]
# data <- data %>% mutate(trial = 1:n()) %>% rename(Condition1 = Var1 , Condition2= Var2)
# data$age <- sample(18:40, 1)
# data$gender <- sample(c("m", "w", "d", "keine Angabe"),1, prob= c(0.3, 0.3, 0.05, 0.35))
# data$hand <- sample(c("l", "r"), size= 1, prob= c(0.3, 0.7))
# 
# write.csv(data, paste0("Alle Daten/J", formatC(i, width=2, flag="0"), "_example_eep.csv" ), )
# }
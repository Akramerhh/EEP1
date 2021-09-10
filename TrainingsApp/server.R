library(shiny)
library(shinyWidgets)
library(ggplot2)
library(tidyverse)
library(gamlss.dist)
library(ez)
library(shinycssloaders)

set.seed(1)


simulate <- function(N, trialsPerCond){
    mean.rt = 350
    sd.rt = 100
    nu.rt = 200
    var.rt = sd.rt**2 + 1/nu.rt**2
    var.rt.part = var.rt/trialsPerCond
    
    
    Faktor1 <- c(-1, 1)
    Faktor2 <- c(-1, 1)
    
    
    anzCond <- length(Faktor1)*length(Faktor2)
    
    conditions = expand.grid(Faktor1, Faktor2)
    ind = rep(1:nrow(conditions),each=trialsPerCond)
    conditions = tibble(conditions[ind,])
    
    
    beta1_ = sample(c(-1,1),1)
    effect1_ = sample(c(0,0.3, 0.7),1)
    beta2_ = sample(c(-1,1),1)
    effect2_ = sample(c(0,0.3, 0.7),1)
    interaction_ = sample(c(-1,1),1)
    effect.interaction_ = sample(c(0,0.2, 0.3, 0.5),1, prob=c(0.5,0.4,0.1, 0.1))
    
    
    var.effect1 = effect1_*var.rt.part/(1-effect1_)
    beta1 = sqrt(var.effect1)*beta1_
    var.effect2 = effect2_*var.rt.part/(1-effect2_)
    beta2 = sqrt(var.effect2)*beta2_
    var.interaction = effect.interaction_*var.rt.part/(1-effect.interaction_)
    interaction = sqrt(var.interaction)*interaction_
    
    
    for (i in 1:N){
        
        
        
        intercept <- 350 + rnorm(1, 0, 30)
        
        data <- conditions %>% 
            dplyr::rename(Faktor1= Var1 , Faktor2= Var2) %>%
            rowwise()%>%
            mutate(rt = rexGAUS(1, intercept + beta1*Faktor1 + beta2*Faktor2 + interaction*Faktor1*Faktor2, 
                                sd.rt, 
                                nu.rt),
                   vpnr = i,
                   Faktor1= as.factor(Faktor1),
                   Faktor2= as.factor(Faktor2))
        
        if (i==1){
            data_all = data
        } else {
            data_all= rbind(data_all, data)
        }
        #write.csv(data, paste0("Alle Daten/J", formatC(i, width=2, flag="0"), "_example_eep.csv" ), )
    }
    
    data_all <- data_all %>% 
        group_by(vpnr,Faktor1,Faktor2) %>%
        summarise(rt= mean(rt, na.rm=T))

    anova <- ezANOVA(data_all, rt, wid = vpnr, within = .(Faktor1 , Faktor2), detailed = T, return_aov=T, type=2)
    return(list("data_all" = data_all, "anova" = anova))
}


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    changed <- eventReactive(input$nTrials,{
        print("N changed")
        N<- input$N
    })
    
    newExample<- eventReactive(input$newsample,{
        print("new example")
        shinyjs::toggle("respFeed")
        res <- simulate(input$N,input$nTrials)
        res
    })
    
    
    output$plot1 <- renderPlot({
        if (is.null(newExample())){
            return(NULL)
        }
        data_all <- newExample()$data_all
        data_all$hj <- (as.numeric(as.character(data_all$Faktor1)) + 1)/2
        ggplot2::ggplot(data_all, aes(x= Faktor2, y =rt, group= Faktor1, color = Faktor1 )) +
            geom_point(aes(group= interaction(vpnr  ,Faktor1)),alpha=0.3) +
            geom_line(aes(group= interaction(vpnr  ,Faktor1)),alpha=0.2)+
            stat_summary(fun=mean , geom="line", size=1)+
            stat_summary(fun=mean , geom="point", size=2)+
            stat_summary(aes(group=1), fun=mean , geom="line")+ 
            stat_summary(aes(label=round(..y..,2),hjust = hj), fun=mean, geom="text", size=6,vjust=0
            )+
            stat_summary(aes(group=1),fun=mean , geom="point", size=2) + 
            xlab("Faktor 2")
    })
    
    output$plot2 <- renderPlot({
        if (is.null(newExample())){
            return(NULL)
        }
        data_all <- newExample()$data_all
        data_all$hj <- (as.numeric(as.character(data_all$Faktor2)) + 1)/2
        print(data_all)
        ggplot2::ggplot(data_all, aes(x= Faktor1, y =rt, group= Faktor2, color = Faktor2)) +
            geom_point(aes(group= interaction(vpnr  ,Faktor2)),alpha=0.3) +
            geom_line(aes(group= interaction(vpnr  ,Faktor2)),alpha=0.2)+
            stat_summary(fun=mean , geom="line", size=1)+
            stat_summary(fun=mean , geom="point", size=2)+
            stat_summary(aes(group=1), fun=mean , geom="line")+
            stat_summary(aes(group=1),fun=mean , geom="point", size=2)+ 
            stat_summary(aes(label=round(..y..,2),hjust = hj), fun=mean, geom="text", size=6,vjust=0
                         ) +
            xlab("Faktor 1")
    })
    
    output$anova <- renderTable({
      newExample()$anova$ANOVA
    })
    
    newResults<- observeEvent(input$checkResps ,{
        shinyjs::toggle("respFeed")
        #output$respFeed <- renderText({"Feedback:"})
        respStat <- input$respStat
        respInter <- input$respInter
        anova <- newExample()$anova$ANOVA
        
        # Check stats
        signEffects <- anova$Effect[which(anova$`p<.05` == "*")]
        signEffects <- signEffects[which(signEffects != '(Intercept)')]                
        statsCorrect = setequal(signEffects,respStat)
        
        # Interpretation Correct
        data_all_sum <-  newExample()$data_all %>% 
            group_by(Faktor2, Faktor1) %>%
            summarise(rt = mean(rt))
        
        Faktor1 <- as.vector(as.numeric(data_all_sum %>%
            pull(Faktor1)))
        
        Faktor2 <- as.vector(as.numeric(data_all_sum %>%
                                            pull(Faktor2)))
        RT <- as.vector(as.numeric(data_all_sum %>%
                                            pull(rt)))
        
        print(data_all_sum)
        print(RT[Faktor2==2])
        print(RT[Faktor2==1])
        print(RT[Faktor1==2])
        print(RT[Faktor1==1])
        
        Faktor2Int <- sum(RT[Faktor2==2] > RT[Faktor2==1]) %in% c(0,2)
        Faktor1Int <- sum(RT[Faktor1==2] > RT[Faktor1==1]) %in% c(0,2)
        intCorrect = setequal(c("Faktor1","Faktor2")[c(Faktor1Int,Faktor2Int)],respInter)
        
        outputText <- paste0("Feedback:\n",
                         "Frage 1: ",
                         statsCorrect ,
                         " Korrekt:",
                         paste0(signEffects, collapse = '; ') ,
                         "\n",
                         "Frage 2: ",
                         intCorrect,
                         " Korrekt:",
                         paste0(c("Faktor1","Faktor2")[c(Faktor1Int,Faktor2Int)], collapse = '')
                         )

        output$respFeed <- renderText({
            print(outputText)
            })
        print("new results")
    })
    
})

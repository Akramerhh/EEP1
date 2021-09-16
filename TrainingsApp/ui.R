#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinycssloaders)
library(shinyWidgets)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # App title ----
    titlePanel("Interaktionen \n interpretieren"),
    
    # Sidebar layout with input and output definitions ----
    sidebarLayout(
        
        # Sidebar panel for inputs ----
        sidebarPanel(
            
            
            actionButton("newsample", "Naechster Versuch"),
            
            sliderInput("N",
                        "Nummer der Versuchspersonen:",
                        value = 20,
                        min = 1,
                        max = 100),
            
            sliderInput("nTrials",
                        "Trials pro Bed.:",
                        value = 60,
                        min = 1,
                        max = 200),
            
            
            br(),
            
            
            pickerInput(
                inputId = "respStat",
                label = "Welcher Effekt ist signifikant?",
                choices = c("Faktor1", "Faktor2", "Faktor1:Faktor2" ),
                options = list(
                    `actions-box` = TRUE,
                    size = 10,
                    `selected-text-format` = "count > 3"
                ),
                multiple = TRUE
            ),
            
            pickerInput(
                inputId = "respInter",
                label = "Welcher Haupteffekt ist interpretierbar?",
                choices = c("Faktor1", "Faktor2"),
                options = list(
                    `actions-box` = TRUE,
                    size = 10,
                    `selected-text-format` = "count > 3"
                ),
                multiple = TRUE
            ),
            
            
            actionButton("checkResps", "Antworten pruefen"),
            verbatimTextOutput("respFeed")
        ),
        
        # Main panel for displaying outputs ----
        mainPanel(
            # plotOutput("plot1"),
            # plotOutput("plot2")
            #Output: Tabset w/ plot, summary, and table ----
            tabsetPanel(#type = "tabs",
                tabPanel("Plot1", withSpinner(plotOutput("plot1"))),
                                    tabPanel("Plot2", withSpinner(plotOutput("plot2"))),
                                    tabPanel("Anova", withSpinner(tableOutput("anova")))
            )
            
            
        )
    )
))

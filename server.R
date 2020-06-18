#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a scatter plot
shinyServer(function(input, output) {
    model1 <- lm(waiting ~ eruptions, data = faithful)
     
    model1pred <- reactive({
        eruptionInput <- input$sliderEruption
        predict(model1, newdata = data.frame(eruptions = eruptionInput))
    })
    
    output$plot1 <- renderPlot({
    eruptionInput <- input$sliderEruption
        
    plot(faithful$eruptions, faithful$waiting, xlim = c(1,6), ylim = c(40,100), xlab= "Eruption time (min)", ylab = "Waiting time to the next eruption (min)", bty = "n", pch = 16)
    if(input$showModel1){
            abline(model1, col = "red", lwd = 2)
        }
        
        legend(1, 90,"Linear Model Prediction", col = "red", lwd = 2, bty = "n", cex = 1.1)
        points(eruptionInput, model1pred(), col = "red", pch = 16, cex = 1.6)
    })
        
        output$pred1 <- renderText({
            round(model1pred(),2)
        })
        
})
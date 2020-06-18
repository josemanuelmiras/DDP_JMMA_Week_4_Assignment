#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a scatterplot and fits linear model
shinyUI(fluidPage(
    # Application title
    titlePanel("Predict time to the next eruption (in minutes) of the Faithful geyser"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderEruption", "What was the eruption time?", 0.5, 6, value = 3),
            checkboxInput("showModel1", "Show/Hide Linear Model", value = TRUE),
            submitButton("Submit")
        ),
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted waiting time (minutes) from the linear model:"),
            textOutput("pred1")
        )
    )
))
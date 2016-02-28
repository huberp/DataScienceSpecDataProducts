
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

source("metrics.R")

shinyUI(fluidPage(

  # Application title
  titlePanel("Explore the Software Metrics of junit(tm)"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      radioButtons("selectedMetric", "Select Software Metric", choices=asRadioChoices())
    ),

    # Show a plot of the generated distribution
    mainPanel(
      textOutput("descText"),
      plotOutput("treemapPlot"),
      plotOutput("distPlot")
    )
  ),
  mainPanel("Explanation: 
            Software Metrics are used to assess the quality of the software. Software Metrics are data about software.
            Please select a software metric on the left side. 
            A treemap which shows the hierachical distribution over the components of junit(tm) and a histogram will be plotted.
            If available a text explaining the metric will be displayed")
))

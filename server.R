
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(treemap)

source("metrics.R")

wd.datapath <- paste0(getwd(),"/data")
wd.init <- getwd()

##
## Read in precomputed data, see my guthub Project here: https://github.com/huberp/SoftwareAnalyticsWithR
##
classData <- readRDS(paste0(wd.datapath,"/junit_classData.rds"));
pkgData   <- readRDS(paste0(wd.datapath,"/junit_pkgData.rds"));

##
## do some data cleansing in order to prevent "vSize contains negative values" in treemap computation
##
classData[classData$DIT < 0, "DIT"] <- 1;
classData[classData$CW < 0, "CW"] <- 0;

##
##
mergedData <- merge(classData,pkgData[,c("ID","packageName")], by.x="parentPackage", by.y="ID",all.x=TRUE)

shinyServer(function(input, output) {

  output$descText <- renderText({ getDescriptionTextByAbbrv(input$selectedMetric) });
  ##
  ##build a treemap
  output$treemapPlot <- renderPlot({
    ##
    treemap(dtf=mergedData,index=c("packageName","name"),input$selectedMetric, title=paste("Treemap for Metric library(rsconnect)",getLongTextByAbbrv(input$selectedMetric)))

  })
  ##
  ##and a distribution
  output$distPlot <- renderPlot({
    ##
    hist(x=mergedData[, input$selectedMetric], xlab=input$selectedMetric,main = paste("Histogram of Metric" , getLongTextByAbbrv(input$selectedMetric)))
    
  })
})

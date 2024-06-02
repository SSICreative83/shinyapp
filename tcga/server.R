library(shiny)
library(ggplot2)
library(dplyr)

shinyServer(function(input, output) {
  
  data <- reactive({
    req(input$RNA, input$SNP, input$CNV, input$Methylation, input$Mutation)
    RNA <- read.csv(input$RNA$datapath)
    SNP <- read.csv(input$SNP$datapath)
    CNV <- read.csv(input$CNV$datapath)
    Methylation <- read.csv(input$Methylation$datapath)
    Mutation <- read.csv(input$Mutation$datapath)
    
    list(RNA = RNA, SNP = SNP, CNV = CNV, Methylation = Methylation, Mutation = Mutation)
  })
  
  analyze_data <- eventReactive(input$analyze, {
    data <- data()
    # Perform integration and analysis (Placeholder code)
    integrated_data <- merge(data$RNA, data$SNP, by = "sample_id")
    integrated_data <- merge(integrated_data, data$CNV, by = "sample_id")
    integrated_data <- merge(integrated_data, data$Methylation, by = "sample_id")
    integrated_data <- merge(integrated_data, data$Mutation, by = "sample_id")
    
    integrated_data
  })
  
  output$overviewPlot <- renderPlot({
    integrated_data <- analyze_data()
    ggplot(integrated_data, aes(x = RNA_feature, y = SNP_feature)) +
      geom_point() +
      labs(title = "Overview of Integrated Data", x = "RNA", y = "SNP")
  })
  
  output$detailedPlot <- renderPlot({
    integrated_data <- analyze_data()
    ggplot(integrated_data, aes(x = RNA_feature, y = CNV_feature)) +
      geom_point() +
      labs(title = "Detailed Analysis", x = "RNA", y = "CNV")
  })
  
  output$dataTable <- renderTable({
    integrated_data <- analyze_data()
    head(integrated_data)
  })
})

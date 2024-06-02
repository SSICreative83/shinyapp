library(shiny)

shinyUI(fluidPage(
  titlePanel("TCGA Multi-Omics Integration Analysis"),
  
  sidebarLayout(
    sidebarPanel(
      fileInput("RNA", "Upload RNA Data", accept = ".csv"),
      fileInput("SNP", "Upload SNP Data", accept = ".csv"),
      fileInput("CNV", "Upload CNV Data", accept = ".csv"),
      fileInput("Methylation", "Upload Methylation Data", accept = ".csv"),
      fileInput("Mutation", "Upload Mutation Data", accept = ".csv"),
      actionButton("analyze", "Analyze")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Overview", plotOutput("overviewPlot")),
        tabPanel("Detailed Analysis", plotOutput("detailedPlot")),
        tabPanel("Data Table", tableOutput("dataTable"))
      )
    )
  )
))

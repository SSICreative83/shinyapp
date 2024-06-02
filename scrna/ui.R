library(shiny)

shinyUI(fluidPage(
  titlePanel("Single Cell Omics Integration Analysis"),
  
  sidebarLayout(
    sidebarPanel(
      fileInput("scRNAseq", "Upload scRNA-Seq Data", accept = ".csv"),
      fileInput("scATACseq", "Upload scATAC-Seq Data", accept = ".csv"),
      fileInput("CyTOF", "Upload CyTOF Data", accept = ".csv"),
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

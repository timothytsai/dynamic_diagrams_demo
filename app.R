library(shiny)
library(dplyr)

ui <- fluidPage(
  titlePanel("Dynamic Diagrams Demo"),
  mainPanel(
    h3("column selection"),
    uiOutput("chart_select")
    # ,
    # h3("DataTable"),
    # dataTableOutput("table")
  )
)

server <- function(input, output) {
  output$chart_select <- renderUI({
    selectInput(
      "chart_select",
      "Select Chart Type",
      choices = c("data A", "data B", "data C"),
      selected = "data A"
      )
  })
}

shinyApp(ui, server)
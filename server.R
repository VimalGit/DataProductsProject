library(shiny)

shinyServer(
function(input, output) {
  # Reactive expression for document term matrix
  terms <- reactive({
        getTermMatrix(input$inputText)
  })
  
  output$plot <- renderPlot({
    v <- terms()
    wordcloud(names(v), v, scale=c(4,0.5),
              min.freq = input$frequency, 
              max.words=input$max_words,
              colors=brewer.pal(12, "Paired"))
  })
}
)
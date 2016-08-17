library(shiny)

textareaInput <- function(inputID, label, value="Sample Text", rows=10, columns=40) {
  HTML(paste0('<div class="form-group shiny-input-container">
              <label for="', inputID, '">', label,'</label>
              <textarea id="', inputID, '" rows="', rows,'" cols="', 
              columns,'">', value, '</textarea></div>'))
}

shinyUI(
  fluidPage(
  # Title
  titlePanel("Course Project - Word Cloud"),
  h4("Vimal Natarajan"),  
  sidebarLayout(
    # Visualize in Word Cloud
    mainPanel(
      plotOutput("plot")
    ),
    sidebarPanel(
      tabsetPanel(
        tabPanel (
          "Plot",
          textareaInput("inputText", "Input Text"),
          hr(),
          sliderInput("frequency",  "Minimum Frequency:", min = 1,  max = 50, value = 15),
          sliderInput("max_words",  "Maximum Number of Words:", min = 1,  max = 300,  value = 100)
        ),
        tabPanel (
          "Documentation",
          helpText("Input Text: Use this text area to enter words, sentences, paragraph etc. 
                   The words are delimited by spaces.
                   Punctuation is removed. Few common words are removed. Current common words removed are 'and', 'the', 'are'.
                   The minimum word length is 1 and the maximum word length is 12. Any word that is more than length 15 will not be displayed."
                   ),
          helpText("Minimum Frequency: Words with frequency below this value will not be displayed."
          ),
          helpText("Maximum Number of Words: Maximum number of words to be displayed. Least frequently occuring terms will be dropped."
          )
          )
      )
    )
  )
)
)

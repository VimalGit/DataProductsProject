library(shiny)

textareaInput <- function(inputID, label, rows=10, columns=40) {
  
  default_text <- "
Good morning. In less than an hour, aircraft from here will join others from around the world. 
And you will be launching the largest aerial battle in this history of mankind.
Mankind -- that word should have new meaning for all of us today.
We can't be consumed by our petty differences anymore.
We will be united in our common interests.
Perhaps its fate that today is the 4th of July, and you will once again be fighting for our freedom, not from tyranny, oppression, or persecution -- but from annihilation.
We're fighting for our right to live, to exist.
And should we win the day, the 4th of July will no longer be known as an American holiday, but as the day when the world declared in one voice:
We will not go quietly into the night!
We will not vanish without a fight!
We're going to live on!
We're going to survive!
Today, we celebrate our Independence Day!  
"

  HTML(paste0('<div class="form-group shiny-input-container">
              <label for="', inputID, '">', label,'</label>
              <textarea id="', inputID, '" rows="', rows,'" cols="', 
              columns,'">', default_text, '</textarea></div>'))
}

shinyUI(
  fluidPage(
  # Title
  titlePanel("Course Project - Word Cloud"),
  h4("Vimal Natarajan"),  
  h5("August 20, 2016"),
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
          sliderInput("frequency",  "Minimum Frequency:", min = 1,  max = 50, value = 1),
          sliderInput("max_words",  "Maximum Number of Words:", min = 1,  max = 300,  value = 300)
        ),
        tabPanel (
          "Documentation",
          helpText("Input Text: Use this text area to enter words, sentences, paragraph etc. 
                   The words are delimited by spaces. 
                   You may also copy and paste text from news articles. 
                   Punctuation is removed. Few common words(e.g. and, the, is etc.) are removed.
                   The minimum word length is 1 and the maximum word length is 12. Any word that is more than length 12 will not be displayed."
          ),
          helpText("Minimum Frequency: Words with frequency below this value will not be displayed."
          ),
          helpText("Maximum Number of Words: Maximum number of words to be displayed. Least frequently occuring terms will be dropped."
          )
        )
      )
    )
    )
))


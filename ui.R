
textareaInput <- function(inputID, label, value="Sample Text", rows=10, columns=40) {
  HTML(paste0('<div class="form-group shiny-input-container">
              <label for="', inputID, '">', label,'</label>
              <textarea id="', inputID, '" rows="', rows,'" cols="', 
              columns,'">', value, '</textarea></div>'))
}

fluidPage(
  # Title
  titlePanel("Course Project - Word Cloud"),
  h4("Vimal Natarajan"),  
  sidebarLayout(
    sidebarPanel(
      textareaInput("inputText", "Input Text"),
      hr(),
      sliderInput("frequency",       "Minimum Frequency:", min = 1,  max = 50, value = 15),
      sliderInput("max_words",  "Maximum Number of Words:", min = 1,  max = 300,  value = 100)
    ),
    
    # Viualize in Word Cloud
    mainPanel(
      plotOutput("plot")
    )
  )
)


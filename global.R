library(tm)
library(wordcloud)

# Using "memoise" to automatically cache the results
getTermMatrix <- function(inputText) {

  my_corpus = Corpus(VectorSource(inputText))
  my_corpus = tm_map(my_corpus, content_transformer(tolower))
  my_corpus = tm_map(my_corpus, removePunctuation)
  my_corpus = tm_map(my_corpus, removeWords,c("the", "and", "are", "to", "a", "in", "as", "is", "was", "of"))
  
  my_TDM = TermDocumentMatrix(my_corpus,
                             control = list(wordLengths=c(1,12))
                             )
  
  TDM_matrix = as.matrix(my_TDM)
  
  sort(rowSums(TDM_matrix), decreasing = TRUE)
}


Word Cloud
========================================================
author: Vimal Natarajan
date: August 20, 2016
autosize: true

<small>
<BR>
Course Project for the module Data Products in Johns Hopkins University Data Science Specialization
<BR>
</small>

Word Cloud Executive Summary
========================================================

This project creates a Word Cloud in realtime for any text or paragraph entered in the input text area. The user can also copy and paste the transcript of entire speeches, news articles, book contents etc, to get a feel of the most common words used. The Word Cloud gets updated in realtime as and when the user enters or modifies the text.

## Cool Factor
* It is really fun to visually see the Word Cloud changing in realtime based on the text or some article or speeches.
* This application could also be used to get some sentiment analysis. For example, by analyzing the transcript of a person's speech, we could get some insights at the language used, theme spoken etc.

How to use
========================================================

* __Input Text:__ Use this text area to enter words, sentences, paragraph etc. The words are delimited by spaces. You may also copy and paste text from news articles. Punctuation is removed. Few common words(e.g. and, the, is etc.) are removed. The minimum word length is 1 and the maximum word length is 12. Any word that is more than length 12 will not be displayed. 

* __Minimum Frequency:__ Words with frequency below this value will not be displayed. 

* __Maximum Number of Words:__ Maximum number of words to be displayed. Least frequently occuring terms will be dropped. 
 

Core Logic
========================================================
The following code identifies the different words and their frequency.



```r
  my_corpus = Corpus(VectorSource("One Two Two Three Three Three"))
  my_corpus = tm_map(my_corpus, content_transformer(tolower))
  my_TDM = TermDocumentMatrix(my_corpus, control = list(wordLengths=c(1,12)))
  TDM_matrix = as.matrix(my_TDM)
```

<small>The output sorted in decreasing order of the word frequency.</small>


```
three   two   one 
    3     2     1 
```

Enhancements
========================================================

The following enhancements could be added to the application.

* Instead of copy and paste of articles, the application can be given an URL and it could pull the contents of the URL and plot the Word Cloud.
* The words that needs to be filtered could be dynamically gotten as input instead of hardcoding.

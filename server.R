library(shiny)
#library(qdap)
library(stylo)

CrystalBall <- function(textInput){
  
  
  textInput<-txt.to.words.ext(textInput)
  wordCount<-length(textInput)
  
  df_ngram<-readRDS("df_ngram.RData")
  
  if (wordCount>=3) {
    textInput <- textInput[(wordCount-2):wordCount] }
  
  
  else if(wordCount==2) {
    textInput <- c("NA",textInput)   
  }
  
  else {
    textInput <- c("NA","NA",textInput)
  }
  
  # Prediction
  wordPrediction=0
  #wordPrediction <- as.character(df_ngram[df_ngram$w1==textInput[1] & 
  # df_ngram$w2==textInput[2] & 
  #df_ngram$w3==textInput[3],][1,]$w4)
  
  for(i in 1:4)
    wordPrediction[i] <- as.character(df_ngram[df_ngram$w1==textInput[1] & 
                                                 df_ngram$w2==textInput[2] & 
                                                 df_ngram$w3==textInput[3],][i,]$w4)
  
  catn <- function(x, append="\t\t\t"){
    cat(x); cat(append)}
  
  catn("1.")
  catn(wordPrediction[1])
  
  if(!is.na(wordPrediction[2])) {catn("2.")
    catn(wordPrediction[2])}
  
  if(!is.na(wordPrediction[3])) {catn("3.")
    catn(wordPrediction[3])}
  
  if(!is.na(wordPrediction[4])) {catn("4.")
    catn(wordPrediction[4])}
  
  return (textInput)
}

shinyServer(function(input,output){
  wordPrediction<-reactive({
    textInput<-input$textInput
    wordPrediction<-CrystalBall(textInput)
  })
  output$predictedWord <- renderPrint(wordPrediction())
  output$enteredWords <- renderText({input$textInput})
})
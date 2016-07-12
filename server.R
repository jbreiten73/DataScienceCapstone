library(shiny)

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
  nextWord=0
  
  
  for(i in 1:4)
    nextWord[i] <- as.character(df_ngram[df_ngram$w1==textInput[1] & 
                                                 df_ngram$w2==textInput[2] & 
                                                 df_ngram$w3==textInput[3],][i,]$w4)
  
  if(is.na(nextWord[1]))
  { 
    
    for(i in 1:4)
      nextWord[i] <- as.character(df_ngram[df_ngram$w2==textInput[2] & df_ngram$w3==textInput[3],][i,]$w4)
  }
  
  
  if(is.na(nextWord[1]))
  { 
    
    for(i in 1:4)
      nextWord[i] <- as.character(df_ngram[df_ngram$w3==textInput[3],][i,]$w4)
  }
  
  if(is.na(nextWord[1]))
  { 
      nextword=0;
      nextWord[1]="the";
      nextWord[2]="to";
      nextWord[3]="and";
      nextword[4]="a";
   
  }
  
  catn <- function(x, append="\t\t\t"){
    cat(x); cat(append)}
  
  catn("1.")
  catn(nextWord[1])

  if(!is.na(nextWord[2])) {catn("2.")
    catn(nextWord[2])}
  
  if(!is.na(nextWord[3])) {catn("3.")
    catn(nextWord[3])}
  
  if(!is.na(nextWord[4])) {catn("4.")
    catn(nextWord[4])}
  
 
  
  return (textInput)
}

shinyServer(function(input,output){
  nextWord<-reactive({
    textInput<-input$textInput
    nextWord<-CrystalBall(textInput)
  })
  output$predictedWord <- renderPrint(nextWord())
  output$enteredWords <- renderText({input$textInput})
})
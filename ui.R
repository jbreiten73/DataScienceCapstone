


shinyUI(
              fluidPage(
                tags$head(tags$style(
                  HTML('
                       #sidebar {
                           background-color: #ffddff;
                       }
                       #mainbar{
                          background-color: #abdddd;
                       }
                      body,label,input,button,select{
                       font-family: "Arial";
                      }')
                )),
                   headerPanel("Next Word Prediction"),
                            
                          sidebarPanel(
                    
                                id="sidebar",
            
                            
                               textInput("textInput", 
                                        label = h3("Enter your text here:"),
                                                        value = 
                                        ),
                                             
                                           
                                          
                                              h4("What you have entered:"),
                                            textOutput("enteredWords"),
                               tags$head(tags$style("#enteredWords{color: darkred;
                                                    font-size: 20px;
                                                    font-style : italic}")),
                               h5("Hint: Enter your phrase using quotation marks and use only lowercase letters; do not use any punctation marks"),
                               br(),
                               h5("Attention: The output is ready, as soon as your input appears completely in the 'what you have entered' field")
                              
              
                              ),
                  mainPanel( 
                   id="mainbar"  ,
                   h2("The predicted next word:"),
                 textOutput("predictedWord"),
                 h5("These are propositions how to complete the phrase you have entered: they are based on probabilities"),
                 tags$head(tags$style("#predictedWord{color:blue;
                                                    font-size: 30px;
                                      font-style : italic}"))
                 
                 )
)
)               
                   
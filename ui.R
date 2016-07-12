


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
                               h6("Please note: The prediction is not finished until the phrase you
                              have entered appears completely in the 'What you have entered' field!")
                               
              
                              ),
                  mainPanel( 
                   id="mainbar"  ,
                   h2("The predicted next word:"),
                   textOutput("predictedWord"),
                 tags$head(tags$style("#predictedWord{color:blue;
                                                    font-size: 30px;
                                      font-style : italic}"))
                 
                 )
)
)               
                   
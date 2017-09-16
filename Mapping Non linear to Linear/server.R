library(ggplot2)

library(rsconnect)
shinyServer(
  function(input, output) {
    output$attplot <- renderPlot({
      # Converting label to factor type
      attribute_space <- read.csv("new_data.csv")
      ggplot(attribute_space,aes(word_freq_lottery,word_freq_office))+geom_point(aes(col=Type))
      
    })
    
    output$featureplot <- renderPlot({
     
      attribute_space <- read.csv("new_data.csv")
      
      a<-input$a
      b<-input$b
  
      
      # Making feature space "X2"
      attribute_space$word_freq_office <- (attribute_space$word_freq_lottery-a)^2+(attribute_space$word_freq_office-b)^2
      
      
      mdl <- glm( Type ~ . , data = attribute_space , family=binomial)
      
      slope <- coef(mdl)[2]/(-coef(mdl)[3])
      intercept <- coef(mdl)[1]/(-coef(mdl)[3])
      
      ggplot(attribute_space,aes(word_freq_lottery,word_freq_office))+geom_point(aes(col=Type))+
        geom_abline(slope = slope,intercept = intercept,size=1.1)
      
    })
    
   
  
  
    
    
  }   
    
)
    
   











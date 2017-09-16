library(shiny)
library(shinydashboard)

dashboardPage( 
  
dashboardHeader(title = HTML(paste(icon('cube'),"Cost of Misclassifications")),  titleWidth = 300),

dashboardSidebar(
  
  sliderInput('C', 'Tuning parameter C', value = 0.5, min = 0.001, max = 50, step = 0.5)
  
  ),


dashboardBody(
  h3("Cost of Misclassifications"),
  p("As you can see in the below plot, Red data points belongs to versicolor 
     While the black data points belongs to the class setosa."),
    
p("when the c value is small, Misclassification is allowed i.e. some red(versicolor) data points fall on the black (setosa) side.
But when the C value is increased,strictly no points are misclassified."),
  fluidRow(
    box(
      title  ="SVM Decision Surface",status = "info", solidHeader = TRUE,collapsible = TRUE,
      width = 9,
      plotOutput("newPlot")
    ))
  
  
  
  
  )
  



)














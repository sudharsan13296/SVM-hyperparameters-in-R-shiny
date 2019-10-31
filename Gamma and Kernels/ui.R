library(shiny)
library(shinydashboard)


dashboardPage( 
  
  dashboardHeader(title = HTML(paste(icon('cube'),"SVM Hyperparameters")),  titleWidth = 300),
  
  dashboardSidebar( disable = FALSE,
    
    sliderInput('C', 'Tuning parameter C', value = 0.5, min = 0.001, max = 50, step = 0.5),
    sliderInput('gamma', 'Tuning parameter Gamma (Sigma)', value = 1, min = 0.001, max = 50, step = 0.05),
    radioButtons("kernel", "Choice of kernels",
                 c("Linear" = "linear",
                   "Radial (RBF)" = "radial"), selected = "linear")
    
  ),
  
  
  dashboardBody(
    h3("SVM Hyperparameters"),
    p("As you can see in the below plot, Red data points belongs to the class versicolor 
      While the black data points belongs to the class setosa."),
    
    p(" When the value of gamma is increased, more non-linearity is added. Remember that gamma is applicable only for RBF kernel not for linear kernel.
      
      "),
    fluidRow(
      box(
        title  ="SVM Decision surface",status = "info", solidHeader = TRUE,collapsible = TRUE,
        width = 9,
        plotOutput("newPlot")
      ))
    


























library(shiny)
library(shinydashboard)

dashboardPage( 
  
  dashboardHeader(title = HTML(paste(icon('cube'),"Mapping NonLinear to Linear")),  titleWidth = 350),
  
  dashboardSidebar(
    
   sidebarMenu(
      menuItem("Attribute Space", tabName = "AttributeSpace", icon = icon("dashboard")),
      
      menuItem("Feature Space", tabName = "FeatureSpace", icon = icon("dashboard"))

    )
    
  ),
  
  
  
  dashboardBody(
    
    tabItems(
      # First tab content
      
      
      tabItem(tabName = "AttributeSpace",
              fluidRow(
                box( title="Attribute Space",status = "primary", solidHeader = TRUE,
                     collapsible = FALSE, width = 9,
                  plotOutput("attplot")))
      ),
      
      
      tabItem(tabName = "FeatureSpace",
              fluidRow(
               
                
                box(
                  title = "word_freq_office = (word_freq_lottery - a)^2 + (word_freq_office - b)^2", status = "primary", solidHeader = TRUE, width=3,height = 280,
                  sliderInput("a", "a", 0, 5, 1),
                  sliderInput("b", "b", 0, 1, 0.01)
                ),
                box(title = "Feature Space", status = "primary", solidHeader = TRUE,
                    collapsible = FALSE,width=9,
                    plotOutput("featureplot", height = 500))
              )
              
              
              
      )
      )
      
      # Second tab content
    
    )
  )

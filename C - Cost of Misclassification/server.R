library(ggplot2)
library(e1071)

library(rsconnect)
data(iris)


shinyServer(
  function(input, output) {
    output$newPlot <- renderPlot({
      data(iris)
      x<- iris[1:100, c("Sepal.Length", "Sepal.Width", "Species")]
      x$Species <- factor(x$Species)
      set.seed(145)
      C <- input$C
      
     
      model <- svm(Species ~ ., data = x, scale = FALSE, kernel = "linear", cost = C)
      plot(model, x,fill=TRUE, symbolPalette = palette(),svSymbol = "o", dataSymbol = "o")

    })
    output$pred <- renderTable({
      set.seed(145)
      n <- input$numData
      shift <- input$shift
      C <- input$C
      gamma <- input$gamma
      y <- c(rep(1,n/2), rep(-1,n/2))
      myData$y <- as.factor(y)
      model <- svm(Species ~ ., data = xdata, scale = FALSE, kernel = 'radial', cost = C, gamma = gamma)
      
    })
  }
)
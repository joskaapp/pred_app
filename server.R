# pred_app
Predicción lineal alumnos INSA

library(shiny)

#Generar dades per a la primera execució del shinyServer
set.seed(138)
edat<-rnorm(150,28,sd=2)
notas<-10+1*edat+rnorm(50,sd=8)
reg<-lm(notas~edat)

notas_pred<-function(edat){
reg$coef[1]+reg$coef[2]*edat
}

shinyServer(
function(input,output){
#Generar dades cada vegada que s'usa l'aplicació
set.seed(138)
edat<-rnorm(150,28,sd=2)
notas<-10+1*edat+rnorm(50,sd=8)
reg<-lm(notas~edat)
output$inputValue<-renderPrint({input$edat})
output$prediction<-renderPrint({notas_pred(input$edat)})
}
)

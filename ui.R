# pred_app
Predicción lineal alumnos INSA

library(shiny)

#Generar dades
set.seed(138)
edat<-rnorm(150,28,sd=2)
notas<-10+1*edat+rnorm(50,sd=8)
reg<-lm(notas~edat)

shinyUI(

pageWithSidebar(
headerPanel("Ejemplo INSA"),

sidebarPanel(
p("Introducir valor para realizar la prediccion",style = "color:#B30838"),
numericInput("edat","Edat alumnos",28,min=min(round(notas,1)),max=max(round(notas,1)),step=1),
submitButton("Predecir"),
br(),
br(),
br(),
br(),
br()),

mainPanel(
h3("Prediccion"),
h4("Valor introducido"),
verbatimTextOutput("inputValue"),
h4("Nota predicha"),
verbatimTextOutput("prediction"),
img(src="INSA.png"),
br(),
br(),
h5("Visita la web de",a("INSA Bussines School",href = "http://www.insaweb.net/?lang=es")))
))

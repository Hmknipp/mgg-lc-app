library(shiny)
library(plotly)
library(DT)

shinyUI(
  navbarPage("GG MGG Explorer", id="nav",       
             tabPanel("Interactive map",
                      div(class="outer",
                          fluidRow(
                            column(8, plotlyOutput("map")),
                            column(4,
                                   checkboxInput("gg", "Gaia's Guide", TRUE),
                                   checkboxInput("mgg", "Bob Damron's Address Book", TRUE),
                                   checkboxInput("noncontiguous", "Include non-contiguous states", FALSE),
                                   selectInput("cityvalue", "Select Value", choices = unique(mgg.gg.data$geocode.value))
                            )
                          ),
                          DTOutput('dtable'),
                          div(style = "padding: 20px;",
                              tags$span(style = "font-size: 20px; color: #0F8554;", "■"),
                              tags$span(" Gaia's Guide"),
                              br(),
                              tags$span(style = "font-size: 20px; color: #6F4070;", "■"),
                              tags$span(" Bob Damron's Address Book")
                          )
                      ),
             ),
  )
)
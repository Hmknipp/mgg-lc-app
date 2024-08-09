library(leaflet)
library(RColorBrewer)
library(scales)
library(lattice)
library(dplyr)
library(ggplot2)
library(plotly)
library(maps)
library(DT)

function(input, output, session) {
  # Reactive expression for filtered data
  filteredData <- reactive({
    req(mgg.gg.data) # Ensure mgg.gg.data is available
    data <- mgg.gg.data
    
    #data <- separate(data, geocode.value, into = c("city", "state", "country"), sep = ",")
    
    if (input$noncontiguous == FALSE) {
      data <- data %>% filter(!grepl("HI|AK|VI", geocode.value))
    }
    
    if (input$gg == FALSE) {
      data <- data  %>% filter(publication != "Gaia's Guide")
    } 
    
    if (input$mgg == FALSE) {
      data <- data  %>% filter(publication != "Bob Damron's Address Book")
    } 
    
    data
    
  })
  
  filteredTable <- reactive({
    req(full.data)
    
    tbldata <- full.data
    
    tbldata <- tbldata %>% filter(input$cityvalue == geocode.value)
    
    tbldata <- tbldata  %>% select(-city, -state, -country, -notes, -lon, -lat, -geoAddress)
    
    tbldata
  })
  
  #map 
  
  output$map <- renderPlotly({
    ggplot(data = filteredData(), aes(x = lon, y = lat)) +
      geom_polygon(data = map_data("state"), aes(x = long, y = lat, group = group), fill = "gray90", color = "white") +
      geom_point(aes(size = relative.percentage, color = publication, text = paste("Publication:", publication, "<br>Count:", count, "<br>Geocode Value:", geocode.value)), alpha = 0.5) +
      scale_color_manual(values = c("#0F8554", "#6F4070")) +
      theme(legend.position = "none")
  })
  
}
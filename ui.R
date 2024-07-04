library(leaflet)

navbarPage("GG MGG Explorer", id="nav",       
    tabPanel("Interactive map",
        div(class="outer",
        # If not using custom CSS, set height of leafletOutput to a number instead of percent
        
        plotlyOutput("map"),
                                  
         checkboxInput("gg", "Gaia's Guide", TRUE),
         checkboxInput("mgg", "Bob Damron's Address Book", TRUE),
         checkboxInput("noncontiguous", "Include non-contiguous states", FALSE),
        
           ),
),
)

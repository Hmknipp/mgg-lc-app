library(tidyverse)
mgg.gg.data <- read.csv(file = "relative-location-nocruisy-data-all-years.csv")



mgg.data <- mgg.gg.data %>% filter(publication == "Bob Damron's Address Book")
gg.data <- mgg.gg.data %>% filter(publication == "Gaia's Guide")

gg.data <- gg.data  %>% mutate(uniqueID = paste("gg.", row_number(), sep=""))
mgg.data <- mgg.data  %>% mutate(uniqueID = paste("mgg.", row_number(), sep=""))

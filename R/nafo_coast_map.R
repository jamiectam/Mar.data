library(sf)
library (here)
library(ggplot2)
library(tidyverse)

#load CoastSF1
coastsf<-readRDS(here("data/CoastSF1.rds"))

mar_nafo_land_sf<-NAFOSubunitsLnd_sf %>%
  filter(NAFO_1 %in% c("4V", "4W", "4X", "5Y", "<LAND>"))

mar_nafo_sf<-NAFOSubunits_sf %>%
               filter(NAFO_1 %in% c("4V", "4W", "4X", "5Y"))|>
                select(NAFO_1, geometry)

mar_nafo4x<-NAFOSubunits_sf |>
            filter(NAFO_1 %in% c("4X")) 

nafomap_4X<-ggplot()+
  geom_sf(data=mar_nafo4x, color="blue", fill="blue")+
  geom_sf(data=coastsf, colour="black",  fill="light grey")+
  theme_minimal()

ggsave("nafomapboundaries.jpeg", fishmap, width=8, height=10, dpi=500)
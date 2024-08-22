
library(sf)
library (here)
library(tidyverse)
library(ggplot2)

#load CoastSF1
coastsf <- readRDS(here("data/CoastSF 1.rds"))

# 
# mar_nafo_sf<-NAFOSubunitsLnd_sf %>%
#                 filter(NAFO_1 %in% c("4V", "4W", "4X", "5Y"))

# mar_nafo_sf<-NAFOSubunitsLnd_sf %>%
#   filter(NAFO_1 %in% c("4V", "4W", "4X", "5Y", "<LAND>"))

# nafo_map<-ggplot()+
#   geom_sf(data=mar_nafo_land_sf)

# Define the bounding box coordinates for Nova Scotia
# min_lon <- -70
# min_lat <- 40
# max_lon <- -50
# max_lat <- 49
# 
# # Create the bounding box
# bbox_ns <- st_bbox(c(xmin = min_lon, ymin = min_lat, xmax = max_lon, ymax = max_lat), crs = st_crs("+proj=longlat +datum=WGS84"))
# clipped_coast<-st_crop(coastsf, bbox_ns)
# 
# coast_map<-ggplot()+
#   geom_sf(data=clipped_coast)
# 
# bbox <- st_bbox(c(xmin = 48, ymin = 35, xmax = 75, ymax = 49), 
#                                 crs = st_crs(coast_lores_sf))
# clipped_coast<-st_crop(coast_sf, bbox)



fishmap<-ggplot()+
  geom_sf(data=Areas_Halibut_sf, color="green", fill="transparent")+
  geom_sf(data=Areas_Snowcrab_sf, color="blue", fill="transparent") +
  geom_sf(data=Areas_Shrimp_sf, color="orange", fill="transparent")+ 
  geom_sf(data=SPAs_Scallop_sf, color="purple", fill="transparent")+ 
  geom_sf(data=Areas_Surfclam_sf, color="maroon", fill="transparent")+
  geom_sf(data=LFAs_sf, color="red", fill="transparent")+
  geom_sf(data=mar_nafo_land_sf, color="black", fill="transparent")+
  geom_sf(data=coastsf, colour="black",  fill="light grey")+
  theme_minimal()
  
ggsave("fishmapboundaries.jpeg", fishmap, width=8, height=10, dpi=500)
  
  # bbox <- st_bbox(c(xmin = , ymin = min_lat, xmax = max_lon, ymax = max_lat), crs = st_crs(my_data))
  # clipped_coast <- st_crop(my_data, bbox)
  
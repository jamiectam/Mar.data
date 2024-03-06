library(sf)
#create sf files

Areas_Halibut_sf <- sf::st_read("C:/git/Maritimes/Mar.data/data-raw/Science/Halibut/Areas_Halibut_sf.shp")

#Shapefiles
NAFOSubunits_sf   <- sf::st_read("C:/git/Maritimes/Mar.data/data-raw/NAFO/NAFO_BEST_KasiaUS2022.shp")
NAFOSubunits_sf$OBJECTID_1<-NAFOSubunits_sf$OBJECTID<-NAFOSubunits_sf$ORIG_FID<- NAFOSubunits_sf$Shape_Le_1 <-NAFOSubunits_sf$Shape_Leng<- NAFOSubunits_sf$Shape_Area<-NULL
colnames(NAFOSubunits_sf)[colnames(NAFOSubunits_sf)=="AREA"] <- "AREA_ID"

# create sp files
# NAFOSubunits      <- rgdal::readOGR("C:/git/Maritimes/Mar.data/data-raw/NAFO/NAFO_BEST_UPDATED.shp")
# NAFOSubunits@data$OBJECTID <- NAFOSubunits@data$Shape_Leng<- NAFOSubunits@data$Shape_Area <- NULL

# NAFOSubunitsLnd      <- rgdal::readOGR("C:/git/Maritimes/Mar.data/data-raw/NAFO/NAFO_BEST_UPDATED20210416a.shp")
# NAFOSubunitsLnd@data$OBJECTID_1 <- NAFOSubunitsLnd@data$Shape_Leng<- NAFOSubunitsLnd@data$Shape_Area <- NULL
# colnames(NAFOSubunitsLnd@data)[colnames(NAFOSubunitsLnd@data)=="NAFO_BEST"]<- "NAFO"

NAFOSubunitsLnd_sf   <- sf::st_read("C:/git/Maritimes/Mar.data/data-raw/NAFO/NAFO_BEST_UPDATED20210416a.shp")
NAFOSubunitsLnd_sf$OBJECTID<- NAFOSubunitsLnd_sf$Shape_Leng<- NAFOSubunitsLnd_sf$Shape_Area<-NULL
colnames(NAFOSubunitsLnd_sf)[colnames(NAFOSubunitsLnd_sf)=="NAFO_BEST"]<- "NAFO"

Strata_Mar_sf      <- sf::st_read("C:/git/Maritimes/Mar.data/data-raw/Strata/MaritimesRegionEcosystemAssessmentStrata(2014-).shp")

Strata_Mar_4VSW_sf  <- sf::st_read("C:/git/Maritimes/Mar.data/data-raw/Strata/4VsW.shp")

Areas_Shrimp_sf      <- sf::st_read ("C:/git/Maritimes/Mar.data/data-raw/Science/Shrimp/shrimpBoxesPoly.shp")
Areas_Shrimp_sf$LAT <- Areas_Shrimp_sf$LON <- Areas_Shrimp_sf$trekMin <- Areas_Shrimp_sf$trekMax <- Areas_Shrimp_sf$cnt <- Areas_Shrimp_sf$BOX_ID <- NULL

Areas_Scallop_sf     <- sf::st_read ("C:/git/Maritimes/Mar.data/data-raw/Science/Scallop/ScallopSFAs.shp")
Areas_Scallop_sf$OBJECTID<- Areas_Scallop_sf$Shape_Leng<- Areas_Scallop_sf$Shape_Area<-NULL

SPAs_Scallop_sf     <- sf::st_read ("C:/git/Maritimes/Mar.data/data-raw/Science/Scallop/ScallopSPAs.shp")

Grids_Lobster_sf <-  sf::st_read ("C:/git/Maritimes/Mar.data/data-raw/Science/Lobster/GridsMMM.shp")

GeorgesBankDiscardZones_sf <-  sf::st_read ("I:/Science/Population Ecology/Georges Bank/Discards/2021 2022/zones.shp")

#Snowcrab dat files were converted to shapefiles via dat2Shp.R
Areas_Snowcrab_sf <- sf::st_read("C:/git/Maritimes/Mar.data/data-raw/Science/Snowcrab/SCAreas.shp")
Areas_Snowcrab_sf$OBJECTID <-Areas_Snowcrab_sf$Shape_Leng <- Areas_Snowcrab_sf$Shape_Area <- NULL
Areas_Snowcrab_Slope_sf <- sf::st_read("C:/git/Maritimes/Mar.data/data-raw/Science/Snowcrab/SCSlope.shp")

#PBS-like CSVs
Areas_Surfclam <- read.csv("C:/git/Maritimes/Mar.data/data-raw/Science/Surfclam/newareas.csv")
Areas_Surfclam_sf <-     df_to_sf(Areas_Surfclam)
colnames(Areas_Surfclam_sf)[colnames(Areas_Surfclam_sf)=="PID"] <- "AREA"

LFAs <- read.csv("C:/git/Maritimes/Mar.data/data-raw/Science/Lobster/LFAPolys.csv")
LFAs_sf <-     df_to_sf(LFAs)
colnames(LFAs_sf)[colnames(LFAs_sf)=="PID"] <- "LFA"

hex_sf <- sf::st_as_sf(hex)

coastline =  maps::map(database = "world", regions = c("Canada", "USA", "France", "Greenland"), fill = T, resolution = 0)
coast_lores_sf = sf::st_as_sf(coastline)

save(GeorgesBankDiscardZones_sf,file = "data/GeorgesBankDiscardZones_sf.rda")
save(Areas_Surfclam_sf,file = "data/Areas_Surfclam_sf.rda")
save(Areas_Halibut_sf,file = "data/Areas_Halibut_sf.rda")
# rm(coast_lores)
save(coast_lores_sf,file = "data/coast_lores_sf.rda")
save(hex_sf,file = "data/hex_sf.rda")
save(LFAs_sf,file = "data/LFAs_sf.rda")
save(Grids_Lobster_sf,file = "data/Grids_Lobster_sf.rda")
save(Strata_Mar_4VSW_sf,file = "data/Strata_Mar_4VSW_sf.rda")
save(Strata_Mar_sf,file = "data/Strata_Mar_sf.rda")

# save(NAFOSubunits,file = "data/NAFOSubunits.rda")
save(NAFOSubunits_sf,file = "data/NAFOSubunits_sf.rda")

# save(NAFOSubunitsLnd,file = "data/NAFOSubunitsLnd.rda")
save(NAFOSubunitsLnd_sf,file = "data/NAFOSubunitsLnd_sf.rda")

save(Areas_Scallop_sf,file = "data/Areas_Scallop_sf.rda")
save(SPAs_Scallop_sf,file = "data/SPAs_Scallop_sf.rda")
save(Areas_Shrimp_sf,file = "data/Areas_Shrimp_sf.rda")
save(Areas_Snowcrab_sf,file = "data/Areas_Snowcrab_sf.rda")
save(Areas_Snowcrab_Slope_sf,file = "data/Areas_Snowcrab_Slope_sf.rda")

usethis::use_data(GeorgesBankDiscardZones_sf, overwrite = TRUE)
usethis::use_data(Areas_Surfclam_sf, overwrite = TRUE)
usethis::use_data(Areas_Halibut_sf, overwrite = TRUE)
# usethis::use_data(coast_lores, overwrite = TRUE)
usethis::use_data(coast_lores_sf, overwrite = TRUE)
usethis::use_data(hex_sf, overwrite = TRUE)
usethis::use_data(LFAs_sf, overwrite = TRUE)
usethis::use_data(Grids_Lobster_sf, overwrite = TRUE)
usethis::use_data(Strata_Mar_4VSW_sf, overwrite = TRUE)
usethis::use_data(Strata_Mar_sf, overwrite = TRUE)
# usethis::use_data(NAFOSubunits, overwrite = TRUE)
usethis::use_data(NAFOSubunits_sf, overwrite = TRUE)
# usethis::use_data(NAFOSubunitsLnd, overwrite = TRUE)
usethis::use_data(NAFOSubunitsLnd_sf, overwrite = TRUE)
usethis::use_data(Areas_Scallop_sf, overwrite = TRUE)
usethis::use_data(SPAs_Scallop_sf, overwrite = TRUE)
usethis::use_data(Areas_Shrimp_sf, overwrite = TRUE)
usethis::use_data(Areas_Snowcrab_sf, overwrite = TRUE)
usethis::use_data(Areas_Snowcrab_Slope_sf, overwrite = TRUE)

library(sf)
#create sf files
#
# load("C:/git/Maritimes/Mar.data/data-raw/Science/Halibut/SurveyStrata.RData")
# Areas_Halibut_sf <- surveyStrataPolyLL
#    rm(list = c('block_sf','StrataAreas','surveyPoly','surveyPolyLL','surveyStrataPoly','surveyStrataPolyLL'))
Areas_Halibut_sf <- sf::st_read("C:/git/Maritimes/Mar.data/data-raw/Science/Halibut/Areas_Halibut_sf.shp")

#Shapefiles
NAFOSubunits_sf   <- sf::st_read("C:/git/Maritimes/Mar.data/data-raw/NAFO/NAFO_BEST_UPDATED.shp")
    NAFOSubunits_sf$OBJECTID<- NAFOSubunits_sf$Shape_Leng<- NAFOSubunits_sf$Shape_Area<-NULL
Strata_Mar_sf      <- sf::st_read("C:/git/Maritimes/Mar.data/data-raw/Strata/MaritimesRegionEcosystemAssessmentStrata(2014-).shp")
Strata_Mar_4VSW_sf  <- sf::st_read("C:/git/Maritimes/Mar.data/data-raw/Strata/4VsW.shp")
Areas_Shrimp_sf      <- sf::st_read ("C:/git/Maritimes/Mar.data/data-raw/Science/Shrimp/shrimpBoxesPoly.shp")
    Areas_Shrimp_sf$LAT <- Areas_Shrimp_sf$LON <- Areas_Shrimp_sf$trekMin <- Areas_Shrimp_sf$trekMax <- Areas_Shrimp_sf$cnt <- Areas_Shrimp_sf$BOX_ID <- NULL
Areas_Scallop_sf     <- sf::st_read ("C:/git/Maritimes/Mar.data/data-raw/Science/Scallop/ScallopSFAs.shp")
    Areas_Scallop_sf$OBJECTID<- Areas_Scallop_sf$Shape_Leng<- Areas_Scallop_sf$Shape_Area<-NULL
SPAs_Scallop_sf     <- sf::st_read ("C:/git/Maritimes/Mar.data/data-raw/Science/Scallop/ScallopSPAs.shp")

    Grids_Lobster_sf <-  sf::st_read ("C:/git/Maritimes/Mar.data/data-raw/Science/Lobster/GridsMMM.shp")
#Snowcrab dat files were converted to shapefiles via dat2Shp.R
Areas_Snowcrab_sf <- sf::st_read("C:/git/Maritimes/Mar.data/data-raw/Science/Snowcrab/SCAreas.shp")
    Areas_Snowcrab_sf$OBJECTID <-Areas_Snowcrab_sf$Shape_Leng <- Areas_Snowcrab_sf$Shape_Area <- NULL
Areas_Snowcrab_Slope_sf <- sf::st_read("C:/git/Maritimes/Mar.data/data-raw/Science/Snowcrab/SCSlope.shp")

#PBS-like CSVs
Areas_Surfclam_sf <-     Mar.utils::convert2poly("C:/git/Maritimes/Mar.data/data-raw/Science/Surfclam/newareas.csv", out = "sf")
    colnames(Areas_Surfclam_sf)[colnames(Areas_Surfclam_sf)=="PID"] <- "AREA"
    Areas_Surfclam_sf$ID <- NULL
# Grids_Lobster_sf <-  convert2poly("C:/git/Maritimes/Mar.data/data-raw/Science/Lobster/GridPolys.csv", out = "sf")
#     colnames(Grids_Lobster_sf)[colnames(Grids_Lobster_sf)=="PID"] <- "GRID"
LFAs_sf <-    convert2poly("C:/git/Maritimes/Mar.data/data-raw/Science/Lobster/LFAPolys.csv", out = "sf")
    colnames(LFAs_sf)[colnames(LFAs_sf)=="PID"] <- "LFA"
    LFAs_sf$ID <- NULL
# Areas_Halibut_sf <-    convert2poly(Areas_Halibut_sf, out = "sf")
#     colnames(Areas_Halibut_sf)[colnames(Areas_Halibut_sf)=="PID"] <- "Strata"
#     Areas_Halibut_sf$ID <- NULL
#     st_crs(Areas_Halibut_sf) = 4326

# create sp files
NAFOSubunits      <- rgdal::readOGR("C:/git/Maritimes/Mar.data/data-raw/NAFO/NAFO_BEST_UPDATED.shp")
NAFOSubunits@data$OBJECTID <- NAFOSubunits@data$Shape_Leng<- NAFOSubunits@data$Shape_Area <- NULL


NAFOSubunitsLnd      <- rgdal::readOGR("C:/git/Maritimes/Mar.data/data-raw/NAFO/NAFO_BEST_UPDATED20210416a.shp")
NAFOSubunitsLnd@data$OBJECTID_1 <- NAFOSubunitsLnd@data$Shape_Leng<- NAFOSubunitsLnd@data$Shape_Area <- NULL

NAFOSubunitsLnd_sf   <- sf::st_read("C:/git/Maritimes/Mar.data/data-raw/NAFO/NAFO_BEST_UPDATED20210416a.shp")
NAFOSubunitsLnd_sf$OBJECTID<- NAFOSubunitsLnd_sf$Shape_Leng<- NAFOSubunitsLnd_sf$Shape_Area<-NULL


hex_sf <- sf::st_as_sf(hex)

coastline =  maps::map(database = "world", regions = c("Canada", "USA", "France", "Greenland"),
   						fill = TRUE, resolution = 0)
coast_lores = maptools::map2SpatialPolygons(coastline,
                                              IDs = coastline$names,
                                              proj4string = sp::CRS(SRS_string = "EPSG:4326"))
coast_lores_sf <-    Mar.utils::convert2poly(coast_lores, out="sf")


save(Areas_Surfclam_sf,file = "data/Areas_Surfclam_sf.rda")
save(Areas_Halibut_sf,file = "data/Areas_Halibut_sf.rda")
save(coast_lores,file = "data/coast_lores.rda")
save(coast_lores_sf,file = "data/coast_lores_sf.rda")
save(hex_sf,file = "data/hex_sf.rda")
save(LFAs_sf,file = "data/LFAs_sf.rda")
save(Grids_Lobster_sf,file = "data/Grids_Lobster_sf.rda")
save(Strata_Mar_4VSW_sf,file = "data/Strata_Mar_4VSW_sf.rda")
save(Strata_Mar_sf,file = "data/Strata_Mar_sf.rda")
save(NAFOSubunits,file = "data/NAFOSubunits.rda")
save(NAFOSubunits_sf,file = "data/NAFOSubunits_sf.rda")

save(NAFOSubunitsLnd,file = "data/NAFOSubunitsLnd.rda")
save(NAFOSubunitsLnd_sf,file = "data/NAFOSubunitsLnd_sf.rda")

save(Areas_Scallop_sf,file = "data/Areas_Scallop_sf.rda")
save(SPAs_Scallop_sf,file = "data/SPAs_Scallop_sf.rda")
save(Areas_Shrimp_sf,file = "data/Areas_Shrimp_sf.rda")
save(Areas_Snowcrab_sf,file = "data/Areas_Snowcrab_sf.rda")
save(Areas_Snowcrab_Slope_sf,file = "data/Areas_Snowcrab_Slope_sf.rda")

usethis::use_data(Areas_Surfclam_sf, overwrite = TRUE)
usethis::use_data(Areas_Halibut_sf, overwrite = TRUE)
usethis::use_data(coast_lores, overwrite = TRUE)
usethis::use_data(coast_lores_sf, overwrite = TRUE)
usethis::use_data(hex_sf, overwrite = TRUE)
usethis::use_data(LFAs_sf, overwrite = TRUE)
usethis::use_data(Grids_Lobster_sf, overwrite = TRUE)
usethis::use_data(Strata_Mar_4VSW_sf, overwrite = TRUE)
usethis::use_data(Strata_Mar_sf, overwrite = TRUE)
usethis::use_data(NAFOSubunits, overwrite = TRUE)
usethis::use_data(NAFOSubunits_sf, overwrite = TRUE)
usethis::use_data(NAFOSubunitsLnd, overwrite = TRUE)
usethis::use_data(NAFOSubunitsLnd_sf, overwrite = TRUE)
usethis::use_data(Areas_Scallop_sf, overwrite = TRUE)
usethis::use_data(SPAs_Scallop_sf, overwrite = TRUE)
usethis::use_data(Areas_Shrimp_sf, overwrite = TRUE)
usethis::use_data(Areas_Snowcrab_sf, overwrite = TRUE)
usethis::use_data(Areas_Snowcrab_Slope_sf, overwrite = TRUE)

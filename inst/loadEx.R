library(sf)
NAFOSubunits_sf <- st_read("C:/Users/McMahonM/Documents/GIS/BaseData/NAFO/NAFO_Best.shp")
MarStrata_sf <- st_read("P:/Shared/Spatial/Science/Strata/Maritimes/MaritimesRegionEcosystemAssessmentStrata(2014-).shp")
MarStrata4VSW_sf <- st_read("P:/Shared/Spatial/Science/Strata/Maritimes/PED_4VsW/4VsW.shp")
ShrimpFAs_sf <- st_read ("C:/Users/McMahonM/Documents/Assistance/!People/CassistaDaRos/ShrimpBoxes/shrimpBoxesPoly.shp")
ShrimpFAs_sf$LAT<- ShrimpFAs_sf$LON <- ShrimpFAs_sf$trekMin <- ShrimpFAs_sf$trekMax <- ShrimpFAs_sf$cnt <- ShrimpFAs_sf$BOX_ID <- NULL

save(NAFOSubunits_sf,file = "data/NAFOSubunits_sf.rda")
save(MarStrata_sf,file = "data/MarStrata_sf.rda")
save(MarStrata4VSW_sf,file = "data/MarStrata4VSW_sf.rda")
save(ShrimpFAs_sf,file = "data/ShrimpFAs_sf.rda")

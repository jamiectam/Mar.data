library(sf)
NAFOSubunits_sf <- st_read("C:/Users/McMahonM/Documents/GIS/BaseData/NAFO/NAFO_Best.shp")
MarStrata_sf <- st_read("P:/Shared/Spatial/Science/Strata/Maritimes/MaritimesRegionEcosystemAssessmentStrata(2014-).shp")
MarStrata4VSW_sf <- st_read("P:/Shared/Spatial/Science/Strata/Maritimes/PED_4VsW/4VsW.shp")
ShrimpFAs_sf <- st_read ("C:/Users/McMahonM/Documents/Assistance/!People/CassistaDaRos/ShrimpBoxes/shrimpBoxesPoly.shp")
ShrimpFAs_sf$LAT<- ShrimpFAs_sf$LON <- ShrimpFAs_sf$trekMin <- ShrimpFAs_sf$trekMax <- ShrimpFAs_sf$cnt <- ShrimpFAs_sf$BOX_ID <- NULL
ScallopFAs_sf <- st_read ("C:/git/Maritimes/Mar.data/New folder/ScallopSFAs.shp")
ScallopFAs_sf$OBJECTID<- ScallopFAs_sf$Shape_Leng<- ScallopFAs_sf$Shape_Area<-NULL

LobsterGrids_sf <- read.csv("P:/Shared/Spatial/Science/lobster/GridPolys.csv")
LobsterGrids_sf<- PBSmapping::as.PolySet(LobsterGrids_sf, projection = "LL")
Mar.utils::pbs2sp_poly(pbs=LobsterGrids_sf, create.shp = T)
LobsterGrids_sf<- sf::st_read("c:/git/Maritimes/Mar.data/LobsterGrids_sf.shp")
colnames(LobsterGrids_sf)[colnames(LobsterGrids_sf)=="PID"] <- "GRID"
LobsterGrids_sf$ID <- NULL
save(LobsterGrids_sf,file = "data/LobsterGrids_sf.rda")

LobsterFAs_sf <- read.csv("P:/Shared/Spatial/Science/lobster/LFAPolys (1).csv")
LobsterFAs_sf<- PBSmapping::as.PolySet(LobsterFAs_sf, projection = "LL")
Mar.utils::pbs2sp_poly(pbs=LobsterFAs_sf, create.shp = T)
LobsterFAs_sf<- sf::st_read("c:/git/Maritimes/Mar.data/LobsterLFAs_sf.shp")
colnames(LobsterFAs_sf)[colnames(LobsterFAs_sf)=="PID"] <- "LFA"
LobsterFAs_sf$ID <- NULL
save(LobsterFAs_sf,file = "data/LobsterFAs_sf.rda")


HalibutStrata_sf<- PBSmapping::as.PolySet(surveyStrataPolyLL, projection = "LL")
Mar.utils::pbs2sp_poly(pbs=HalibutStrata_sf, create.shp = T)
HalibutStrata_sf<- sf::st_read("c:/git/Maritimes/Mar.data/HalibutStrata_sf.shp")
colnames(HalibutStrata_sf)[colnames(HalibutStrata_sf)=="PID"] <- "Strata"
HalibutStrata_sf$ID <- NULL

save(HalibutStrata_sf,file = "data/HalibutStrata_sf.rda")

ClamAreas_sf <- read.csv("P:/Shared/Spatial/Science/surfclam/newareas.csv")
ClamAreas_sf<- PBSmapping::as.PolySet(ClamAreas_sf, projection = "LL")
Mar.utils::pbs2sp_poly(pbs=ClamAreas_sf, create.shp = T)
ClamAreas_sf<- sf::st_read("c:/git/Maritimes/Mar.data/ClamAreas_sf.shp")
colnames(ClamAreas_sf)[colnames(ClamAreas_sf)=="PID"] <- "AREA"
ClamAreas_sf$ID <- NULL
save(ClamAreas_sf,file = "data/ClamAreas_sf.rda")


save(NAFOSubunits_sf,file = "data/NAFOSubunits_sf.rda")
save(MarStrata_sf,file = "data/MarStrata_sf.rda")
save(MarStrata4VSW_sf,file = "data/MarStrata4VSW_sf.rda")
save(ShrimpFAs_sf,file = "data/ShrimpFAs_sf.rda")
save(ScallopFAs_sf,file = "data/ScallopFAs_sf.rda")

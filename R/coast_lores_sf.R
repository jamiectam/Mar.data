#' @title coast_lores_sf Metadata
#' @name coast_lores_sf
#' @description This is simply a low resolution generated from some other packages that is
#' generally convenient.  It was created on July 5, 2019 via:
#' coastline =  maps::map(database = "world", regions = c("Canada", "USA", "France", "Greenland"),
#'   						fill = T, resolution = 0)
#' coast_lores_sf = maptools::map2SpatialPolygons(coastline,
#'                                              IDs = coastline$names,
#'                                              proj4string = sp::CRS("+init=epsg:4326"))
#' coast_lores_sf <-    Mar.utils::convert2poly(coast_lores, out="sf")
#' save(coast_lores_sf,file = "coast_lores.rda")
#' @docType data
#' @format  sf object
"coast_lores_sf"

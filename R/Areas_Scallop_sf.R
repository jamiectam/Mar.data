#' @title Areas_Scallop_sf Metadata
#' @name Areas_Scallop_sf
#' @description These are the Scallop areas converted to an sf object. All Offshore
#' Polygon StrataID values have had 1000 added to them to avoid duplication of
#' StrataID values with the Inshore data.
#' @docType data
#' @format sf polygon
#' \describe{
#' \item{AREA}{polygon identifier}
#' \item{Type}{one of "Inshore", "Offshore" or "Survey"}
#' \item{Label}{Original Polygon Identifier}
#' }
"Areas_Scallop_sf"

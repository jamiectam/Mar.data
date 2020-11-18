#' ScallopFAs_sf Metadata
#'
#' These are the Scallop fishing areas converted to an sf object. All Offshore
#' Polygon StrataID values have had 1000 added to them to avoid duplication of
#' StrataID values with the Inshore data.
#'
#' @format sf polygon
#' \describe{
#' \item{StrataID}{polygon identifier}
#' \item{Type}{one of "Inshore", "Offshore" or "Survey"}
#' \item{Label}{Original Polygon Identifier}
#' }
"ScallopFAs_sf"

#' grid2Min Metadata
#'
#' This is a mesh of square 2 minute x 2 minute grid cells.  The northern 
#' boundary is  48 12'30"N and the eastern boundary is 56 0'30"W.  The southern 
#' and western boundaries follow the Canadian EEZ.  No cells cover the French 
#' "Keyhole"
#'
#' if{html}{figure{grid2Min.png}{options:alt="Figure: grid2Min coverage area"}} 
#' 
#' @format  SpatialPolygonsDataFrame frame with 1 data column
#' \describe{
#' \item{PUID}{polygon identifier}
#' }
#' @examples
#' if (require("sp")) {
#' sp::plot(grid2Min)
#' }
"grid2Min"
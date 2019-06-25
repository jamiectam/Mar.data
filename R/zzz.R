# .onAttach <- function(libname, pkgname) {
#   localVer = utils::packageDescription('Mar.data')$Version
#   packageStartupMessage(paste0("Version: ", localVer))
# }

.onLoad <- function(libname, pkgname){
  options(stringsAsFactors = FALSE)
#  Mar.utils::updateCheck(gitPkg = 'Maritimes/Mar.data')
}

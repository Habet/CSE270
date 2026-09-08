# Course dependency bookkeeping and package startup hooks.
# Real install list lives in DESCRIPTION (Imports / Suggests / Remotes).

# Keep Imports "used" for R CMD check; these packages install with SportsAnalytics270.
.sportsanalytics270_declare_imports <- function() {
  pkgs <- c(
    "BradleyTerry2", "caret", "circlize", "dplyr", "elo", "ggplot2",
    "glmnet", "glue", "igraph", "intergraph", "kableExtra", "knitr",
    "Matrix", "measures", "network", "odds.converter", "reshape2",
    "rlang", "rmarkdown", "SBpitch", "sna", "StatsBombR", "tidyr",
    "VGAM", "zoo"
  )
  lapply(pkgs, getNamespace)
  invisible()
}

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "SportsAnalytics270 loaded.\n",
    "GitHub packages (StatsBombR, SBpitch) install with this package via Remotes.\n",
    "To reinstall them: SportsAnalytics270::install_github_course_packages()\n",
    "Full course setup script: scripts/install_CSE270.R in the CSE270 repo"
  )
}

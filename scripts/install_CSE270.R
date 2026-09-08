#!/usr/bin/env Rscript
# Full CSE270 / SportsAnalytics270 installer
#
# Installs:
#   1) remotes (if needed)
#   2) GitHub course packages: StatsBombR, SBpitch, UserNetR
#   3) SportsAnalytics270 from HABET/CSE270 (with CRAN Imports)
#
# Usage (from any directory):
#   Rscript path/to/install_CSE270.R
#
# Or in R:
#   source("path/to/install_CSE270.R")
#
# Optional env vars:
#   CSE270_REF   - git ref/branch/tag (default: feat/data-collection-2026)
#   CSE270_REPO  - GitHub repo (default: HABET/CSE270)

repo <- Sys.getenv("CSE270_REPO", unset = "HABET/CSE270")
ref  <- Sys.getenv("CSE270_REF",  unset = "feat/data-collection-2026")

message("=== CSE270 course installer ===")
message("Repo: ", repo, " @ ", ref)

if (!requireNamespace("remotes", quietly = TRUE)) {
  message("Installing remotes ...")
  install.packages("remotes", repos = "https://cloud.r-project.org")
}

github_packages <- c(
  "hudl/StatsBombR",
  "FCrSTATS/SBpitch",
  "DougLuke/UserNetR"
)

message("\n--- Installing GitHub course packages ---")
for (gh in github_packages) {
  message("Installing ", gh, " ...")
  tryCatch(
    remotes::install_github(gh, upgrade = "never", quiet = FALSE),
    error = function(e) {
      warning("Could not install ", gh, ": ", conditionMessage(e), call. = FALSE)
    }
  )
}

message("\n--- Installing SportsAnalytics270 (", repo, "@", ref, ") ---")
remotes::install_github(
  repo,
  ref = ref,
  dependencies = TRUE,
  upgrade = "never"
)

message("\n=== Done. Quick check ===")
pkgs <- c("SportsAnalytics270", "StatsBombR", "SBpitch", "UserNetR",
          "dplyr", "ggplot2", "VGAM")
installed <- rownames(installed.packages())
for (p in pkgs) {
  status <- if (p %in% installed) "OK" else "MISSING"
  message(sprintf("  %-22s %s", p, status))
}

message("\nLoad with: library(SportsAnalytics270)")
message("GitHub helpers: SportsAnalytics270::install_github_course_packages()")

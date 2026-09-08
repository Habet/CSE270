#' Install GitHub-only course packages
#'
#' Installs custom packages that are not on CRAN and are used in CSE270
#' lectures (StatsBombR, SBpitch, and optionally UserNetR).
#'
#' These are also declared under \code{Remotes} / \code{Imports} in
#' DESCRIPTION so a normal
#' \code{remotes::install_github("HABET/CSE270")} pulls StatsBombR and
#' SBpitch automatically. Call this helper if you need to reinstall them
#' separately.
#'
#' @param include_usernetr Logical; also install DougLuke/UserNetR
#'   (default \code{TRUE}).
#' @param upgrade Passed to \code{remotes::install_github()}
#'   (default \code{"never"}).
#' @param ... Additional arguments passed to \code{remotes::install_github()}.
#' @return Invisibly, a named logical vector of install success per package.
#' @examples
#' \dontrun{
#' SportsAnalytics270::install_github_course_packages()
#' }
#' @export
install_github_course_packages <- function(include_usernetr = TRUE,
                                           upgrade = "never",
                                           ...) {
  if (!requireNamespace("remotes", quietly = TRUE)) {
    utils::install.packages("remotes")
  }

  repos <- c(
    StatsBombR = "hudl/StatsBombR",
    SBpitch = "FCrSTATS/SBpitch"
  )
  if (isTRUE(include_usernetr)) {
    repos[["UserNetR"]] <- "DougLuke/UserNetR"
  }

  results <- logical(length(repos))
  names(results) <- names(repos)

  for (pkg in names(repos)) {
    message("Installing ", pkg, " from GitHub: ", repos[[pkg]])
    results[[pkg]] <- tryCatch({
      remotes::install_github(
        repos[[pkg]],
        upgrade = upgrade,
        ...
      )
      requireNamespace(pkg, quietly = TRUE)
    }, error = function(e) {
      warning("Failed to install ", pkg, ": ", conditionMessage(e), call. = FALSE)
      FALSE
    })
  }

  invisible(results)
}

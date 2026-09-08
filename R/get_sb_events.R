#' Download StatsBomb events for a set of matches (optional helper)
#'
#' Requires Suggests packages: StatsBombR, foreach, doParallel.
#'
#' @param MatchesDF StatsBomb matches data frame
#' @return Cleaned events data frame
#' @keywords internal
get_events <- function(MatchesDF) {
  needed <- c("StatsBombR", "foreach", "doParallel")
  missing <- needed[!vapply(needed, requireNamespace, logical(1), quietly = TRUE)]
  if (length(missing) > 0) {
    stop(
      "get_events() needs optional packages: ",
      paste(missing, collapse = ", "),
      ". Install with remotes::install_github('HABET/CSE270', dependencies = TRUE)",
      call. = FALSE
    )
  }

  cl <- parallel::makeCluster(parallel::detectCores())
  doParallel::registerDoParallel(cl)
  on.exit(parallel::stopCluster(cl), add = TRUE)

  `%dopar%` <- foreach::`%dopar%`
  events.df <- foreach::foreach(
    i = seq_len(nrow(MatchesDF)),
    .combine = dplyr::bind_rows,
    .multicombine = TRUE,
    .errorhandling = "remove",
    .packages = c("httr", "jsonlite", "dplyr", "StatsBombR")
  ) %dopar% {
    StatsBombR::get.matchFree(MatchesDF[i, ])
  }

  StatsBombR::allclean(events.df)
}

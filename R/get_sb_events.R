library(StatsBombR)
library(SBpitch)
get_events <- function(MatchesDF) {
  cl <- makeCluster(detectCores())
  registerDoParallel(cl)
  events.df <- foreach(i = 1:dim(MatchesDF)[1], .combine = bind_rows,
      .multicombine = TRUE, .errorhandling = "remove",
      .export = c("get.matchFree"), .packages = c("httr",
        "jsonlite", "dplyr")) %dopar% {
      get.matchFree(MatchesDF[i, ])
  }
  stopCluster(cl)
  return (allclean(events.df))
}
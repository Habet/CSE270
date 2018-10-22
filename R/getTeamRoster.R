#' @title get Team roster
#' @name getTeamRoster
#' @aliases getTeamRoster
#' @description Gets team roster by team ID
#' @param Year The season year, i.e. 2011 for the season 2010-2011
#' @param TeamID Team ID
#' @importFrom jsonlite fromJSON
#' @return team roster
#' @export
getTeamRoster <- function(Year, TeamID){
  y <- paste(Year-1, "-", substr(Year, 3,4), sep="")
  id <- "https://stats.nba.com/stats/commonteamroster?"
  Season <- paste(id, y, sep="")
  link <- paste(id, "Season=", y, "&TeamID=", TeamID, sep="")
  js <- suppressWarnings(readLines(link))
  js <- jsonlite::fromJSON(js)
  df <- as.data.frame(js$resultSets$rowSet[[1]], stringsAsFactors = F)
  colnames(df) <- js$resultSets$headers[[1]]
  df$WEIGHT <- as.numeric(df$WEIGHT)
  df$AGE <- as.numeric(df$AGE)
  df$NUM <- as.numeric(df$NUM)
  df$LeagueID <- NULL
  return(df)
}

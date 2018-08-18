#' @title NBA regular season box scores
#' @name getBoxScore
#' @aliases getBoxScore
#' @author Vardan Kazaryan
#' @description Gets box score for for NBA regular season. Uses teamgamelogs? from stats.nba.com
#' @param year 4 digits number of the season year. Fo example, season 2010-2011 will be given as 2010
#' @import dplyr
#' @import jsonlite
#' @return dataframe with regular season results
#' @export
getBoxScore <- function(year) {
  season1 <- unlist(strsplit(as.character(year), ''))[3:4]
  season1 <- as.numeric(paste0(season1[1], season1[2])) + 1
  url <- paste0('https://stats.nba.com/stats/teamgamelogs?DateFrom=&DateTo=&GameSegment=&LastNGames=0&LeagueID=00&Location=&MeasureType=Base&Month=0&OpponentTeamID=0&Outcome=&PORound=0&PaceAdjust=N&PerMode=Totals&Period=0&PlusMinus=N&Rank=N&Season=',
                year, '-', season1, '&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&VsConference=&VsDivision=')
  rawurl <- suppressWarnings(readLines(url))
  JSlist <- fromJSON(rawurl)
  clnames <- unlist(JSlist$resultSets[1,2])
  boxdata <- data.frame(JSlist$resultSets[1,3])
  names(boxdata) <- clnames
  boxdata[,9:56] <- apply(boxdata[,9:56],2,as.numeric)
  boxdata$GAME_DATE <- as.Date(as.character(bb$GAME_DATE), format = "%Y-%m-%d")
  boxdata <- boxdata %>% mutate(GAME_DATE = as.Date(as.character(GAME_DATE), format = "%Y-%m-%d"))%>%
    arrange(GAME_ID, ! grepl("@", MATCHUP))
  return(boxdata)
}

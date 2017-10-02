#' @title NBA player IDS
#' @name getPlayerID
#' @aliases getPlayerID
#' @description Gets player and team IDs for active roster for the given season
#' @param year The season year, i.e. 2011 for the season 2010-2011
#' @importFrom jsonlite fromJSON
#' @return dataframe with player names, ids, team names and ids
#' @export
getPlayerID<-function(year){
  y<-paste(year-1, "-", substr(year, 3,4), sep="")
  id="http://stats.nba.com/stats/commonallplayers?IsOnlyCurrentSeason=0&LeagueID=00&Season="
  x<-paste(id, y, sep="")
  ids<-jsonlite::fromJSON(readLines(x))
  dframe<-as.data.frame(ids$resultSets$rowSet)
  colnames(dframe)<-unlist(unlist(ids$resultSets$headers[1]))
  dframe<-dframe[dframe$ROSTERSTATUS==1,]
  dframe<-dframe[,c("PERSON_ID", "DISPLAY_LAST_COMMA_FIRST",
                    "TEAM_ID", "TEAM_CITY", "TEAM_NAME", "TEAM_ABBREVIATION")]
  rownames(dframe)<-NULL
  return(dframe)
}

#' @title NBA players passing statistics
#' @name getPassing
#' @aliases getPassing
#' @description Gets players passing statistics for the given season
#' @param year The season year, i.e. 2011 for the season 2010-2011
#' @param playerID The player ID from NBA database.
#' @param seasonType Regular, Playoffs, default is Regular
#' @importFrom jsonlite fromJSON
#' @return dataframe with players passing statistics
#' @export

getPassing<-function(year, playerID, seasonType="Regular"){
  y<-paste(year-1, "-", substr(year, 3,4), sep="")
  if (seasonType=="Regular"){
    seasont<-paste('SeasonType=', "Regular+Season&", sep="")
  } else{
    seasont<-paste('SeasonType=', "Playoffs&", sep="")
  }

  pl_id<-paste('PlayerID=', playerID, '&', sep="")

  link<-paste('http://stats.nba.com/stats/playerdashptpass?',
              'DateFrom=&', 'DateTo=&','GameSegment=&',
              'LastNGames=0&','LeagueID=00&','Location=&',
              'Month=0&', 'OpponentTeamID=0&',
              'Outcome=&','PerMode=Totals&',
              'Period=0&', pl_id,
              paste("Season=", y, "&", sep=""),
              'SeasonSegment=&', seasont, 'TeamID=0&',
              'VsConference=&', 'VsDivision=', sep="")
  c<- readLines(link)
  k<-fromJSON(c)
  dd<-as.data.frame(k$resultSets$rowSet[1])
  colnames(dd)<-unlist(k$resultSets$headers[1])
  colnames(dd)[8]<-"PASS_TEAMMATE_PLAYER_NAME"
  dd1<-as.data.frame(k$resultSets$rowSet[2])
  colnames(dd1)<-unlist(k$resultSets$headers[2])
  colnames(dd1)[8]<-"PASS_TEAMMATE_PLAYER_NAME"
  dd<-rbind(dd,dd1)
  dd[,10:21]<-apply(dd[,10:21],2,as.numeric)
  return(dd)
}

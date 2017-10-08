#' @title NBA player's BIO
#' @name getPlayerBio
#' @aliases getPlayerBio
#' @description Gets player's bio from stats.nba.com
#' @param playerID as specified by nba.com
#' @importFrom jsonlite fromJSON
#' @return dataframe with player's bio
#' @export

getPlayerBio<-function(playerID){
  x<-"http://stats.nba.com/stats/commonplayerinfo?PlayerID="
  y<-paste(x, playerID, sep="")
  z<-readLines(y)
  z<-jsonlite::fromJSON(z)
  z1<-z$resultSets$rowSet[[1]]
  colnames(z1)<-z$resultSets$headers[[1]]
  return(z1)
}

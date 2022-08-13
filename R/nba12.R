#' NBA stint time statistics for calculation of plus/minus/ 2011-2012
#'
#' @docType data
#'
#' @usage data(nba12)
#'
#' @format A data frame with 25300 rows and 36 variables
#'
#' Each row is a distinct time period when a substition is made
#'
#' GameID: The game id cosnsisitng of the game date, abbreviations for visiting and hoem teams
#'
#' Home and away teams player names and ID's
#'
#' "HomePlayer1ID"    "HomePlayer2ID"    "HomePlayer3ID"    "HomePlayer4ID"
#' "HomePlayer5ID"    "AwayPlayer1ID"    "AwayPlayer2ID"    "AwayPlayer3ID"
#' "AwayPlayer4ID"    "AwayPlayer5ID"    "HomePlayer1Name"  "HomePlayer2Name"
#' "HomePlayer3Name"  "HomePlayer4Name"  "HomePlayer5Name"  "AwayPlayer1Name"
#' "AwayPlayer2Name"  "AwayPlayer3Name"  "AwayPlayer4Name"  "AwayPlayer5Name"
#'
#' Score at the end and begining of the time stint for hoem and away teams
#' StartScoreHome, StartScoreAway, EndScoreHome, EndScoreAway
#'
#' Possession, points scored during the given time period
#' PointsScoredHome, PointsScoredAway, PossessionsHome, PossessionsAway
#'
#'
#'
#' @keywords NBA, Plus/Minus, Adjusted Plus/Minus
#'
#' @source BasketValue
"nba12"

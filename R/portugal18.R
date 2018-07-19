#' Data on Portugal Primera Liga 2016-2017: Games and standings before each round
#' Season: 2016/2017: For the teams advanced from lower division, the standing is set to 19 and 20
#' @docType data
#'
#' @usage data(portugal18)
#'
#' @format A data frame with 306 rows and 19 variables
#'
#' Home: The name of the home team
#'
#' Away: The name of the away team
#'
#' Round: the number of the round (34 overall)
#'
#' FTHG: Full Time Home Team Goals
#'
#' FTAG: Full Time Away Team Goals
#'
#' H_W; A_W: Number of the wins by home/away team before the given round
#' (for the first round all the statistics is based on the last round of previous season)
#'
#' H_D; A_D: Number of draws home/away
#'
#' H_L; A_L: Number of lost games
#'
#' H_Goals; A_Goals: Number of goals scored prior to the round
#'
#' H_Diff; A_Diff: The goal difference for home/away teams
#'
#' H_Pt; A_Pt: Points before the round for home and away teams
#'
#' H_Standing; A_Standing: Standing in the league table before the round
#'
#' @keywords football, Poisson regression
#'
#' @source \href{http://www.worldfootball.net}{WorldFootball.net}
"portugal18"

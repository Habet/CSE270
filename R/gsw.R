#' Golden State Warriors roster, 2017-18
#'
#' @docType data
#'
#' @usage data(gsw)
#'
#' @format A data frame with 15 rows and 12 variables. Each row is one player.
#' Used with \code{passing} to build the \code{n_pass} network.
#'
#' TeamID: NBA team id
#'
#' SEASON: Season start year
#'
#' PLAYER: Player's name
#'
#' NUM: Jersey number
#'
#' POSITION: Position, e.g. "G", "F", "C", "C-F"
#'
#' HEIGHT: Height in feet-inches, e.g. "6-7"
#'
#' WEIGHT: Weight in pounds
#'
#' BIRTH_DATE: Birth date, e.g. "OCT 25, 1995"
#'
#' AGE: Age
#'
#' EXP: Years of NBA experience ("R" is a rookie)
#'
#' SCHOOL: College or last school
#'
#' PLAYER_ID: NBA player id
#'
#' @keywords nba, network
#'
#' @source stats.nba.com
"gsw"

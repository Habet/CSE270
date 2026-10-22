#' Adjusted plus-minus design matrix, 2011-12 NBA stints
#'
#' @docType data
#'
#' @usage data(nba5)
#'
#' @format A data frame with 25300 rows and 474 variables. Each row is one
#' stint, in the same order as \code{nba12}. Each column is one player, named
#' by player id with an "X" prefix (player 714 is \code{X714}).
#'
#' A cell is 1 if the player is on the floor for the home team, -1 if he is on
#' the floor for the away team, and 0 if he is not on the floor. Add the home
#' margin from \code{nba12} to fit an adjusted plus-minus regression.
#'
#' @seealso \code{\link{nba12}}, \code{\link{nba6}}
#'
#' @keywords nba
#'
"nba5"

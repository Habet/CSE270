#' Golden State Warriors passing network, 2017-18
#'
#' @docType data
#'
#' @usage data(n_pass)
#'
#' @format A directed \code{network} object with 15 vertices and 201 edges,
#' built from \code{passing} and \code{gsw}. Each vertex is a player. An edge
#' from A to B means A made passes to B.
#'
#' vertex.names: Player's name
#'
#' position (vertex): Position from \code{gsw}
#'
#' ngames (vertex): Games played
#'
#' passes (edge): Number of passes from one player to the other
#'
#' FGP (edge): Field goal percentage on shots taken after those passes
#'
#' @keywords nba, network
#'
#' @source stats.nba.com
"n_pass"

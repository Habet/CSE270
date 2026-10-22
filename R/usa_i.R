#' US airports flight network, igraph version
#'
#' @docType data
#'
#' @usage data(usa_i)
#'
#' @format A directed, weighted \code{igraph} object with 610 vertices and
#' 5594 edges. The same network as \code{usa}, with the airport code stored in
#' the \code{name} vertex attribute.
#'
#' name (vertex): Airport code, e.g. "JFK"
#'
#' type (vertex): Airport size, e.g. "large_airport", "medium_airport"
#'
#' country (vertex): Country code ("US")
#'
#' lat (vertex): Latitude
#'
#' long (vertex): Longitude
#'
#' weight (edge): Number of flights on the route
#'
#' @seealso \code{\link{usa}}
#'
#' @keywords network
#'
"usa_i"

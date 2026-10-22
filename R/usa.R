#' US airports flight network
#'
#' @docType data
#'
#' @usage data(usa)
#'
#' @format A directed \code{network} object with 610 vertices and 5594 edges.
#' Each vertex is a US airport. An edge from A to B means there are direct
#' flights from A to B. \code{usa_i} is the same network as an igraph object.
#'
#' vertex.names: Airport code, e.g. "JFK"
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
#' @seealso \code{\link{usa_i}}
#'
#' @keywords network
#'
"usa"

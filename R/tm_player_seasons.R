#' Transfermarkt player-seasons in the top five leagues, CL, and EL
#'
#' @docType data
#'
#' @usage data(tm_player_seasons)
#'
#' @format A data frame with 45244 rows and 9 variables. Each row is one player
#' in one season (Transfermarkt saison_id: 2012 is 2012/13, through 2025/26).
#' Competitions: GB1, ES1, IT1, FR1, L1, CL, EL. Appearances with 0 minutes
#' are dropped. PPG is the mean of 3/1/0 match points from club_games in
#' matches the player appeared.
#'
#' player_id: Transfermarkt player id
#'
#' PlayerName: Player's name
#'
#' Season: Season start year (2012 = 2012/13)
#'
#' Appearances: Matches played with minutes greater than 0
#'
#' MinutesPlayed: Minutes on the pitch
#'
#' Goals: Goals
#'
#' Assists: Assists
#'
#' GamesWon: Wins for the player's club in those matches
#'
#' PPG: Points per game (win = 3, draw = 1, loss = 0)
#'
#' @keywords football, Transfermarkt
#'
#' @source Transfermarkt via the transfermarkt-datasets dump (appearances,
#' games, club_games). Refreshed by Cse270DataCollection::GoatFootballScraper.
"tm_player_seasons"

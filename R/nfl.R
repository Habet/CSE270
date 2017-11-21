#' Data on NFL matches
#'
#'
#' @docType data
#'
#' @usage data(nfl)
#'
#' @format A data frame with 4336 rows and 13 variables
#'
#' schedule_season: from 2000-2016
#'
#' schedule_week: The number of the week when the game was played
#'
#' schedule_date: The actual date of the game
#'
#' team_away: Away team
#'
#' score_away: The score of the away team
#'
#' team_home: Home team
#'
#' score_home: The score of home team
#'
#' stadium: The name of the stadium
#'
#' stadium_type: indoor, outdoor, retractable
#'
#' stadium_location: The location of the stadium: City and state abbreviation
#'
#' result: The result of the game: H=Home Win, T=Tie, A=Away Win
#'
#' spread: points spread, the difference between away team and home team scores
#'
#' home_odds_open, home_odds_close: Opening and closing decimal odds for the home team
#'
#' away_odds_open, away_odds_open: Opening and closing decimal odds for the away team (The data is missing for some seasons)
#'
#' Source for odds: http://www.aussportsbetting.com/data/historical-nfl-results-and-odds-data/
#'
#'
#' @keywords nfl, Elo rating, betting strategy
#'
"nfl"

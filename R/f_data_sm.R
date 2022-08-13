#' Data on football matches from www.football-data.co.uk-only major leagues and metrics
#'
#' @docType data
#'
#' @usage data(f_data_sm)
#'
#' @format A data frame with 84364 rows and 14 variables
#'
#' SEASON: from 1994-2018
#'
#' COUNTRY: The country of the league: "Germany", "Belgium", "Netherlands", "England", "Greece"
#' "Portugal", "Scotland", "Turkey", "Spain", "France", "Italy"
#'
#' LEAGUE: The name of the league: The first league of every country is included
#'
#' DATE: the date of the game
#'
#' HOMETEAM: The name of the home team
#'
#' AWAYTEAM: The name of the away team
#'
#' FTSC: Full Time score
#'
#' FTR: Full Time Result (H=Home Win, D=Draw, A=Away Win, "-"=unknown)
#'
#' FTHG: Full Time Home Team Goals
#'
#' FTAG: Full Time Away Team Goals
#'
#' FTTG: Full Time Total Goals
#'
#' H, D, A Betting odds (Home, Draw, Away) from Bet365
#'
#'
#' @keywords football, Poisson
#'
#' @source \href{http://www.football-data.co.uk/downloadm.php}{football data UK}
"f_data_sm"

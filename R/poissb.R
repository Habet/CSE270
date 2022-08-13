#' @title Poisson Predictor of Winning Probabilities for Two Teams in a Head-to-Head Basketball Match-up.
#' @name poissb
#' @aliases poissb
#' @description This function analyzes the provided data on basketball matches and, based on the number of
#' points accumulated by a team, returns winning probabilities of home and away teams through the algorithm
#' of Poisson distribution.
#' @usage poissb(df, season = NULL, year = NULL, team, opponent)
#' @param df A data frame. Contains the historical basketball data of an interest. Teams' names and the end
#' scores of games should be strictly present in the data.
#' @param season Boolean. Indicates whether the data is nested among several seasons. If TRUE, the data is
#' shortly thereafter subsetted to obtain the predictions resting on the outcomes of a particular season.
#' A season is then specified under the argument "Year". If FALSE, the predictions are made with regards to
#' the initial number of observations.
#' @param year Optional. Accepts the season/year, based on the actual data of which the predictions are
#' made. Can be applied only in case "season" = TRUE. Otherwise, running the function will result in an
#' error message.
#' @param team A character string. Accepts the club name of a Home team, as identified in a data frame.
#' @param opponent A character string. Accepts the club name of an Away team, as identified in a data frame.
#' @return A vector with respective probabilities of each of teams' victory against the other.
#' @details poissb() is designed in a way to adjust itself once the structure of data frame is given.
#' Nonetheless, for the sake of user convenience and avoidance of bulky number of arguments that user should
#' specify, the code has been simplified and constrained in what can be imported to it.
#'
#' The function will process the data only if 4 (without Year specification) or 5 (with) columns are
#' supplied. Column names of a data frame should be of following labels: "Home_Team", "Away_Team",
#' "Home_PTS", "Away_PTS", "Year" (optional). Also note that the order of the data frame labels should be
#' preserved as illustrated above. If either of the abovementioned or both are not abided by, running the
#' function will result in an error message.
#'
#' The essence of the prediction is quite simple: the underlying core within the process is a Generalized
#' Linear Model (glm) of a "poisson" family. The regression is undertaken to arrive at the points scored
#' mean for a team given that it plays a particular opponent; nothing but the opponent specification and
#' home advantage are accounted for in deriving the estimates.
#'
#' The Poisson probabilities are then computed within a range from lower bound of 0 to upper bound of 180
#' points per game. The probability of draw, although not of a great significance and possibility in
#' basketball, is allowed for by adding up to winning probabilities of each of the teams as a minor weight.
#' @examples
#' data(nba2009_2016)
#' test <- nba2009_2016[, c(1,4,5,7,8)]
#' test1 <- data.frame("Home_Team" = test$home.TEAM_NAME, "Away_Team" = test$away.TEAM_NAME,
#' "Home_PTS" = test$home.PTS, "Away_PTS" = test$away.PTS, "Year" = test$SEASON_ID)
#' test2 <- data.frame("Home_Team" = test$home.TEAM_NAME, "Away_Team" = test$away.TEAM_NAME,
#' "Home_PTS" = test$home.PTS, "Away_PTS" = test$away.PTS)
#'
#' poissb(df = test1, season = T, year = 22010, team = "Cleveland Cavaliers", opponent = "Los Angeles Lakers")
#' poissb(df = test2, season = F, team = "Cleveland Cavaliers", opponent = "Los Angeles Lakers")
#'
#' Erroneous specifications
#'
#' by Season/Year discrepancy:
#' poissb(df = test1, season = TRUE, team = "Cleveland Cavaliers", opponent = "Los Angeles Lakers")
#' poissb(df = test2, season = FALSE, year = 22010, team = "Cleveland Cavaliers", opponent = "Los Angeles Lakers")
#'
#' by ncol discrepancy:
#' poissb(df = nba2009_2016, year = 22010, team = "Cleveland Cavaliers", opponent = "Los Angeles Lakers")
#' poissb(df = nba2009_2016, season = FALSE, team = "Cleveland Cavaliers", opponent = "Los Angeles Lakers")
#'
#' by colnames discrepancy:
#' poissb(df = iris, season = TRUE, year = 22010, team = "Cleveland Cavaliers", opponent = "Los Angeles Lakers")
#'
#' Author: Yuri Shahnazaryan
#'
#' @export
poissb <- function(df, season = TRUE, year = NULL,team, opponent) {
  df <- data.frame(df)
  if (season == TRUE) {
    t1 <- c("Home_Team", "Away_Team", "Home_PTS", "Away_PTS", "Year")
    if (missing(year) == TRUE) {
      stop("The argument 'Season' was specified as present")
    } else {
      if (ncol(df) != 5) {
        stop("Number of columns of data frame should be equal to 5")
      } else {
        if (any(colnames(df) != t1)) {
          stop("Names of columns of data frame should be set accordingly")
        } else {
          df <- df[df$Year == year, ]
          object2 <- df[, c("Home_Team", "Away_Team", "Home_PTS")]
          object3 <- df[, c("Home_Team", "Away_Team", "Away_PTS")]
          data1 <- data.frame(object2, Home = 1)
          data2 <- data.frame(object3, Home = 0)
          colnames(data1) <- c("Team","Opponent","Points","Home")
          colnames(data2) <- c("Team","Opponent","Points","Home")
          data3 <- rbind(data1,data2)
          model <- glm(Points~., data = data3,
                       family = poisson(link=log))
          lambda1 <-
            predict(model,data.frame(Home=1,Team = team, Opponent = opponent), type = "response")
          lambda2 <-
            predict(model,data.frame(Home=0,Team = team, Opponent = opponent), type = "response")
          options(digits=2)
          prob1 <- dpois(c(0:180), lambda = lambda1)
          prob2 <- dpois(c(0:180), lambda = lambda2)
          probmatrix<- prob1 %*% t(prob2)
          round(probmatrix, digits = 4)
          options(scipen = 999, digits = 3)
          draw <- sum(diag(probmatrix))
          hwin <- sum(probmatrix[lower.tri(probmatrix, diag=F)])
          awin <- sum(probmatrix[upper.tri(probmatrix, diag=F)])
          hwin <- hwin + hwin*draw
          awin <- awin + awin*draw
          game <- c(hwin, awin)
          names(game) <- c(team, opponent)
          return(game)
        }
      }}} else if (season == FALSE) {
        t <- c("Home_Team", "Away_Team", "Home_PTS", "Away_PTS")
        if (missing(year) == FALSE) {
          stop("The argument 'Season' was specified as absent")
        } else {
          if (ncol(df) != 4) {
            stop("Number of columns of data frame should be equal to 4")
          } else {
            if (any(colnames(df) != t)) {
              stop("Names of columns of data frame should be set accordingly")
            } else {
              object2 <- df[, c("Home_Team", "Away_Team", "Home_PTS")]
              object3 <- df[, c("Home_Team", "Away_Team", "Away_PTS")]
              data1 <- data.frame(object2, Home = 1)
              data2 <- data.frame(object3, Home = 0)
              colnames(data1) <- c("Team","Opponent","Points","Home")
              colnames(data2) <- c("Team","Opponent","Points","Home")
              data3 <- rbind(data1,data2)
              model <- glm(Points~., data = data3,
                           family = poisson(link=log))
              lambda1 <-
                predict(model,data.frame(Home=1,Team = team, Opponent = opponent), type = "response")
              lambda2 <-
                predict(model,data.frame(Home=0,Team = team, Opponent = opponent), type = "response")
              options(digits=2)
              prob1 <- dpois(c(0:180), lambda = lambda1)
              prob2 <- dpois(c(0:180), lambda = lambda2)
              probmatrix<- prob1 %*% t(prob2)
              round(probmatrix, digits = 4)
              options(scipen = 999, digits = 3)
              draw <- sum(diag(probmatrix))
              hwin <- sum(probmatrix[lower.tri(probmatrix, diag=F)])
              awin <- sum(probmatrix[upper.tri(probmatrix, diag=F)])
              hwin <- hwin + hwin*draw
              awin <- awin + awin*draw
              game <- c(hwin, awin)
              names(game) <- c(team, opponent)
              return(game)
            }
          }
        }
      }
}


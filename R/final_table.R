#' @title Final League table
#' @name final_table
#' @aliases final_table
#' @description Creates final league table
#' @param data dataframe with the same structure as f_data_sm
#' @param league The league for which the table is created
#' @param season the season for which the table is returned, season 2017/2018 will be given as 2018
#' @import dplyr
#' @return dataframe with the final league standing
#' @export

final_table <-  function (data, league, season) {
  sa <- data %>% filter(SEASON == season, LEAGUE == league) %>%
    group_by(HOMETEAM) %>% summarise(W = sum(FTR == "H"),
                                     D = sum(FTR == "D"), L = sum(FTR == "A"), GF = sum(FTHG),
                                     GA = sum(FTAG))
  sa1 <- data %>% filter(SEASON == season, LEAGUE == league) %>%
    group_by(AWAYTEAM) %>% summarise(W = sum(FTR == "A"),
                                     D = sum(FTR == "D"), L = sum(FTR == "H"), GF = sum(FTAG),
                                     GA = sum(FTHG))
  temp <- data.frame(sa[, 1], M = (nrow(sa1)-1)*2, sa[, 2:4] + sa1[, 2:4],
                     sa[,5] + sa1[, 5], sa[, 6] + sa1[, 6])

  temp$DIFF <- temp$GF - temp$GA
  temp$POINTS <- temp$W * 3 + temp$D
  temp <- temp[order(temp$POINTS, decreasing = T), ]
  rownames(temp) <- NULL
  temp$POSITION <- 1:nrow(temp)
  colnames(temp)[1] <- "TEAM"
  return(temp)
}

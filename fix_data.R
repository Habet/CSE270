install.packages("dplyr")
library(dplyr)

load(file = "data/nfl_st.rda")

nfl_st[nfl_st$T == -1,] <- 0

save(nfl_st, file = "data/nfl_st.rda")


load(file = "data/mlb_standings.rda") 

mlb_standings <- mlb_standings %>%
    group_by(Season) %>%
    arrange(desc(W)) %>%
    mutate(Rank = 1:n()) %>%
    ungroup() %>%
    arrange(Season)

save(mlb_standings, file = "data/mlb_standings.rda")


nba_players <- read.csv("./nba_players.csv")
save(nba_players, file = "data/nba_players.rda") 

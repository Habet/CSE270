library(rvest)
library(stringr)
  url<-c("http://www.worldfootball.net/schedule/ita-serie-a-2018-2019-spieltag/38/")
  url<-read_html(url)
  #k<-html_node(url, ".box")
  kk<- rvest::html_table(url, header = TRUE)
  ko<-kk[[4]]
  #ko$Round<-rep(i,18)
  ko <- ko[,-c(1:2)]
  ko <- data.frame(Rank=seq(1,20,1), ko, Season=2019)
  colnames(ko) <- colnames(seriea_st)

  seriea_st <- rbind(seriea_st, ko)  
save(seriea_st, file="seriea_st/seriea_st.rda")  

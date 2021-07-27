make.distance.matrix <- function(group='P1', xlsx.dir='analysis/data/xlsx', data.xlsx='Raw_Sorting_Data_151102.xlsx'){
  # Make distance matrix for hierarchical clustering
  require(xlsx)
  
  source('analysis/jaccard.data.R')
  df <- read.xlsx(paste(xlsx.dir, data.xlsx, sep="/"), sheetName = group)
  names(df)[3:22]<-c(as.character(1:20))
  m <-jaccard.data(df, duplicates=TRUE, frame = FALSE)

  # 1-Jaccard index gives Jaccard distance
  jd <- 1 - m
  d <- dist(jd)
  d
}
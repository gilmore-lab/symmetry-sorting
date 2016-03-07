make.symm.df <- function(group='P1', xlsx.dir='analysis/data/xlsx', data.xlsx='Raw_Sorting_Data_151102.xlsx'){
  # Convert xlsx to data frame
  
  require(xlsx)

  df <- read.xlsx(paste(xlsx.dir, data.xlsx, sep="/"), sheetName = group)
  
  # rename columns
  names(df)[3:22]<-c(as.character(1:20))
  names(df)[23]<-"Nsets"
  df$Group <- group
  
  df
}
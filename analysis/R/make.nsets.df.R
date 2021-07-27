make.nsets.df <- function(analysis.dir='analysis/', data.xlsx = 'Raw_Sorting_Data_151102.xlsx'){
  # Makes a data.frame from the raw sorting data
  
  # Load externals
  require(xlsx)
  source('analysis/make.symm.df.R')
  
  data.dir <- paste(analysis.dir, 'data/', sep="")
  xlsx.dir <- paste(data.dir, 'xlsx/', sep="")
  csv.dir <- data.dir
  
  db.wallpapers <- 'wallpapers-on-databrary.csv'
  wallpaper.groups <- c('P1', 'P3M1', 'P31M', 'P6', 'P6M')
  
  # Import raw data
  l <- lapply(wallpaper.groups, make.symm.df)
  n.sets.df <- Reduce(function(x, y) merge(x, y, all=TRUE), l)
  
  # Drop exemplar columns
  n.sets.df <- n.sets.df[,c('Participant', 'Set', 'Nsets', 'Group')]
  out.fn <- paste(data.dir, 'nsets.csv', sep="")
  write.csv(n.sets.df, file=out.fn, row.names = FALSE)
  n.sets.df
}

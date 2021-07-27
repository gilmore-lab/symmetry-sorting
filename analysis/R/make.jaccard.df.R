make.jaccard.df <- function(duplicates = FALSE, analysis.dir='analysis/', data.xlsx = 'Raw_Sorting_Data_151102.xlsx'){
  # Makes a data.frame from the raw sorting data
  
  # Load externals
  require(xlsx)
  source(paste(analysis.dir, "jaccard.data.R", sep=""))
  source(paste(analysis.dir, "jaccard.R", sep=""))
  
  data.dir <- paste(analysis.dir, 'data/', sep="")
  xlsx.dir <- paste(data.dir, 'xlsx/', sep="")
  csv.dir <- data.dir
  
  db.wallpapers <- 'wallpapers-on-databrary.csv'
  wallpaper.groups <- c('P1', 'P3M1', 'P31M', 'P6', 'P6M')
  
  # Import raw data
  l <- lapply(wallpaper.groups, make.symm.df)
  
  # Calculate Jaccard indices, then merge
  l2 <- lapply(l, jaccard.data, duplicates=duplicates)
  jaccard.df <- Reduce(function(x, y) merge(x, y, all=TRUE), l2)
  
  if (duplicates){
    out.fn <- paste(data.dir, 'jaccard-all.csv', sep="")
  } else {
    out.fn <- paste(data.dir, 'jaccard.csv', sep="")
  }
  write.csv(x = jaccard.df, file = out.fn, row.names = FALSE)
  
  jaccard.df
}


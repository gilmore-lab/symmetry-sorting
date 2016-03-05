make.jaccard.df <- function(duplicates = FALSE, analysis.dir='analysis/', data.xlsx = 'Raw_Sorting_Data_151102.xlsx'){
  # Makes a data.frame from the raw sorting data
  
  # Load externals
  
  require(xlsx)
  
  data.dir <- paste(analysis.dir, 'data/', sep="")
  xlsx.dir <- paste(data.dir, 'xlsx/', sep="")
  csv.dir <- data.dir
  
  db.wallpapers <- 'wallpapers-on-databrary.csv'
  wallpaper.groups <- c('P1', 'P3M1', 'P31M', 'P6', 'P6M')
  
  source(paste(analysis.dir, "jaccard.data.R", sep=""))
  source(paste(analysis.dir, "jaccard.R", sep=""))
  
  # Import raw data and calculate Jaccard indices
  
  P1.df <- read.xlsx(paste(xlsx.dir, data.xlsx, sep="/"), sheetName = wallpaper.groups[1])
  P3M1.df <- read.xlsx(paste(xlsx.dir, data.xlsx, sep="/"), sheetName = wallpaper.groups[2])
  P31M.df <- read.xlsx(paste(xlsx.dir, data.xlsx, sep="/"), sheetName = wallpaper.groups[3])
  P6.df <- read.xlsx(paste(xlsx.dir, data.xlsx, sep="/"), sheetName = wallpaper.groups[4])
  P6M.df <- read.xlsx(paste(xlsx.dir, data.xlsx, sep="/"), sheetName = wallpaper.groups[5])
  
  # Rename NSets column
  names(P1.df)[23]<-"Nsets"
  names(P3M1.df)[23]<-"Nsets"
  names(P31M.df)[23]<-"Nsets"
  names(P6.df)[23]<-"Nsets"
  names(P6M.df)[23]<-"Nsets"
  
  # Rename exemplars
  names(P1.df)[3:22]<-c(as.character(1:20))
  names(P3M1.df)[3:22]<-c(as.character(1:20))
  names(P31M.df)[3:22]<-c(as.character(1:20))
  names(P6.df)[3:22]<-c(as.character(1:20))
  names(P6M.df)[3:22]<-c(as.character(1:20))
  
  # Calculate Jaccard indices, then merge
  
  P1.jaccard <- jaccard.data(P1.df, duplicates=duplicates)
  P3M1.jaccard <- jaccard.data(P3M1.df, duplicates=duplicates)
  P31M.jaccard <- jaccard.data(P31M.df, duplicates=duplicates)
  P6.jaccard <- jaccard.data(P6.df, duplicates=duplicates)
  P6M.jaccard <- jaccard.data(P6M.df, duplicates=duplicates)
  
  jaccard.nodups <- rbind(P1.jaccard, P3M1.jaccard, P31M.jaccard, P6.jaccard, P6M.jaccard)
  
  jaccard.df <- data.frame(Exemplar.Row = jaccard.nodups[,1],
                           Exemplar.Col = jaccard.nodups[,2],
                           Jaccard = jaccard.nodups[,3])
  
  jaccard.df$Group <- c(rep('P1', dim(P1.jaccard)[1]),
                        rep('P3M1', dim(P3M1.jaccard)[1]),
                        rep('P31M', dim(P31M.jaccard)[1]),
                        rep('P6', dim(P6.jaccard)[1]),
                        rep('P6M', dim(P6M.jaccard)[1])
  )
  
  if (duplicates){
    out.fn <- paste(data.dir, 'jaccard-all.csv', sep="")
  } else {
    out.fn <- paste(data.dir, 'jaccard.csv', sep="")
  }
  write.csv(x = jaccard.df, file = out.fn, row.names = FALSE)
  
  jaccard.df
}


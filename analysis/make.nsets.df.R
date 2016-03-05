make.nsets.df <- function(analysis.dir='analysis/', data.xlsx = 'Raw_Sorting_Data_151102.xlsx'){
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
  
  # Merge into data frame
  n.sets.df <- rbind(P1.df, P3M1.df, P31M.df, P6.df, P6M.df)
  
  n.sets.df$Group <- c(rep('P1', dim(P1.df)[1]),
                       rep('P3M1', dim(P3M1.df)[1]),
                       rep('P31M', dim(P31M.df)[1]),
                       rep('P6', dim(P6.df)[1]),
                       rep('P6M', dim(P6M.df)[1])
  )
  
  # Drop exemplar columns
  n.sets.df <- n.sets.df[,c('Participant', 'Set', 'Nsets', 'Group')]
  out.fn <- paste(data.dir, 'nsets.csv', sep="")
  write.csv(n.sets.df, file=out.fn, row.names = FALSE)
  n.sets.df
}

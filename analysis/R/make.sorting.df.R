make.sorting.df <- function(analysis.dir = 'analysis/', data.xlsx = 'Raw_Sorting_Data_151102.xlsx'){
  source('analysis/make.nsets.df.R')
  source('analysis/make.jaccard.df.R')
  
  make.nsets.df(analysis.dir = analysis.dir)
  make.jaccard.df(duplicates = FALSE, analysis.dir = analysis.dir, data.xlsx = data.xlsx)
  make.jaccard.df(duplicates = TRUE, analysis.dir = analysis.dir, data.xlsx = data.xlsx)
}
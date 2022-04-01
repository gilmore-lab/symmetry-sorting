make.symm.df <- function(group='P1', xlsx.dir='analysis/data/xlsx', data.xlsx='Raw_Sorting_Data_151102.xlsx'){
  # Convert xlsx to data frame
  
  require(xlsx)

  df <- read.xlsx(paste(xlsx.dir, data.xlsx, sep="/"), sheetName = group)
  
  # rename columns
  names(df)[3:22] <- as.character(names(df)[3:22])
  names(df)[23] <- "Set_size"
  df$Group <- group
  
  df
}

save_sorting_csv <- function(group) {
  df <- make.symm.df(group = group)
  out_fn <- paste0(group, '-sorting.csv')
  readr::write_csv(df, file = file.path(here::here(), 'analysis/data', out_fn))
  message('Saved ', out_fn)
}

save_all_sorting_csv <- function() {
  g <- c("P1", "P31M", "P3M1", "P6", "P6M")
  purrr::map(g, save_sorting_csv)
}
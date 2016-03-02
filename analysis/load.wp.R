load.wp <- function(e, g, fn.df='analysis/data/wallpapers-on-databrary.csv'){
  # Loads selected wallpaper image from Databrary
  
  require(dplyr)
  # Load data frame of wallpaper identifiers, filter and select
  wp.db <- read.csv(fn.df, header=TRUE)
  s <- wp.db %>% filter(group==tolower(g))
  slot <- s[e,'slot']
  asset <- s[e,'asset']
  
  # Build URL and download
  url <- paste('https://nyu.databrary.org/slot', slot, '-/asset', asset, 'download?inline=true', sep='/')
  z = tempfile()
  download.file(url, z)
  p <- readPNG(z)
  file.remove(z)
  p
}
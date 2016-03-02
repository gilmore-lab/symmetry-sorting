plot.all.wp <- function(wp.group="P1", fn="analysis/data/wallpapers-on-databrary.csv"){
  source('analysis/load.wp.R')
  
  # Make wallpaper list from load.wp()
  cat('Downloading wallpapers from Databrary')
  wpl <- lapply(as.list(1:20), load.wp, wp.group, fn)
  
  # 4 rows of 5 each
  r1 <- cbind(wpl[[1]], wpl[[2]], wpl[[3]], wpl[[4]], wpl[[5]])
  r2 <- cbind(wpl[[6]], wpl[[7]], wpl[[8]], wpl[[9]], wpl[[10]])
  r3 <- cbind(wpl[[11]], wpl[[12]], wpl[[13]], wpl[[14]], wpl[[15]])
  r4 <- cbind(wpl[[16]], wpl[[17]], wpl[[18]], wpl[[19]], wpl[[20]])
  
  # Bind and plot
  cat('Plotting exemplars in 4 x 5 array')
  m <- rbind(r1, r2, r3, r4)
  plot.wp(m, asp.ratio = 4/5)
}
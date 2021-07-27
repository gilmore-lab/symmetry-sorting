display.exemplar.pairs <- function(e1, e2, group){
  # Loads and displays pair of wallpapers
  
  require(png)
  source("analysis/load.wp.R")
  
  e1.p <- load.wp(e1, group)
  e2.p <- load.wp(e2, group)
  
  wp <- cbind(e1.p, e2.p)
  nrows <- 1
  ncols <- 2
  asp.ratio <- nrows/ncols
  
  plot.new()
  plot.window(xlim=c(0,1), ylim=c(0,1), asp=asp.ratio) # square aspect ratio
  rasterImage(wp, 0, 0, 1, 1)
}
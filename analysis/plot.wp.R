plot.wp <- function(wp, asp.ratio=1){
  # plots wallpaper
  plot.new()
  plot.window(xlim=c(0,1), ylim=c(0,1), asp=asp.ratio) # square aspect ratio
  rasterImage(wp, 0, 0, 1, 1)
}
sub.sample.wp <- function(wp, sf = 1){
  wp.dim <- dim(wp)
  ds.dim <- round(wp.dim*sf)
  ds.mid <- round(ds.dim/2)
  ds.min <- round(ds.mid - ds.dim/2) + 1
  ds.max <- ds.dim + (ds.min-1)
  
  ds.wp <- wp[ds.min[1]:ds.max[1], ds.min[2]:ds.max[2]]
  
  return(ds.wp)
}
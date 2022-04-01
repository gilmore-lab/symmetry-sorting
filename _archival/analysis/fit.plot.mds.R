fit.plot.mds <- function(group="P1", dist.mat){
  # Fit MDS solution to dist.mat for wallpaper group and plot it.
  
  fit <- cmdscale(dist.mat, eig=TRUE, k=2) # k is the number of dim
  
  # plot solution 
  x <- fit$points[,1]
  y <- fit$points[,2]
  plot(x, y, xlab="Coordinate 1", ylab="Coordinate 2", 
       main="Metric MDS",	type="n")
  text(x, y, labels = as.character(1:20), cex=.7)
}
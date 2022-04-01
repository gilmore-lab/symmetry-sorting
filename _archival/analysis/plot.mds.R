plot.mds <- function(fit, ...){
  x <- fit$points[,1]
  y <- fit$points[,2]
  plot(x, y, xlab="Coordinate 1", ylab="Coordinate 2", 
         main="Metric MDS",	type="n")
    text(x, y, labels = as.character(1:20), cex=.7)
}
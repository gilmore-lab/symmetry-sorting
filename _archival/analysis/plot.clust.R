plot.clust <- function(fit, FUN, ...){
  if (FUN=='mds'){
    plot.mds(fit, ...)
  } else if (FUN == 'hclust') {
    plot(fit)
  }
}
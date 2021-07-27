fit.plot.clust <- function(wp.group, scale.factor, image.metric, clust.method, k){
  stat.val <- compute.image.metric(group = wp.group, sf = scale.factor, duplicates = TRUE, frame=FALSE,  FUN=image.metric, analysis.dir = 'analysis/')
  
  d <- dist(1 - stat.val)
  fit <- fit.clust(d, cluster.method, dim=k)
  plot.clust(fit, cluster.method)
}
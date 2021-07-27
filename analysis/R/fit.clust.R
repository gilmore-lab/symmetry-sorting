fit.clust <- function(d.mat, FUN, ...){
  if (FUN=='mds'){
    fit <- cmdscale(d.mat, eig=TRUE, k=dim) # k is the number of dim    
  } else if (FUN == 'hclust'){
    fit <- hclust(d.mat)
  }
  return(fit)
}
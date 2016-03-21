image.dot.prod <- function(i1, i2){
  if (dim(i1) == dim(i2)){
    dp <- (as.vector(i1) %*% as.vector(i2)/(norm.vect(i1)*norm.vect(i2)))
  } else {
    dp = NA
  }
  return(dp)
}
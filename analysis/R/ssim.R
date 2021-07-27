ssim <- function(x, y){
  # See https://en.wikipedia.org/wiki/Structural_similarity
  
  k1 <- .01
  k2 <- .03
  bits.per.pixel <- 8
  L <- 2^(bits.per.pixel)-1
  c1 <- (k1*L)^2
  c2 <- (k2*L)^2
  
  dim.x <- dim(x)
  dim.y <- dim(y)
  dim(x) <- c(dim(x)[1]*dim(x)[2],1)
  dim(y) <- c(dim(y)[1]*dim(y)[2],1)
  
  mu.x <- mean(x)
  mu.y <- mean(y)
  var.x <- var(x)
  var.y <- var(y)
  cov.xy <- cov(x,y)
  
  ssim.val <- ((2*mu.x*mu.y + c1)*(2*cov.xy + c2))/(((mu.x)^2 + (mu.y)^2 + c1)*(var.x + var.y + c2))
  ssim.val
}
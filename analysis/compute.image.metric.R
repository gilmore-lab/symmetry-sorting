compute.image.metric <- function(group = 'P1', duplicates=FALSE, frame=TRUE, FUN=ssim, analysis.dir = 'analysis/'){
  
  source(paste(analysis.dir, 'ssim.R', sep=""))
  source(paste(analysis.dir, 'load.wp.R', sep=""))

  start <- 2
  row.index <- 1
  if (duplicates) {
    if (frame){
      out <- array(dim=c(20*20,3))
      for (i in 1:20){
        i1 <- load.wp(e = i, g = group)
        for (j in 1:20){
          i2 <- load.wp(e = j, g = group)
          out[row.index, 1] <- i
          out[row.index, 2] <- j
          out[row.index, 3] <- FUN(i1, i2)
          row.index <- row.index + 1
        }
      }
      out <- data.frame(out)
      names(out) <- c('Exemplar.Row', 'Exemplar.Col', 'SSIM')
      out$Group <- rep(group, 400)
    } else {
      out <- array(dim=c(20,20))
      for (i in 1:20){
        i1 <- load.wp(e = i, g = group)
        for (j in 1:20){
          i2 <- load.wp(e = j, g = group)
          out[i, j] <- FUN(i1, i2)
        }
      }
    }
  } else {
    out <- array(dim=c(190,3))
    for (i in 1:19){
      i1 <- load.wp(e = i, g = group)
      for (j in i+1:(20-i)){
        i2 <- load.wp(e = j, g = group)
        out[row.index, 1] <- i
        out[row.index, 2] <- j
        out[row.index, 3] <- FUN(i1, i2)
        row.index <- row.index + 1
      }
    }
    out <- data.frame(out)
    names(out) <- c('Exemplar.Row', 'Exemplar.Col', 'SSIM')
    out$Group <- rep(group, 190)
  }
  out
}
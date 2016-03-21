compute.image.metric <- function(group = 'P1', sf = 1, duplicates=FALSE, frame=TRUE, FUN=ssim, analysis.dir = 'analysis/'){
  
  source(paste(analysis.dir, 'ssim.R', sep=""))
  source(paste(analysis.dir, 'image.dot.prod.R', sep=""))
  source(paste(analysis.dir, 'load.wp.R', sep=""))
  source(paste(analysis.dir, 'sub.sample.wp.R', sep=""))

  start <- 2
  row.index <- 1
  if (duplicates) {
    if (frame){
      out <- array(dim=c(20*20,3))
      for (i in 1:20){
        i1 <- sub.sample.wp(load.wp(e = i, g = group), sf=sf)
        for (j in 1:20){
          i2 <- sub.sample.wp(load.wp(e = j, g = group), sf=sf)
          out[row.index, 1] <- i
          out[row.index, 2] <- j
          out[row.index, 3] <- FUN(i1, i2)
          row.index <- row.index + 1
        }
      }
      out <- data.frame(out)
      names(out) <- c('Exemplar.Row', 'Exemplar.Col', 'Measure.Val')
      out$Group <- rep(group, 400)
    } else {
      out <- array(dim=c(20,20))
      for (i in 1:20){
        i1 <- sub.sample.wp(load.wp(e = i, g = group), sf=sf)
        for (j in 1:20){
          i2 <- sub.sample.wp(load.wp(e = j, g = group), sf=sf)
          out[i, j] <- FUN(i1, i2)
        }
      }
    }
  } else {
    out <- array(dim=c(190,3))
    for (i in 1:19){
      i1 <- sub.sample.wp(load.wp(e = i, g = group), sf=sf)
      for (j in i+1:(20-i)){
        i2 <- sub.sample.wp(load.wp(e = j, g = group), sf=sf)
        out[row.index, 1] <- i
        out[row.index, 2] <- j
        out[row.index, 3] <- FUN(i1, i2)
        row.index <- row.index + 1
      }
    }
    out <- data.frame(out)
    names(out) <- c('Exemplar.Row', 'Exemplar.Col', 'Measure.Val')
    out$Group <- rep(group, 190)
  }
  out
}
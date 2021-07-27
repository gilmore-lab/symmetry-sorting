compute.image.metric <- function(this_group, sf = 1, 
                                 duplicates=FALSE, frame=TRUE, 
                                 FUN=ssim, analysis.dir = 'analysis/'){
  
  require(tidyverse)
  
  source(paste(analysis.dir, 'ssim.R', sep=""))
  source(paste(analysis.dir, 'image.dot.prod.R', sep=""))
  source(paste(analysis.dir, 'load.wp.R', sep=""))
  source(paste(analysis.dir, 'sub.sample.wp.R', sep=""))

  wp_df <- readr::read_csv('analysis/data/wallpapers-on-databrary.csv')
  wp_this_group <- dplyr::filter(wp_df, group == tolower(this_group))
  
  start <- 2
  row.index <- 1
  if (duplicates) {
    if (frame){
      out <- array(dim=c(20*20,3))
      for (i in 1:20){
        i1 <- sub.sample.wp(load.wp(e = i, g = this_group), sf=sf)
        i1_name <- wp_this_group$name[i]
        for (j in 1:20){
          i2 <- sub.sample.wp(load.wp(e = j, g = this_group), sf=sf)
          i2_name <- wp_this_group$name[j]
          out[row.index, 1] <- i1_name
          out[row.index, 2] <- i2_name
          #out[row.index, 3] <- FUN(i1, i2)
          out[row.index, 3] <- do.call(FUN, list(i1, i2))
          row.index <- row.index + 1
        }
      }
      out <- data.frame(out)
      names(out) <- c('Exemplar.Row', 'Exemplar.Col', 'Measure.Val')
      out$Group <- rep(this_group, 400)
    } else {
      out <- array(dim=c(20,20))
      for (i in 1:20){
        i1 <- sub.sample.wp(load.wp(e = i, g = this_group), sf=sf)
        for (j in 1:20){
          i2 <- sub.sample.wp(load.wp(e = j, g = this_group), sf=sf)
          #out[i, j] <- FUN(i1, i2)
          out[i, j] <- do.call(FUN, list(i1, i2))
        }
      }
    }
  } else {
    out <- array(dim=c(190,3))
    for (i in 1:19){
      i1 <- sub.sample.wp(load.wp(e = i, g = this_group), sf=sf)
      i1_name <- wp_this_group$name[i]
      for (j in i+1:(20-i)){
        i2 <- sub.sample.wp(load.wp(e = j, g = this_group), sf=sf)
        i2_name <- wp_this_group$name[j]
        out[row.index, 1] <- i1_name
        out[row.index, 2] <- i2_name
        #out[row.index, 3] <- FUN(i1, i2)
        out[row.index, 3] <- do.call(FUN, list(i1, i2))
        row.index <- row.index + 1
      }
    }
    out <- data.frame(out)
    names(out) <- c('Exemplar.Row', 'Exemplar.Col', 'Measure_Val')
    out$Group <- rep(this_group, 190)
    #out$measure <- as.name(FUN) # Not sure how to do this yet
  }
  out
}
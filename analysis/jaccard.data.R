jaccard.data <- function(df, duplicates=FALSE, frame=TRUE){
  # Calculates Jaccard index for sorting exemplars
  # Returns tidy data frame if frame=TRUE, else square matrix
  # Returns tidy data frame without duplicate entries if duplicates=FALSE
  
  source('analysis/jaccard.R')
  
  start <- 2
  row.index <- 1
  
  exemplar_names <- names(df)[3:22]
  exemplar_names <- stringr::str_remove_all(exemplar_names, 'X')
  if (duplicates) {
    if (frame){
      out <- array(dim=c(20*20,3))
      for (i in 1:20){
        for (j in 1:20){
          out[row.index, 1] <- exemplar_names[i]
          out[row.index, 2] <- exemplar_names[j]
          out[row.index, 3] <- jaccard(df[,i+start],df[,j+start])
          row.index <- row.index + 1
        }
      }
      out <- data.frame(out)
      names(out) <- c('Exemplar.Row', 'Exemplar.Col', 'Jaccard')
      group <- unique(data.frame(df)$Group)
      out$Group <- rep(group, 400)
    } else {
      out <- array(dim=c(20,20))
      for (i in 1:20){
        for (j in 1:20){
          out[i, j] <- jaccard(df[,i+start],df[,j+start])
        }
      }
    }
  } else {
    out <- array(dim=c(190,3))
    for (i in 1:19){
      for (j in i+1:(20-i)){
        out[row.index, 1] <- exemplar_names[i]
        out[row.index, 2] <- exemplar_names[j]
        out[row.index, 3] <- jaccard(df[,i+start],df[,j+start])
        row.index <- row.index + 1
      }
    }
    out <- data.frame(out)
    names(out) <- c('Exemplar.Row', 'Exemplar.Col', 'Jaccard')
    group <- unique(data.frame(df)$Group)
    out$Group <- rep(group, 190)
  }
  out
}
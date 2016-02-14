jaccard.data <- function(df, duplicates=FALSE){
	start <- 2
	row.index <- 1
	if (duplicates) {
	  out <- array(dim=c(20*20,3))
	  for (i in 1:20){
	    for (j in 1:20){
	      out[row.index, 1] <- i
	      out[row.index, 2] <- j
	      out[row.index, 3] <- jaccard(df[,i+start],df[,j+start])
	      row.index <- row.index + 1
	    }
	  }
	} else {
	  out <- array(dim=c(190,3))
	  for (i in 1:19){
	    for (j in i+1:(20-i)){
	      out[row.index, 1] <- i
	      out[row.index, 2] <- j
	      out[row.index, 3] <- jaccard(df[,i+start],df[,j+start])
	      row.index <- row.index + 1
	    }
	  }
	}
	out
}
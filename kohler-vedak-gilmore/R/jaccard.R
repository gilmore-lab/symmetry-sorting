jaccard <- function(e1, e2){
	a <- sum(e1)
	b <- sum(e2)
	c <- sum(e1*e2)
	c/(a+b-c)
}
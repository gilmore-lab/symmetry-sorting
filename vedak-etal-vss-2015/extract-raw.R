# converting raw counts to data frame

# p1.df <- read.csv("p1-raw.csv")
# 
# # Extract matrix of "sets", rows are stimuli, columns are participants
# p1.t <- t(as.matrix(p1.df[,3:22]))
# 
# # Start to define elements of new data frame
# paired <- as.vector(p1.t)
# exemplar <- rep(labels(p1.t)[[1]], length(paired)/20)
# sets.per.participant <- with( p1.df, table( Participant ))
# participant <- rep(levels(p1.df$Participant), sets.per.participant*20)

# Read similarity matrix
p1.exemplar.df <- read.csv("../Similarity Matrices/P1.csv")
p1.exemplar.m <- as.matrix(p1.exemplar.df[,2:21])
Jaccard <- as.vector(p1.exemplar.m)
Exemplar.Row <- with( p1.exemplar.df, rep(Cross.Stim, 20))
Exemplar.Col <- with(p1.exemplar.df, rep(Cross.Stim, each=20))
Group = rep("P1", length(Jaccard))
p1.jaccard.df <- data.frame( Group, Exemplar.Row, Exemplar.Col, Jaccard )
write.csv(p1.jaccard.df, "P1-jaccard.csv", row.names=FALSE )

# Read similarity matrix
p3m1.exemplar.df <- read.csv("../Similarity Matrices/P3M1.csv")
p3m1.exemplar.m <- as.matrix(p3m1.exemplar.df[,2:21])
Jaccard <- as.vector(p3m1.exemplar.m)
Exemplar.Row <- with( p3m1.exemplar.df, rep(Cross.Stim, 20))
Exemplar.Col <- with(p3m1.exemplar.df, rep(Cross.Stim, each=20))
Group = rep("P3M1", length(Jaccard))
p3m1.jaccard.df <- data.frame( Group, Exemplar.Row, Exemplar.Col, Jaccard )
write.csv(p3m1.jaccard.df, "P3M1-jaccard.csv", row.names=FALSE )

# Read similarity matrix
p31m.exemplar.df <- read.csv("../Similarity Matrices/P1.csv")
p31m.exemplar.m <- as.matrix(p31m.exemplar.df[,2:21])
Jaccard <- as.vector(p31m.exemplar.m)
Exemplar.Row <- with( p31m.exemplar.df, rep(Cross.Stim, 20))
Exemplar.Col <- with(p31m.exemplar.df, rep(Cross.Stim, each=20))
Group = rep("P31M", length(Jaccard))
p31m.jaccard.df <- data.frame( Group, Exemplar.Row, Exemplar.Col, Jaccard )
write.csv(p31m.jaccard.df, "P31M-jaccard.csv", row.names=FALSE )

# Read similarity matrix
p6.exemplar.df <- read.csv("../Similarity Matrices/P6.csv")
p6.exemplar.m <- as.matrix(p6.exemplar.df[,2:21])
Jaccard <- as.vector(p6.exemplar.m)
Exemplar.Row <- with( p6.exemplar.df, rep(Cross.Stim, 20))
Exemplar.Col <- with(p6.exemplar.df, rep(Cross.Stim, each=20))
Group = rep("P6", length(Jaccard))
p6.jaccard.df <- data.frame( Group, Exemplar.Row, Exemplar.Col, Jaccard )
write.csv(p6.jaccard.df, "P6-jaccard.csv", row.names=FALSE )

# Read similarity matrix
p6m.exemplar.df <- read.csv("../Similarity Matrices/P6M.csv")
p6m.exemplar.m <- as.matrix(p6m.exemplar.df[,2:21])
Jaccard <- as.vector(p6m.exemplar.m)
Exemplar.Row <- with(p6m.exemplar.df, rep(Cross.Stim, 20))
Exemplar.Col <- with(p6m.exemplar.df, rep(Cross.Stim, each=20))
Group = rep("P6M", length(Jaccard))
p6m.jaccard.df <- data.frame( Group, Exemplar.Row, Exemplar.Col, Jaccard )
write.csv(p6m.jaccard.df, "P6M-jaccard.csv", row.names=FALSE )

# Merge
df.list = list(p1.jaccard.df, p3m1.jaccard.df, p31m.jaccard.df, p6.jaccard.df, p6m.jaccard.df)
jaccard.all.df <- Reduce( function(x,y) {merge(x,y, all=TRUE, sort=FALSE)}, df.list )

col.char <- as.character(jaccard.all.df$Exemplar.Col)
col.trim <- substr(col.char,nchar(col.char)-1, nchar(col.char))
row.char <- as.character(jaccard.all.df$Exemplar.Row)
row.trim <- substr(row.char,nchar(row.char)-1, nchar(row.char))

jaccard.all.df$Exemplar.Col <- as.numeric(col.trim)
jaccard.all.df$Exemplar.Row <- as.numeric(row.trim)

write.csv(jaccard.all.df, "jaccard-all.csv", row.names=FALSE)

# Clean-up
rm(list=ls())

# To-dos
# 3. Write function to do this automatically. Just for fun. Only going to run once.
# 5. What I really want is data frame with Row.Exemplar, Col.Exemplar, Paired, Group (P1, P31M, etc.), Participant
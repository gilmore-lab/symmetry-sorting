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
#What is 
#y<-as.name("p1")
p1.exemplar.df <- read.csv("../Similarity Matrices/P1.csv")
p1.exemplar.m <- as.matrix(p1.exemplar.df[,2:21])
Jaccard <- as.vector(p1.exemplar.m)
Exemplar.Row <- with(p1.exemplar.df, rep(Cross.Stim, 20))
Exemplar.Col <- with(p1.exemplar.df, rep(Cross.Stim, each=20))
p1.jaccard.df <- data.frame(Exemplar.Row, Exemplar.Col, Jaccard )
write.csv(p1.jaccard.df, "p1-jaccard.csv", row.names=FALSE )
p1.group <- rep("p1", each=400)
p1.group.jaccard.df <- data.frame(p1.group, p1.jaccard.df)

p3m1.exemplar.df <- read.csv("../Similarity Matrices/P3M1.csv")
p1.exemplar.m <- as.matrix(p3m1.exemplar.df[,2:21])
Jaccard <- as.vector(p3m1.exemplar.m)
Exemplar.Row <- with(p3m1.exemplar.df, rep(Cross.Stim, 20))
Exemplar.Col <- with(p3m1.exemplar.df, rep(Cross.Stim, each=20))
p3m1.jaccard.df <- data.frame(Exemplar.Row, Exemplar.Col, Jaccard )
write.csv(p3m1.jaccard.df, "p3m1-jaccard.csv", row.names=FALSE )
p3m1.group <- rep("p3m1", each=400)
p3m1.group.jaccard.df <- data.frame(p3m1.group, p3m1.jaccard.df)

p6.exemplar.df <- read.csv("../Similarity Matrices/P6.csv")
p6.exemplar.m <- as.matrix(p6.exemplar.df[,2:21])
Jaccard <- as.vector(p6.exemplar.m)
Exemplar.Row <- with(p6.exemplar.df, rep(Cross.Stim, 20))
Exemplar.Col <- with(p6.exemplar.df, rep(Cross.Stim, each=20))
p6.jaccard.df <- data.frame(Exemplar.Row, Exemplar.Col, Jaccard )
write.csv(p6.jaccard.df, "p6-jaccard.csv", row.names=FALSE )
p6.group <- rep("p6", each=400)
p6.group.jaccard.df <- data.frame(p6.group, p6.jaccard.df)

p6m.exemplar.df <- read.csv("../Similarity Matrices/P6M.csv")
p6m.exemplar.m <- as.matrix(p6m.exemplar.df[,2:21])
Jaccard <- as.vector(p6m.exemplar.m)
Exemplar.Row <- with(p6m.exemplar.df, rep(Cross.Stim, 20))
Exemplar.Col <- with(p6m.exemplar.df, rep(Cross.Stim, each=20))
p6m.jaccard.df <- data.frame(Exemplar.Row, Exemplar.Col, Jaccard )
write.csv(p6m.jaccard.df, "p6m-jaccard.csv", row.names=FALSE )
p6m.group <- rep("p6m", each=400)
p6m.group.jaccard.df <- data.frame(p6m.group, p6m.jaccard.df)

p31m.exemplar.df <- read.csv("../Similarity Matrices/P31M.csv")
p31m.exemplar.m <- as.matrix(p31m.exemplar.df[,2:21])
Jaccard <- as.vector(p31m.exemplar.m)
Exemplar.Row <- with(p31m.exemplar.df, rep(Cross.Stim, 20))
Exemplar.Col <- with(p31m.exemplar.df, rep(Cross.Stim, each=20))
p31m.jaccard.df <- data.frame(Exemplar.Row, Exemplar.Col, Jaccard )
write.csv(p31m.jaccard.df, "p31m-jaccard.csv", row.names=FALSE )
p31m.group <- rep("p31m", each=400)
p31m.group.jaccard.df <- data.frame(p31m.group, p31m.jaccard.df)

# Create group matrix
jaccard.all.df <- data.frame(p1.group.jaccard.df, p3m1.group.jaccard.df, p6.group.jaccard.df, p6m.group.jaccard.df, p31m.group.jaccard.df))
jaccard2.all.df <- as.matrix(jaccard.all.df[,1:4])º


# To-dos
# 1. Run code like lines 15-21 on P31M, P3M1, P6, P6M files
# 2. Concatenate the files into one big data frame. Add Group variable:{P1, ...}
# 3. Write function to do this automatically. Just for fun. Only going to run once.
# 4. Strip numbers to make exemplars in [1,20], 1nn0mmm. nn in [01,34], mmm in [00,020]
# 5. What I really want is data frame with Row.Exemplar, Col.Exemplar, Paired, Group (P1, P31M, etc.), Participant
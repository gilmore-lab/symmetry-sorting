# Symmetry sorting fragment
# 2015-11-05 rogilmore wrote

require(XLConnect)
setwd('~/Desktop/Sorting Data Raw Files/')
library(plyr)
library(reshape2)
library(ggplot2)
# can't use library(tidyr) until update R to 3.2.1

# Read workbook
wb <- loadWorkbook('Raw_Sorting_Data_151102.xlsx')

# Change sheet for other datasets, ending row varies by group
#str shows the structure of the data frame created
df.P1 <- readWorksheet(wb, sheet='P1', startCol=1, startRow=1, endCol=which(LETTERS=="W"), endRow = 121)
df.P1$SetID <- "P1"
names(df.P1) <-  c("Participant","Set","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","Set_size","Set_ID")
str(df.P1)
#for testing:
#write.csv(df.P1, file='~/Desktop/symmetry-sorting/csv/p1.csv', row.names=FALSE)

# Change sheet for other datasets, ending row varies by group
df.P3M1 <- readWorksheet(wb, sheet='P3M1', startCol=1, startRow=1, endCol=which(LETTERS=="W"), endRow = 152)
df.P3M1$SetID <- "P3M1"
names(df.P3M1) <-  c("Participant","Set","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","Set_size","Set_ID")
str(df.P3M1)

# Change sheet for other datasets, ending row varies by group
df.P31M <- readWorksheet(wb, sheet='P31M', startCol=1, startRow=1, endCol=which(LETTERS=="W"), endRow = 148)
df.P31M$SetID <- "P31M"
names(df.P31M) <-  c("Participant","Set","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","Set_size","Set_ID")
str(df.P31M)

# Change sheet for other datasets, ending row varies by group
df.P6 <- readWorksheet(wb, sheet='P6', startCol=1, startRow=1, endCol=which(LETTERS=="W"), endRow = 163)
df.P6$SetID <- "P6"
names(df.P6) <-  c("Participant","Set","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","Set_size","Set_ID")
str(df.P6)

# Change sheet for other datasets, ending row varies by group
df.P6M <- readWorksheet(wb, sheet='P6M', startCol=1, startRow=1, endCol=which(LETTERS=="W"), endRow = 161)
df.P6M$SetID <- "P6M"
names(df.P6M) <-  c("Participant","Set","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","Set_size","Set_ID")
str(df.P6M)

#MERGE datasets - need to sort by Set_ID, then Participant, then set # (1,2,3,4.....)
#so can then compare 1 with 2, with 3, with 4 etc. then 2 with 3, etc. each in its own row
df.set <- rbind(df.P1, df.P3M1, df.P31M, df.P6, df.P6M, all = TRUE)

# looong data set format
df.meltset <- melt(df.set, id=(c("Set_ID","Participant","Set")), measure=(c(3:22)))
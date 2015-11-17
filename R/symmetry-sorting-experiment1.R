# Symmetry sorting fragment
# 2015-11-05 rogilmore wrote

require(XLConnect)
setwd('~/Desktop/Sorting Data Raw Files/')

# Read workbook
wb <- loadWorkbook('Raw_Sorting_Data_151102.xlsx')

# Change sheet for other datasets, ending row varies by group
#str shows the structure of the data frame created
df.P1 <- readWorksheet(wb, sheet='P1', startCol=1, startRow=1, endCol=which(LETTERS=="W"), endRow = 121)
str(df.P1)

# Change sheet for other datasets, ending row varies by group
df.P3M1 <- readWorksheet(wb, sheet='P3M1', startCol=1, startRow=1, endCol=which(LETTERS=="W"), endRow = 152)

# Change sheet for other datasets, ending row varies by group
df.P31M <- readWorksheet(wb, sheet='P31M', startCol=1, startRow=1, endCol=which(LETTERS=="W"), endRow = 148)

# Change sheet for other datasets, ending row varies by group
df.P6 <- readWorksheet(wb, sheet='P6', startCol=1, startRow=1, endCol=which(LETTERS=="W"), endRow = 163)
str(df.P6)

# Change sheet for other datasets, ending row varies by group
df.P6M <- readWorksheet(wb, sheet='P6M', startCol=1, startRow=1, endCol=which(LETTERS=="W"), endRow = 161)
str(df.P6M)

# For set sizes only, select columns 1, 2, and 23
# (,some#) means that we're not setting a row limit, with c(pickedcolumns) setting column values
df.P1.setsize <- df.P1[,c(1,2,23)]
names(df.P1.setsize) <- c("Participant", "Set_num", "Set_size")

df.P1.setsize <- df.P1[,c(1,2,23)]
df.P1.size$Set <- "P1"
df.P1.setsize <- df.P1.size[,c(4,1,2,3)]
names(df.P1.setsize) <- c("Set", "Participant", "Set_num", "Set_size")

# Merge data frames
# variables:  Participant, Set_num, Set_size
df.setsize.all <- merge (df.P1.setsize, df.P3M1.setsize, df.P31M.setsize, df.P6.setsize, df.P6M.setsize)

# Export

write.csv(df.P1.setsize, file='~/Desktop/symmetry-sorting/csv/p1-nsets.csv', row.names=FALSE)

# Plot histograms
hist(df.P1.setsize$Set_size)



# stuff that was wrong:
# df.all <- rbind(df.P1, df.P3M1, df.P31M, df.P6, df.P6M)
# because the variables do not match...obv

# size = df.P1.size <- df.P1[,c(1,2,23)]
# set = df.P1.setsize$Set <- "P1"
# setsize = list(set,size)
# df.P1.setsize <- cbind(setsize)
# names(df.P1.setsize) <- c("Set","Participant", "Set_num", "Set_size")

# this one worked, in case I mess it up later:
# df.P3M1.setsize <- df.P3M1[,c(1,2,23)]
# names(df.P3M1.setsize) <- c("Participant", "Set_num", "Set_size")
# df.P3M1.setsize$Set <- "P3M1"

# df.P1.setsize <- rbindlist(l, use.names=TRUE, fill=FALSE) 

# df.P3M1.sets <- c("Set", "Participant", "Set_num", "Set_size")

# df.P31M.setsize <- df.P31M[,c(1,2,23)]
# names(df.P31M.setsize) <- c("Participant", "Set_num", "Set_size")

# WORKING CODE:

# For set sizes only, select columns 1, 2, and 23
# (,some#) means that we're not setting a row limit, with c(pickedcolumns) setting column values
# df.P1.setsize <- df.P1[,c(1,2,23)]
# names(df.P1.setsize) <- c("Participant", "Set_num", "Set_size")

# For set sizes only, but with a column for set id for the merge when hadn't merged total sets first
# df.P1.setsize <- df.P1[,c(1,2,23)]
# df.P1.size$Set <- "P1"
# df.P1.setsize <- df.P1.size[,c(4,1,2,3)]
# names(df.P1.setsize) <- c("Set", "Participant", "Set_num", "Set_size")

# to be used with:
# df.setsize.all <- merge (df.P1.setsize, df.P3M1.setsize, df.P31M.setsize, df.P6.setsize, df.P6M.setsize)
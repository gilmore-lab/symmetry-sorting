# Symmetry sorting fragment
# 2015-11-05 rogilmore wrote

require(XLConnect)
setwd('~/Desktop/Sorting Data Raw Files/')

# Read workbook
wb <- loadWorkbook('Raw_Sorting_Data_151102.xlsx')

# Change sheet for other datasets, ending row varies by group
df.P1 <- readWorksheet(wb, sheet='P1', startCol=1, startRow=1, endCol=which(LETTERS=="W"), endRow = 121)
str(df.P1)

# Change sheet for other datasets, ending row varies by group
df.P3M1 <- readWorksheet(wb, sheet='P3M1', startCol=1, startRow=1, endCol=which(LETTERS=="W"), endRow = 152)

# Change sheet for other datasets, ending row varies by group
df.P31M <- readWorksheet(wb, sheet='P31M', startCol=1, startRow=1, endCol=which(LETTERS=="W"), endRow = 148)

# For set sizes only, select columns 1, 2, and 23
df.P1.setsize <- df.P1[,c(1,2,23)]
names(df.P1.setsize) <- c("Participant", "Set_num", "Set_size")

# Merge data frames

# Export

write.csv(df.P1.setsize, file='~/Desktop/symmetry-sorting/csv/p1-nsets.csv', row.names=FALSE)

# Plot histograms
hist(df.P1.setsize$Set_size)
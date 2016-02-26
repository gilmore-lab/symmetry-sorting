# Make data frame for accessing wallpaper images on Databrary

df <- data.frame(group=rep(c('P1', 'P3M1', 'P31M', 'P6M', 'P6'), each=20), 
                 slot=rep(c(6509:6513), each=20), 
                 asset= c(seq(from=11868, length.out = 20), 
                          seq(from=11888, length.out = 20), 
                          seq(from=11908, length.out = 20), 
                          11928:11931, 11933:11948, # Skips 11932 for some reason
                          seq(from=11949, length.out=20))
)

write.csv(file='../csv/wallpapers-on-databrary.csv', df, row.names = FALSE)
rm(df)
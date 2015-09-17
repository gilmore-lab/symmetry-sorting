require(ggplot2)
require(dplyr)



jaccard.df <- read.csv("jaccard.csv")

theme.symm <- theme( axis.title.x = element_text(size=18),
                       axis.title.y = element_text(size=18),
                       strip.text = element_text(size=16),
                       axis.text = element_text(size=14),
                       legend.text = element_text(size=14),
                       legend.title = element_text(size=14)
)

qplot(x=Jaccard, 
      data=jaccard.df, 
      geom=c("histogram"), 
      facets = Group ~ ., fill=Group ) + 
  labs( x="Jaccard Index", y="N observations") +
  theme.symm +
  guides( fill=FALSE )
ggsave(filename="jaccard.hist.png")

jaccard.all.df <- read.csv("jaccard-all.csv")
jaccard.select <- with(jaccard.all.df, !(Exemplar.Row==Exemplar.Col))

qplot(data=jaccard.all.df[jaccard.select,],
      x=as.factor(Exemplar.Row), y=Jaccard,
      facets = Group ~ .,
      fill=Group, 
      geom="boxplot")

n.sets.df <- read.csv("number-of-sets.csv")
with( n.sets.df, Partcipant <- Participant.. )

qplot( data=n.sets.df, x=N.Sets, geom="density", color=Group ) + 
  labs(x="Number of Sets", y="Density") +
  theme.symm

ggsave(filename="n-sets-density.png")

qplot(data=n.sets.df, x=N.Sets, geom=c("dotplot"), facets=Group ~ ., dotsize=.7, fill=Group ) +
  labs( x="Number of Sets", y="") +
  theme.symm +
  theme( axis.text.y = element_blank() ) +
  scale_y_continuous(breaks=NULL) +
  guides( fill=FALSE )
  
ggsave(filename="n-sets-dotplot.png")

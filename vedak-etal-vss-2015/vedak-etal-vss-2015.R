# This document depicts a series of visualizations and analyses related to the 
# Vedak et al. (2015) presentation at the Vision Sciences Society 2015 meeting.
# 
# Vedak, S.C, Gilmore, R.O., Kohler, P.J., Liu, Y., & Norcia, A.M. (2015, May). 
# The salience of lower-order features in highly similar wallpaper groups. 
# Poster presented at the Vision Sciences Society meeting, St. Pete Beach, FL.
# 
# Gilmore, R.O., & Norcia, A.M. (2014). The Salience of Lower-Order, Localized 
# Features in Highly Self-Similar Wallpaper Groups. Databrary. Retrieved 
# May 18, 2015 from http://databrary.org/volume/77.

## Set-up

require(ggplot2)
require(dplyr)

## Jaccard indices across exemplars, participants
jaccard.df <- read.csv("jaccard.csv")
str(jaccard.df)

### Histogram
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


## Jaccard indices by exemplar

jaccard.all.df <- read.csv("jaccard-all.csv")
# this is similar to jaccard.csv, but includes a,b and b,a scores for each
# exemplar pair. Of course j(a,b)=j(b,a), but we need both scores to show 
# exemplar-by-exemplar patterns.

# Select a,b and b,a but not a,a pairs
jaccard.select <- with(jaccard.all.df, !(Exemplar.Row==Exemplar.Col))

### Boxplot

qplot(data=jaccard.all.df[jaccard.select,],
      x=as.factor(Exemplar.Row), y=Jaccard,
      facets = Group ~ .,
      fill=Group, 
      geom="boxplot")

### Means, Medians, SE by exemplar

jaccard.trim.df <- jaccard.all.df[jaccard.select,]
jaccard.trim.summ <- jaccard.trim.df %>%
  group_by(Group, Exemplar.Row) %>%
  summarize( Jaccard.mean=mean(Jaccard),
             Jaccard.sem=mean(Jaccard)/sqrt(n()),
             Jaccard.med=median(Jaccard))

jaccard.trim.best <- jaccard.trim.summ %>%
  group_by( Group ) %>%
  summarize(Jaccard.max.mean=max(Jaccard.mean),
            Jaccard.max.med=max(Jaccard.med),
            Jaccard.min.mean=min(Jaccard.mean),
            Jaccard.min.med=min(Jaccard.med),
            Jaccard.min.sem=min(Jaccard.sem))

jaccard.stats <- merge(jaccard.trim.summ, jaccard.trim.best, by.x="Group", by.y="Group")

jaccard.stats <- jaccard.stats %>%
  mutate( Max.mean = (Jaccard.mean==Jaccard.max.mean), 
          Min.mean = (Jaccard.mean==Jaccard.min.mean),
          Max.med = (Jaccard.med==Jaccard.max.med),
          Min.sem = (Jaccard.sem==Jaccard.min.sem)
)

#### Max mean and max median

jaccard.stats %>%
  filter( Max.mean, Max.med ) %>%
  select( Group, Exemplar.Row, Jaccard.mean, Jaccard.med )


#### Max median and min sem

jaccard.stats %>%
  filter( Max.med, Min.sem ) %>%
  select( Group, Exemplar.Row, Jaccard.mean, Jaccard.med )

#### Max mean and min sem

jaccard.stats %>%
  filter( Max.med, Min.sem ) %>%
  select( Group, Exemplar.Row, Jaccard.mean, Jaccard.med )

#### Max mean only

jaccard.stats %>%
  filter( Max.mean ) %>%
  select( Group, Exemplar.Row, Jaccard.mean, Jaccard.med )

#### Max med, but look at low sem

jaccard.stats %>%
  filter( Max.med ) %>%
  select( Group, Exemplar.Row, Jaccard.mean, Jaccard.med, Jaccard.sem ) %>%
  arrange( Group, Jaccard.sem )


### Linear mixed effects model on Jaccard

Fixed effect of group, random intercept for Group:Exemplar combination.


require(lme4)
jaccard.lme <- lmer( data=jaccard.trim.df, Jaccard ~ Group + (1|Exemplar.Row:Group))
summary(jaccard.lme)
jaccard.ci <- confint(jaccard.lme)
jaccard.reduced.lme <- lmer( data=jaccard.trim.df, Jaccard ~ (1|Exemplar.Row:Group))
anova( jaccard.lme, jaccard.reduced.lme )

# Full model has better fit $\chi^{2}(df=4)=93.431, p<2.2e-16$

#### Plot of effects CI

# rows 1 and 2 have values we don't care about
Jacc.vals <- c( jaccard.ci[3:7,1], jaccard.ci[3:7,2] )
J.offset <-c(0, rep( jaccard.ci[3,1],4), 0, rep(jaccard.ci[3,2],4) )
Jacc.fitted <- Jacc.vals + J.offset
Group <- rep( c("P1", "P31M", "P3M1", "P6", "P6M"), 2)
LowHigh <- rep(c("Low","High"), each=5)
jaccard.ci.df <- data.frame(Group, Jacc.fitted, LowHigh, row.names=NULL)

qplot( data=jaccard.ci.df, 
       x=Group, 
       y=Jacc.fitted, 
       color=Group, 
       geom="line", 
       group=Group) +
  labs(x="Group", 
       y="95% CI for Mean Jaccard") + 
  theme.symm + guides(color=FALSE)


P6<P6M, P3M1<P1, P1=P31M=P6M

## Number of sets

n.sets.df <- read.csv("number-of-sets.csv")
str(n.sets.df)

### Dotplot

qplot(data=n.sets.df, x=Nsets, geom=c("dotplot"), facets=Group ~ ., dotsize=.7, fill=Group ) +
  labs( x="Number of Sets", y="") +
  theme.symm +
  theme( axis.text.y = element_blank() ) +
  scale_y_continuous(breaks=NULL) +
  guides( fill=FALSE )

### Linear mixed-effects model

Fixed effect of Group, random effect for Participant.

n.sets.lme <- lmer( data=n.sets.df, Nsets ~ Group + (1|ParticipantN))
summary(n.sets.lme)

# drop Group
n.sets.reduced.lme <- lmer( data=n.sets.df, Nsets ~ (1|ParticipantN) )
anova( n.sets.lme, n.sets.reduced.lme )

# Full model better fitting $\chi^{2}(df=4)=9.7039, p=.04572$. So, there are differences in the number of sets. P1 smallest, P6 largest.
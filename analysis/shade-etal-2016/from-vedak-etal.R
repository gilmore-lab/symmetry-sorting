### Means, Medians, SE by exemplar
```{r}
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
```

#### Max mean and max median
```{r}
jaccard.stats %>%
  filter( Max.mean, Max.med ) %>%
  select( Group, Exemplar.Row, Jaccard.mean, Jaccard.med )
```

#### Max median and min sem
```{r}
jaccard.stats %>%
  filter( Max.med, Min.sem ) %>%
  select( Group, Exemplar.Row, Jaccard.mean, Jaccard.med )
```

#### Max mean and min sem
```{r}
jaccard.stats %>%
  filter( Max.med, Min.sem ) %>%
  select( Group, Exemplar.Row, Jaccard.mean, Jaccard.med )
```

#### Max mean only
```{r}
jaccard.stats %>%
  filter( Max.mean ) %>%
  select( Group, Exemplar.Row, Jaccard.mean, Jaccard.med )
```

#### Max med, but look at low sem
```{r}
jaccard.stats %>%
  filter( Max.med ) %>%
  select( Group, Exemplar.Row, Jaccard.mean, Jaccard.med, Jaccard.sem ) %>%
  arrange( Group, Jaccard.sem )
```

### Linear mixed effects model on Jaccard

Fixed effect of group, random intercept for Group:Exemplar combination.

```{r}
jaccard.lme <- lmer( data=jaccard.trim.df, Jaccard ~ Group + (1|Exemplar.Row:Group))
summary(jaccard.lme)
jaccard.ci <- confint(jaccard.lme)
jaccard.reduced.lme <- lmer( data=jaccard.trim.df, Jaccard ~ (1|Exemplar.Row:Group))
anova( jaccard.lme, jaccard.reduced.lme )

# Or, for traditionalists
anova(jaccard.lme)
```

Full model has better fit $\chi^{2}(df=4)=93.431, p<2.2e-16$
  
  #### Plot of effects CI
  
  ```{r plot-ci-mean-jaccard}
# rows 1 and 2 have values we don't care about
Jacc.vals <- c( jaccard.ci[3:7,1], jaccard.ci[3:7,2] )
J.offset <-c(0, rep( jaccard.ci[3,1],4), 0, rep(jaccard.ci[3,2],4) )
Jacc.fitted <- Jacc.vals + J.offset
Group <- rep( c("P1", "P31M", "P3M1", "P6", "P6M"), 2)
LowHigh <- rep(c("Low","High"), each=5)
jaccard.ci.df <- data.frame(Group, Jacc.fitted, LowHigh, row.names=NULL)
qplot( data=jaccard.ci.df, x=Group, y=Jacc.fitted, color=Group, geom="line", group=Group) +
  labs(x="Group", y="95% CI for Mean Jaccard") + theme.symm + guides(color=FALSE)
```

## Number of sets

### Dotplot

```{r dotplot-Nsets}
qplot(data=n.sets.df, x=Nsets, geom=c("dotplot"), facets=Group ~ ., dotsize=.07, fill=Group ) +
  labs( x="Number of Sets", y="") +
  theme.symm +
  theme( axis.text.y = element_blank() ) +
  scale_y_continuous(breaks=NULL) +
  guides( fill=FALSE )
```

### Linear mixed-effects model

Fixed effect of Group, random effect for Participant.

```{r}
n.sets.lme <- lmer( data=n.sets.df, Nsets ~ Group + (1|Participant))
summary(n.sets.lme)

# drop Group
n.sets.reduced.lme <- lmer( data=n.sets.df, Nsets ~ (1|Participant) )
anova( n.sets.lme, n.sets.reduced.lme )

# Or, for traditionalists
anova(jaccard.lme)
```

Fuller model better fitting $\chi^{2}(df=4)=9.7039, p=.04572$. So, there are differences in the number of sets. P1 smallest, P6 largest.
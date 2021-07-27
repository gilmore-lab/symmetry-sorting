# README
Rick Gilmore  
`r Sys.time()`  

## Symmetry Sorting Project

Behavioral studies associated with the symmetry sorting project. 

Last updated 2016-03-05 14:26:12.

## Contents

- [analysis-planning.Rmd](analysis-planning.Rmd), ioslides presentation for meeting with AMN and AC. [HTML](https://rawgit.com/gilmore-lab/symmetry-sorting/master/analysis-planning.html)
- [imgs/](imgs), Image files produced in analysis.
- [notes/](notes), text/Markdown formatted project notes.
- [pubs/](pubs), publications associated with the project
- [analysis/](analysis/), R code and data
    - [analysis/data/](analysis/data/)
        - [analysis/data/xlsx/](analysis/data/xlsx/), Excel format spreadsheets used to record data
        - *.csv, comma-delimited text files used for analysis in R
    - *.R, R functions
- [vedak-etal-2015/](vedak-etal-2015), files from earlier VSS analysis and presentation.

## R Session Info


```r
sessionInfo()
```

```
## R version 3.2.3 (2015-12-10)
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
## Running under: OS X 10.10.5 (Yosemite)
## 
## locale:
## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## loaded via a namespace (and not attached):
##  [1] magrittr_1.5    formatR_1.2     tools_3.2.3     htmltools_0.2.6
##  [5] yaml_2.1.13     stringi_0.4-1   rmarkdown_0.9.5 knitr_1.12.3   
##  [9] stringr_1.0.0   digest_0.6.8    evaluate_0.8
```

## Sorting task description

The Gilmore Research lab at Penn State asked student volunteers to look at a number of different types of patterns and share how they organized them into groups as they saw fit. The 5 pattern groups used each consisted of 20 individual patterns tied together only by having a specific type of symmetry or combination of symmetries. The four primary symmetry types, each included by itself or in combination with one or more of the other types in these groups, include reflection, translation, rotation, and glide reflection. These represent the modifications an initial pattern underwent in order to create the final designs. 

A reflection is a copy of the initial pattern that is like its mirror image, and would return to the initial pattern if simply flipped over an axis. A translation is a copy that would return to the original image if simply slid in one direction to line up with it. A rotation is a copy that would return to the original image if moved while anchored to a specific rotational point. A glide reflection is a reflection over two, typically perpendicular, axes so that flipping the copy over either axis would make it a direct reflection of the initial image that would return to it if flipped over the other axis.

There are 17 [wallpaper groups](https://en.wikipedia.org/wiki/Wallpaper_group) that result from the combination of these symmetry types. The 5 wallpaper groups used in the present study were: P1, P3M1, P31M, P6, P6M.

Participants were shown one group at a time, and instructed to divide it into as many subgroups as they saw. Their explanations for the groupings they created will help us to understand some of the ways in which people perceive and distinguish between different types of symmetry.

# project-notes-symmetry-sorting

This is the project notes file for the symmetry sorting project. Notes are in reverse chronological order.

## 2016-03-14-17:19

- ROG conducted preliminary analysis of SSIM values on wallpaper groups. See [ssim-analyis.Rmd](../ssim-analysis.Rmd) or [HTML](https://rawgit.com/gilmore-lab/symmetry-sorting/master/ssim-analysis.html).
- ROG created separate file with Jaccard index analyses, [jaccard-analysis.Rmd](../jaccard-analysis.Rmd) or [HTML](https://rawgit.com/gilmore-lab/symmetry-sorting/master/jaccard-analysis.html)
- ROG also created multidimensional scaling analysis of SSIM values in [mds-analysis.Rmd](../md-analysis.Rmd) or [HTML](https://rawgit.com/gilmore-lab/symmetry-sorting/master/mds-analysis.html)

## 2016-03-14-16:02

- Rick Gilmore and Michelle Shade met.
- Wrote [ssim.R](analysis/ssim.R) function to compute structural similarity measure for two image matrices.
- Discussed plan for reading [Dong et al.](http://doi.org/10.1145/2578726.2578762) and [Yamins et al](http://doi.org/10.1038/nn.4244) papers for next Monday 3/21.
- ROG will work on computing SSIM values for all stimulus pairs in preparation for cluster analysis.
- ROG will investigate multidimensional scaling options.

## 2016-03-11-1130

- Skype conference with Tony Norcia, Alasdair Cooke, Michelle Shade, and Rick Gilmore. Presented [this report](https://rawgit.com/gilmore-lab/symmetry-sorting/master/analysis-planning.html)
- Sort plot of individual participants by the mean or median set size to show who is a lumper and who is a splitter.
- ROG will investigate [PSNR](https://en.wikipedia.org/wiki/Peak_signal-to-noise_ratio), [SSIM](https://en.wikipedia.org/wiki/Structural_similarity), and other image similarity measures. Goal is to compute these and compare them to behavioral/sorting data.
- Alasdair sent reference to paper by [Dong et al.](http://doi.org/10.1145/2578726.2578762) that compares various metrics. He will send other references.
- Agreed to explore conversation with Dan Yamins -- see [Yamins & DiCarlo 2016 ](http://doi.org/10.1038/nn.4244) -- about how convolutional network layers similiarity matrices compare to human performance. 
- Also investigate Kriegeskorte work on representational similarity matrices.
- ROG and Alasdair will talk separately to follow up.
- Special issue of "Symmetry in Vision" has 2016-08-31 submssion deadline. [Details](http://www.mdpi.com/journal/symmetry/special_issues/symmetry_vision).

## 2016-03-06

- rog added hclust-based hierarchical clustering plots to analysis-planning.Rmd.
- "list-fied" several functions (make.nsets.df, make.jaccard.df) for readability.

## 2016-03-05-14:21

- rog created new [analysis-planning.Rmd](../analysis-planning.Rmd) file in preparation for meeting with AMN and AC later this week.

## 2016-03-04-1740

- rog modified load.wp.R to write images from Databrary to img/ by default.
- Tested show-wallpapers.Rmd, but it hangs.

## 2016-03-02-12:34

- rog refactored project directory.

## 2016-02-08-15:00

- Rick and Michelle Shade met to discuss data analysis.
- Wrote two functions to compute jaccard indices over data for a single symmetry group.

## 2015-11-03-08:40
- Data from 20 participants were collected by ars17 and Michelle between 9/29/15 and 11/2/15.
- Total participants = 22
- 21 Female, 1 Male
- data file, Raw_Sorting_Data_151102.xlsx uploaded to git hub by ars17
- participant data found on google drive psubrainlab@gmail.com > My Drive > participants > symm-session-log

## 2015-09-22-09:40

- Run participant (ars17) 8001
- Enter data into excel file

## 2015-09-21-11:37

- ars17 copied the  excel file for the raw data to: https://github.com/gilmore-lab/symmetry-sorting/Raw_Sorting_Data_150915.xlsx

- This is the file includes previous data and will include all future data.

## 2015-09-17-09:12

- rogilmore created this project notes file and pushed it to GitHub.

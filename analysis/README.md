# README

This document describes the contents and format of the symmetry sorting study data.

## xlsx/

The sorting data were stored in a MS Excel (.xlsx) file. The file had separate tabs for each of the five wallpaper groups. Within each tab, there were as many rows as that participant sorted the $n=20$ exemplars into piles. The columns represented each of the wallpaper group exemplars. If a specific pile (row) contained that exemplar, the cell for that row and column (exemplar) contained a 1. Otherwise the cell contained a zero. 

### Variable definitions and formats

The column variables were as follows:

`Participant`:  A unique alphanumeric identifier for each participant.

`Set`:  A unique (across the dataset) integer for each pile created by a participant.

(20 columns with integer identifiers for each exemplar): The exemplar names involved a concatenation of the following `1` + `wallpaper-group-id` + `exemplar-id`, where wallpaper-group-id was one of `{01,14,15,16,17}` corresponding to `{P1, P3M1, P31M, P6, P6M}` and exemplar-id was one of `{001..020}`. So, a valid exemplar identifier for the 1st exemplar from P1 was `101000`.

`Set Size (# of exemplars)`: An integer summing the 1's in that pile's row yielding the size of that specific set.

### Conversion to CSVs

The `analysis/make.sorting.df.R` function handles much of the data conversion. 

- It calls `analysis/make.nsets` 
    - This function uses `analysis/make.symm.df.R` to take these spreadsheets as input and generates CSV files under the `analysis/data/` directory with the sorting data as outputs. The output files have the format `{P1,P31M,P3M1,P6,P6M}-sorting.csv`.
    - The function also saves a CSV called `nsets.csv` which exports by-participant, by-pile, the set size(s) for each wallpaper group.
- It also calls `analysis/make.jaccard.df` twice to generate data files that report the Jaccard index for each exemplar pair within a wallpaper group. One of the files includes both permutatations of a pair (e.g., exemplars 001-020 and 020-001), called `jaccard-all.csv`; the other file, `jaccard.csv` drops the duplicates. 

## data/

### `{P1, P31M, P3M1, P6, P6M}-sorting.csv` files

These files have the following column variables:

Participant,Set,X115001,X115002,X115003,X115004,X115005,X115006,X115007,X115008,X115009,X115010,X115011,X115012,X115013,X115014,X115015,X115016,X115017,X115018,X115019,X115020,Set_size,Group. 

They are similar to the raw .xlsx files with the addition of the `Group` variable to indicate which wallpaper group the data refer to.

### `{jaccard,jaccard-all}.csv` files

These files have the following column variables:

`Exemplar.Row`: The index (1..20) for the first exemplar member of a pair.

`Exemplar.Col`: The index (1..20) for the second exemplar member of a pair.

`Jaccard`: The calculated Jaccard index for this pair of exemplars.

`Group` : The wallpaper group from which the exemplar pair was drawn.

The `README-jaccard-all.csv` and `README-jaccard.csv` contain CSV files with column short-name and long-names.

Note that `jaccard-no-duplicates.csv` retains the full exemplar naming convention described above, e.g., `101001` represents the first exemplar in the P1 group.

### `wallpapers-on-databrary.csv` file

This file provides information useful for finding and accessing the wallpaper group exemplar images from Databrary using the Databrary API.

The file has the following column variables:

`group`: Wallpaper group identifier.

`slot`: Integer representing the Databrary-unique "folder" or "session" for that wallpaper group's images.

`asset`: Integer representing the Databrary-unique identifier for a specific image.

`name`: The 6 digit, e.g., `101001` identifier for a specific wallpaper exemplar.

`url`: The URL that should retrieve the specific wallpaper exemplar.

`img_index`: An integer (1..20) representing the exemplar within a wallpaper group.

Note that `README-wallpapers-on-databrary.csv` is a CSV file with the column names and definitions.

### `nsets.csv` file

This file contains information about the sizes of various piles or sets participants created.

The file's column variables are as follows:

`Participant`: Unique identifier for the participant

`Set`: Unique identifer for this participant's set/pile

`Nsets`: Number of exemplars included in this set/pile.

`Group`: Wallpaper group

Note that `README-nsets.csv` is a CSV file with the column names and definitions.

### `xlxs/` directory

### `permutation_analysis` directory


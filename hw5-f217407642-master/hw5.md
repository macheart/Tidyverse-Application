MA \[46\]15 Homework 5
================
**`[==[`** Your Name **`]==]`**

Question 1
----------

In this work I'll analyze the titles of papers presented at the NIPS conference from 1987 to 2017. The data in file `nips-titles.csv`, loaded into table `papers`, contains only two columns, `year` and `title` from the [original Kaggle dataset](https://www.kaggle.com/benhamner/nips-papers). As an initial check, I'm plotting the distribution of number of words in title for each year.

**`[==[`** Modify the `q1` chunk below to load needed libraries and load `nips-titles.csv` into dataset `papers`. Check that `papers` has no problems. Now create a new variable `word_count` with the number of words in each title and then make boxplots of number of words per title for each year. Write a short assessment about the variability of title sizes over the years. **`]==]`**

``` r
library(tibble)
library(tidyr)
```

Question 2
----------

**`[==[`** Modify chunk `q2` below to "cross" each title in `papers` with each keyword in `keywords` and then check if each title contains each keyword. Before checking, however, convert the words in the title to lower case since the keywords are all in lower case. Store the outcome of the check, `FALSE` if keyword is absent, `TRUE` if present in title, in a new variable called `keyword_in_title`. Then, for each year and keyword, count how many titles contain the keyword in the year; store in variable `n`. Finally, using `spread`, cross-tabulate these counts for the last ten years by indexing rows by year and columns by keyword. Your final table should look like this:

    ## # A tibble: 10 x 10
    ##     year bayesian  data  deep learning models networks neural optimization
    ##    <int>    <int> <int> <int>    <int>  <int>    <int>  <int>        <int>
    ##  1  2008       13    11     1       51     22       10      7            6
    ##  2  2009       20     9     4       61     24        6      7            7
    ##  3  2010       12    14     3       65     19       14      8            9
    ##  4  2011        9    15     3       79     25        9     11           10
    ##  5  2012       22    12    10       92     31       15     14           12
    ##  6  2013       20    18    13       77     33       18     17           17
    ##  7  2014       18    20    22       85     41       25     28           16
    ##  8  2015       16    16    21       78     36       33     22           31
    ##  9  2016       23    24    44      121     43       64     47           39
    ## 10  2017       20    35    64      180     38       69     64           29
    ## # ... with 1 more variable: stochastic <int>

**`]==]`**

``` r
keywords <- tibble(keyword = c("bayesian", "data", "deep", "models",
              "networks", "neural", "learning", "optimization", "stochastic"))
# example of crossing between two tables:
crossing(tibble(x = 1:3), tibble(y = letters[1:3]))
```

    ## # A tibble: 9 x 2
    ##       x y    
    ##   <int> <chr>
    ## 1     1 a    
    ## 2     1 b    
    ## 3     1 c    
    ## 4     2 a    
    ## 5     2 b    
    ## 6     2 c    
    ## 7     3 a    
    ## 8     3 b    
    ## 9     3 c

Question 3
----------

**`[==[`** It's hard to assess counts in a table, so, in a chunk labeled `q3`, make a line plot of the counts you computed in Question 2, one line per keyword (color each line by keyword). Comment on any specific patterns; for instance, what seems to be the most popular keyword? Any keywords declining or increasing in popularity? **`]==]`**

Question 4
----------

**`[==[`** The counts for some keyword can be increasing simply because the number of conference papers is increasing with the years. Thus, instead of plotting counts, make line plots of the **proportion** of papers in each year that had each keyword in their titles. To this end, in a `q4` chunk, first create a new dataset called `papers_year` with the counts of number of papers per year and then **join** this with the title-keyword crossed dataset in Question 2. Then compute a new variable called `prop` with the proportion of titles containing each keyword by year. Finally, create the plot. Do your conclusions change when compared to the plot in Question 3? Comment. **`]==]`**

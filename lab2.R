---
title: "MA [46]15: Lab activity 2"
author:
- name: "Prisma"
  affiliation: "Back Corner Team"
output: html_notebook
---


# Introduction

In this lab activity we are going to analyze the `babynames` dataset.

**`[==[`** After loading the `babynames` package below, read the help for the `babynames` dataset and provide a short sentence describing it. **`]==]`**

We start by loading packages, including the `babynames` package containing the data:

```{r init, warning = FALSE}
library(tidyverse)
install.packages("babynames")
library(babynames) # install it with `install.packages("babynames")`
babynames
```


# Summarizing and visualizing the data 

Here are the names that were most popular in the whole record for both boys and girls:

```{r jointrank}
# original:
babynames %>% group_by(sex, name) %>% summarize(total = sum(n)) %>%
  group_by(sex) %>% mutate(rank = min_rank(desc(total))) %>% arrange(rank, sex)


```

For comparison, here are the popular names since 1990, separately for boys and girls:

**`[==[`** Edit the commands below to produce two tables, one for boys and other for girls, with the most popular names since 1990, ordered by number of births. **`]==]`**

```{r jointrank}
babynames %>% filter(sex == 'F' & year > 1990) %>% group_by(sex, name) %>% summarize(total = sum(n)) %>% mutate(rank = min_rank(desc(total))) %>% arrange(rank)

babynames %>% filter(sex == 'M' & year > 1990) %>% group_by(sex, name) %>% summarize(total = sum(n)) %>% mutate(rank = min_rank(desc(total))) %>% arrange(rank)
```

The following `births.year` dataset summarizes the total number of births per sex across years:

```{r births-year}
births.year <- babynames %>% group_by(year, sex) %>% summarize(count = sum(n)) %>%
  spread(key = sex, value = count)
births.year
```

Here is a plot showing how the number of births varies yearly. The ratio of girls to boys is also plotted in color.

**`[==[`** Modify the command in `births-year-plot` to plot the total number of births per year and color the points using the proportion of girls to boys. **`]==]`**

```{r births-year-plot}
births.year <- births.year %>% mutate(total = M+F)
births.year %>% ggplot(mapping = aes(x = year, y = total, colour = F/M)) + geom_point()
```


**`[==[`**
Open a new Discussion section and summarize your findings in this short analysis. In particular:

  * Comment on possible changes to popular names in the last 20 years when compared to the most popular names in the whole record;
  
  * Comment on how the yearly number of births and ratio of girls to boys varies.
**`]==]`**

# The most popular names of all time according to this dataset is Mary and James for females and males, respectively. Though, their popularity changes through the years.  For example, Emily, Ashley, and Samantha are the most popular girl names in the 1990s and the name Mary is not. Michael Jacob and Matthew are the most popular male names in the 1990s and James is not. 


# The most interesting part of the last plot produced is that the female to male ration is highest between 1880-1920, where the ratio is between 1.6 and 2.0.
  

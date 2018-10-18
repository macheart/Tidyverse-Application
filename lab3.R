---
title: "MA [46]15: Lab Activity 3"
author: Prisma Lopez | Group: MA [46]15 BackCorner
output: github_document
---

# Introduction

Bike sharing systems are new generation of traditional bike rentals where
whole process from membership, rental and return back has become automatic.
Through these systems, user is able to easily rent a bike from a particular
position and return back at another position. Currently, there are about over
500 bike-sharing programs around the world which is composed of over 500
thousands bicycles. Today, there exists great interest in these systems due to
their important role in traffic, environmental and health issues.

We analyze the bike sharing dataset provided by Capital Bikeshare and
available as a [UCI ML repository](http://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset). 
The data span bike sharing activity in the Washington DC metro area for two years, 2011 and 2012. We start by loading the data:

```{r intro, message = FALSE}
library(tidyverse)
bike <- read_csv("data/bike-sharing.csv")
```

# Data analysis

```{r a1}
bike_fahr <- bike %>% mutate(temp_F = ((47*temp)-8) * (1.8 +32))
```



```{r a2}
ggplot(bike_fahr) + geom_point(aes(x=dteday,y=cnt,colour=weathersit))

```


```{r a3}
ggplot(bike_fahr) + geom_point(aes(x=dteday,y=cnt,colour=temp_F,shape=factor(workingday)))
```

# Discussion

# Description of column names and contents; dteday: the date bike was rented; holiday: wether the date is a holiday or not ; workingday: if day is any weekday or not and assigned a 1 or 0, respectively;weathersit: description of the weather on the rental day graded numerically between 1 to 4 inclusive; temp: normalized temperature in Celcius;  

# Bike rentals were the highest for any one month with a weathersit score equal to 1, representing great weather (no precipitation). 

# I notice that from 2011 to 2013, the number of bike rentals go up year to year and that within any single year, bike use soars in the warmer weather motnhs. January of each year has the lowest bike rentals for each year there is available data. January is a cold month with much snow precipitation, which may explain low bike rental use.

# You can more feasibly see that there is a better correlation or association between the number of bike rentals and the temperature (in rental use) than there is between rental count and if the rental date is a working day, a weekend, or a holiday. 

---
title: "MA [46]15: Lab activity 1"
author: "Prisma Lopez"
output: html_notebook
---

# Introduction

In this lab activity we do a preliminary analysis of global social and economic indices. We use the *Social Progress Index* (SPI) from 2017 and the *Gross Domestic Product* (GDP) per capita from 2018. We downloaded the [social](https://www.socialprogressindex.com/assets/downloads/2017-Results.xlsx.zip) and [economic](http://api.worldbank.org/v2/en/indicator/NY.GDP.PCAP.PP.CD?downloadformat=excel) index data and put them at the `data` folder. We can now load them, along with the `tidyverse` package: 

```{r init, warning = FALSE}
library(tidyverse)
spi <- readxl::read_xlsx("data/2017 Results.xlsx") %>%
  mutate(spi = `Social Progress Index`)

ief <- readxl::read_xls("data/index2018_data.xls") %>%
  mutate(score = as.numeric(`2018 Score`), # Index of Economic Freedom (IEF)
         gdp = as.numeric(`GDP per Capita (PPP)`),
         Region = factor(Region))
```

We can now join the two datasets using `Country`:

```{r join, message = FALSE}
(ief.spi <- left_join(select(spi, Country, spi),
                     select(ief, Country, Region, score, gdp)))
```


# Visualization

Our first visualization is SPI against GDP:

```{r spi-gdp, warning = FALSE}
ggplot(ief.spi) + 
  geom_point(mapping=aes(gdp, spi,color = Region)) +
  geom_smooth(mapping=aes(gdp, spi)) +
  labs(x = "2018 GDP per capita (PPP)", y = "2017 Social progress index") 
```

Our next visualization plots SPI against IEF:

```{r spi-ief, warning = FALSE}

#ggplot(ief.spi, aes(gdp, spi)) + geom_point() +
  #labs(x = "2018 Index of economic freedom", y = "2017 Social progress index")

ggplot(ief.spi) + 
  geom_point(mapping = aes(spi, score,color = Region)) +
  geom_smooth(mapping = aes(spi, score)) +
  labs(x = "2018 Index of economic freedom", y = "2017 Social progress index")

```
# Discussion 
From the graph, we can tell that the countries with the highest GDP are the European 
nations, and those with the lowest GDP are the sub-saharan African countries. 
The trend line, or in this case, the smoothened line, increases linearly as the GDP
per capita increases, indicating an increase in social progress index. Although, up to some point. There is a dip in the trend line once the GDP per capita reaches 50,000. Indicating that nations with a GDP past this point, do not have an increase in social progress index. Two Middle-Eastern / North-African countries (shown in blue) exemplify this. 

Interestingly, like the plot above, the same world regions: Europe and Subsaharan Africa, respectively, are at the opposite ends of the graph. European countries are grouped as having the highest economic freedom index and social progress index relative to the rest of the world regions. Show here,  

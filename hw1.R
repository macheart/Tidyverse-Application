---
title: "MA [46]15 Homework 1"
author: "Prisma Lopez"
output: html_document
---

In this homework I'm analyzing the `msleep` dataset from package `ggplot2`.
I start by loading the packages:

```{r init}
library(tidyverse)
msleep
```



## Question 1

```{r q1}
ggplot(msleep) + geom_point(aes(x = bodywt, y = brainwt,color=vore))+scale_x_log10() + scale_y_log10()

```


## Question 2


```{r q2}
# vertical boxplots
#ggplot(msleep, mapping = aes(x = vore, y = bodywt)) + geom_boxplot(outlier.colour="black",outlier.shape=8,outlier.size=2) + coord_trans(y = "log10") 
#ggplot(msleep, mapping = aes(x = vore, y = bodywt)) + geom_boxplot() + coord_trans(y = "log2")


##### horizontal boxplot
ggplot(msleep, mapping = aes(x = vore, y = log(bodywt) )) + geom_boxplot() + coord_flip()  


```


## Question 3

```{r q3}
#vignette("ggplot2-specs")

# original
ggplot(msleep) + geom_point(aes(x = conservation, y = sleep_total))
 
ggplot(data = msleep,aes(conservation)) + 
  geom_point(aes(x = conservation, y = sleep_total/24,colour = vore)) + 
  stat_summary( # Stat summary of data (mean,min,max):
    aes(x = conservation, y = sleep_total/24),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = mean,
    geom="crossbar",
    color = 'blue'
  ) + geom_jitter(aes(x=conservation,y=sleep_total/24,color = vore)) 



```



## Question 4

```{r q4}
q4 <- ggplot(data = msleep) + geom_bar(
  mapping = aes(x = conservation, fill = vore),
  show.legend = TRUE,
  width = 1
) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

q4 + coord_polar()
```



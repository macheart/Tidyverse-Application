MA \[46\]15 Homework 6
================
**`[==[`** Your Name **`]==]`**

Question 1
----------

**`[==[`**

If *T* ∼ *t*<sub>df</sub>, a *Student t* distribution with `df` degrees of freedom, write a function `t_alpha_2` that, given `df` and a significance level 0 &lt; `alpha` &lt; 1, returns a value *Q* &gt; 0 such that *P*(*T* ≤ −*Q*)=*P*(*T* ≥ *Q*)=`alpha`/2. Use `df = Inf` and `alpha = 0.05` as default values (Hint: `qt`). What is the meaning of `df = Inf`, that is, what is the distribution of *T*?

**`]==]`**

Question 2
----------

**`[==[`**

If we have *n* independent observations *X*<sub>1</sub>, …, *X*<sub>*n*</sub> ∼ *N*(*μ*, *σ*<sup>2</sup>) then a 100(1 − *α*)% confidence interval for *μ* is *m*<sub>*x*</sub> ± *t*<sub>*α*/2, *n* − 1</sub>*s*<sub>*x*</sub>/*n*<sup>1/2</sup>. Here, *m*<sub>*x*</sub> is the mean of all *X*<sub>*i*</sub>, *t*<sub>*α*/2, *n* − 1</sub> is the value computed by `t_alpha_2` with `alpha` and `df = n - 1`, and *s*<sub>*x*</sub> is the standard deviation of all *X*<sub>*i*</sub>. Write a function `t_data` that, given a vector `x` and `alpha`, returns a tibble with entries: `y` for the mean of `x`, `ymin` for the lower endpoint of the confidence interval, and `ymax` for the upper endpoint of the confidence interval. Now using the `mpg` dataset (see Lecture 4), plot jittered points for `hwy` mileage for each level of `drv`, and use `t_data` as an input to `stat_summary` to overlay red-colored crossbars for each level of `drv`.

**`]==]`**

Question 3
----------

**`[==[`**

Write a function `z_score` that takes a vector `x`, a mean `mu` and standard deviation `sigma` (both default to `NA`) and returns a vector with z-scores for each entry *x*<sub>*i*</sub> in the vector: *z*<sub>*i*</sub> = (*x*<sub>*i*</sub> − *μ*)/*σ*. If `mu` is missing, estimate it with *m*<sub>*x*</sub>; if `sigma` is missing, estimate it with the sample standard deviation of `x`. Now make a plot similar to the one in Question 2: using the `mpg` dataset, for each level of `drv` compute z-scores for `hwy`, plot them jittered, and then add red-colored crossbars using `t_data`. Note that `z_score` is a *window* function, that is, similar to `rank` and `cumsum`, and so you need to `group_by` the data before using it!

**`]==]`**

MA \[46\]15 Homework 4
================
**`[==[`** Your Name **`]==]`**

Question 1
----------

My work is to perform a preliminary analysis of consumer behavior using sales data on **Black Friday**. I downloaded the [BlackFriday](https://www.kaggle.com/mehdidag/black-friday) dataset from Kaggle, and loaded it into a new dataset called `blackfriday`.

**`[==[`** Download the `BlackFriday.csv` file from the web page linked above and put it in the `data` folder. NOTE: since this is a large file (~25Mb), do **not** add this file to your GitHub repository! Now modify the `q1` chunk below to create a new dataset called `blackfriday`. Check that there are no errors when importing data. Check variables \``Age`, `Marital_Status`, and `Purchase` for unusual values. **`]==]`**

``` r
library(tidyverse)
```

Question 2
----------

**`[==[`** In a `q2` chunk, unite variables `Age` and `Marital_Status` into a new `agems` variable, then make a boxplot of price of purchases by `agems`. Is there any apparent difference of purchase prices among different age groups? Is there any age group where marital status seems to have an effect on purchase prices? **`]==]`**

Question 3
----------

**`[==[`** Columns `Product_Category_1`, `Product_Category_2` and `Product_Category_3` specify up to 3 categories for the each product. Let us first check that the category specification is consistent: check that (i) there are no missing values for `Product_Category_1`, and (ii) if `Product_Category_2` is missing, then so is `Product_Category_3`. Use a chunk labeled `q3` for the check. Next, gather these three columns in two columns: `Prod_Category`, with the category order (`Product_Category_1`, `Product_Category_2`, or `Product_Category_3`) and `Prod_Category_ID`, with the category ID. Remove any observations with missing values in `Prod_Category_ID`. Store this new dataset in `blackfriday_cat`. **`]==]`**

Question 4
----------

**`[==[`** Create a new `q4` chunk to make boxplots of purchase price by product category. Reorder the categories by increasing purchase price and color the boxplors by the number of purchases. Any apparent patterns between purchase price, counts, and product categories? Explain why this operation is easier after processing product category in Question 3. **`]==]`**

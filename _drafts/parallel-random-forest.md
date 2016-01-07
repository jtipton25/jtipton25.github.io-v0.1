---
title: "parallelRandomForest"
author: "John Tipton"
date: "May 17, 2015"
output: html_document
---

# some example code to parallelize the building of random forests


## load the required libraries

```r
library(randomForest)
library(parallel)
library(snowfall)
library(rlecuyer)
```
## load the data and set up the model

```r
## load the data
theData <- iris

# set the formula
theFormula <- as.formula("Species ~ . ")

# total number of trees in the random forest
totalTrees <- 500
```
## Setup the parallel functions

## Fit the random forest

```r
# build the random forests
allForests <- sfClusterApplyLB(1:threads, parallelRF)

# Close the cluster
sfStop()
```
## Process forest output

```r
# merge all the forests into one object
myRandomForest <- allForests[[1]]
for (i in 2:threads) {
    myRandomForest <- combine(myRandomForest, allForests[[i]])
}

# convince oursleves we have them all combined
myRandomForest$ntree
```

```
## [1] 496
```

```r
# what is important
myRandomForest$importance
```

```
##              MeanDecreaseGini
## Sepal.Length        10.025435
## Sepal.Width          2.556842
## Petal.Length        44.540894
## Petal.Width         42.111466
```

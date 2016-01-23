---
title: "Normal Random Variable Simulation Timings"
author: "John Tipton"
date: "August 15, 2015"
layout: post
---
 
 Load libraries and functions
 

```r
library(myFunctions)
```

```
## Warning in .doLoadActions(where, attach): trying to execute load actions
## without 'methods' package
```

```
## 
## Attaching package: 'myFunctions'
```

```
## The following objects are masked from 'package:base':
## 
##     colSums, rowMeans, rowSums
```

```r
library(microbenchmark)
library(mvtnorm)
library(mvnfast)
source('~/functions/rMVN.R')
library(knitr)
opts_chunk$set(cache=TRUE)
```

## Simulate data


```r
mu <- rnorm(200)
D <- as.matrix(dist(1:200))
Sig <- exp(-D)
y <- rnorm(200)
```

## Run bencmarks on simulating a multivariate normal


```r
print(microbenchmark(mvrnormArma(100, mu, Sig),
               rmvnorm(100, mu, Sig),
               rmvn(100, mu, Sig),
               times = 100L))
```

```
## Unit: milliseconds
##                       expr       min        lq      mean    median
##  mvrnormArma(100, mu, Sig)  7.517604  7.697766  8.123462  7.891844
##      rmvnorm(100, mu, Sig) 43.952678 45.826324 51.335066 47.220533
##         rmvn(100, mu, Sig)  4.928578  5.157637  6.312240  5.458924
##         uq       max neval
##   8.327086  10.88990   100
##  49.320606 117.54393   100
##   5.926290  68.69926   100
```

```r
layout(matrix(1:3, 1, 3))
hist(mvrnormArma(100, mu, Sig))
hist(rmvnorm(100, mu, Sig))
hist(rmvn(100, mu, Sig))
```

![plot of chunk unnamed-chunk-3](/figure/Rposts/2015-10-01-normal-benchmarking/unnamed-chunk-3-1.png)

## Run bencmarks on simulating a full conditional draw


```r
print(microbenchmark(rMVN(chol(Sig), mu),
               rMVNArma(Sig, mu),
               times = 100L))
```

```
## Unit: milliseconds
##                 expr      min       lq     mean   median       uq      max
##  rMVN(chol(Sig), mu) 1.898108 1.903474 2.024149 1.907876 1.922207 4.116775
##    rMVNArma(Sig, mu) 1.907692 1.914327 2.034609 1.991254 2.074717 2.518760
##  neval
##    100
##    100
```

```r
layout(matrix(1:2, 1, 2))
hist(rMVN(chol(Sig), mu))
hist(rMVNArma(Sig, mu))
```

![plot of chunk unnamed-chunk-4](/figure/Rposts/2015-10-01-normal-benchmarking/unnamed-chunk-4-1.png)

## Compare mvnfast random normal to rMVN random normal


```r
microbenchmark(rMVNArma(Sig, mu),
               rmvn(1, solve(Sig) %*% mu, solve(Sig)))
```

```
## Unit: milliseconds
##                                    expr      min        lq      mean
##                       rMVNArma(Sig, mu)  1.90987  1.916362  1.936648
##  rmvn(1, solve(Sig) %*% mu, solve(Sig)) 43.67131 44.516671 46.285954
##    median        uq        max neval
##   1.93646  1.947418   1.999725   100
##  45.13733 45.797646 103.241224   100
```

## Run benchmarks on density evaluation


```r
microbenchmark(dMVNorm(y, mu, Sig),
               dmvn(y, mu, Sig, log = TRUE)) 
```

```
## Unit: milliseconds
##                          expr      min       lq     mean   median       uq
##           dMVNorm(y, mu, Sig) 3.452547 3.454811 3.482762 3.458741 3.466584
##  dmvn(y, mu, Sig, log = TRUE) 1.869927 1.874071 1.897030 1.877027 1.883651
##       max neval
##  4.129725   100
##  2.407329   100
```

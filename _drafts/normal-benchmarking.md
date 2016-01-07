# random normal timings
 
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
## 
## The following objects are masked from 'package:base':
## 
##     colSums, rowMeans, rowSums
```

```r
library(microbenchmark)
```

```
## Error in library(microbenchmark): there is no package called 'microbenchmark'
```

```r
library(mvtnorm)
library(mvnfast)
```

```
## Error in library(mvnfast): there is no package called 'mvnfast'
```

```r
source('~/functions/rMVN.R')
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
## Error in print(microbenchmark(mvrnormArma(100, mu, Sig), rmvnorm(100, : could not find function "microbenchmark"
```

```r
layout(matrix(1:3, 1, 3))
hist(mvrnormArma(100, mu, Sig))
hist(rmvnorm(100, mu, Sig))
hist(rmvn(100, mu, Sig))
```

```
## Error in hist(rmvn(100, mu, Sig)): could not find function "rmvn"
```

![plot of chunk unnamed-chunk-3](/figure/./normal-benchmarking/unnamed-chunk-3-1.png) 

## Run bencmarks on simulating a full conditional draw


```r
print(microbenchmark(rMVN(chol(Sig), mu),
               rMVNArma(Sig, mu),
               times = 100L))
```

```
## Error in print(microbenchmark(rMVN(chol(Sig), mu), rMVNArma(Sig, mu), : could not find function "microbenchmark"
```

```r
layout(matrix(1:2, 1, 2))
hist(rMVN(chol(Sig), mu))
hist(rMVNArma(Sig, mu))
```

![plot of chunk unnamed-chunk-4](/figure/./normal-benchmarking/unnamed-chunk-4-1.png) 

## Compare mvnfast random normal to rMVN random normal


```r
microbenchmark(rMVNArma(Sig, mu),
               rmvn(1, solve(Sig) %*% mu, solve(Sig)))
```

```
## Error in eval(expr, envir, enclos): could not find function "microbenchmark"
```

## Run benchmarks on density evaluation


```r
microbenchmark(dMVNorm(y, mu, Sig),
               dmvn(y, mu, Sig, log = TRUE)) 
```

```
## Error in eval(expr, envir, enclos): could not find function "microbenchmark"
```

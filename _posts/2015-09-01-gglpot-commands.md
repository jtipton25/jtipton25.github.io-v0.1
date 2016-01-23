---
title: "GGPlot examples"
author: "John Tipton"
date: "September 1, 2015"
layout: post
---
# ggplot examples


```r
library(ggplot2)
```

```
## Warning: package 'ggplot2' was built under R version 3.2.3
```

```r
movies=movies[sample(nrow(movies), 1000), ]
```

```
## Error in eval(expr, envir, enclos): object 'movies' not found
```

```r
str(movies)
```

```
## Error in str(movies): object 'movies' not found
```

```r
ggplot(movies, aes(x=rating)) + geom_density() + facet_grid(Action ~ Comedy)
```

```
## Error in ggplot(movies, aes(x = rating)): object 'movies' not found
```

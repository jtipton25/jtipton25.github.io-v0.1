---
title: "Helpful Knitr Options"
author: "John Tipton"
date: "August 15, 2015"
layout: post
---

# Knitr commands 
* To knit an R markdown document using the command line 

```bash
Rscript -e "library(knitr); knit('kernelConvolution.Rmd')"
```

* To use accents in Rmd

include in the header

```
header-includes:
  - \usepackage[latin9]{inputenc}
```

Then on a mac insert the character of interest

```
Acute          ó Ó     Option+E, O 

Circumflex     ô Ô     Option+I, O

Grave          ò Ò     Option+`, O	

Tilde          õ Õ     Option+N, O     Only works with "n,N,o,O,a,A"

Umlaut         ö Ö     Option+U, O
```
	


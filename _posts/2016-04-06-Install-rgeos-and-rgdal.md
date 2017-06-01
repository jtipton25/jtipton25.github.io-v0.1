---
title: "Installing Rgeos and Rgdal packages"
author: "John Tipton"
date: "January 19, 2016"
layout: post
---



## Package rgdal

The usual `install.packages(“rgdal”)` won’t work.

### Download the GDAL OS X install from kyngchaos
Go to [www.kyngchaos.com/software/frameworks](http://www.kyngchaos.com/software/frameworks) and install the `GDAL Complete` dmg file and install using OS X installion.

In the Terminal, modify the `.bash_profile` file by typing


```bash
emacs .bash_profile
```

to open the file and modify the `PATH` environment by adding the line


```bash
export PATH=/Library/Frameworks/GDAL.framework/Programs:$PATH
```

Save and close the `emacs` file

### Download and install proj4 from source
- [http://proj4.org/download.html]
- Download source code version - as of writing this the current version is `proj-4.9.3.tar.gz`
- Fire up the `Terminal`


```bash
cd ~/Downloads/
tar -xzvf proj-4.9.3.tar.gz
cd proj-4.9.3
./configure
make && make test
sudo make install
```

This should install to`/usr/local/lib` by default

3. Download and install `rgdal` from source
- [http://cran.r-project.org/web/packages/rgdal/index.html](http://cran.r-project.org/web/packages/rgdal/index.html) - as of writing this the current update is `rgdal_1.1-8.tar.gz`
- Fire up the `Terminal`


```bash
cd ~/Downloads/
sudo R CMD INSTALL –configure-args='–with-proj-include=/usr/local/lib' rgdal_1.1-8.tar.gz
```

Test if the package installed correctly by opening `R` and typing


```r
library(rgdal)
```


## Package rgeos
3. Download and install `rgeos` from source
- [https://cran.r-project.org/web/packages/rgeos/index.html](https://cran.r-project.org/web/packages/rgeos/index.html) - as of writing this the current update is `rgeos_0.3-19.tar.gz`
- Fire up the `Terminal`


```bash
cd ~/Downloads/

sudo R CMD INSTALL rgeos_0.3-19.tar.gz --configure-args="--with-geos-config=/Library/Frameworks/GEOS.framework/unix/bin/geos-config"
```

Test if the package installed correctly by opening `R` and typing


```r
library(rgeos)
```


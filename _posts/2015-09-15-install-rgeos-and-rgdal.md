---
title: "Installing Rgeos and Rgdal packages"
author: "John Tipton"
date: "September 15, 2015"
layout: post
---



## Package rgdal

The usual `install.packages(“rgdal”)` won’t work.

### Download the GDAL OS X install from kyngchaos
Go to http://www.kyngchaos.com/software/frameworks and install the file
In the Terminal, modify the `.bash_profile` file by typing


```bash
emacs .bash_profile
```

to open the file and modify the PATH environment by adding the line


```bash
export PATH=”/Library/Frameworks/GDAL.framework/Programs:$PATH”
```

Save and close the emacs file

### Download and install proj4 from source
- http://trac.osgeo.org/proj/wiki/WikiStart#Download
- Download source code version proj-4.8.0.tar.gz (or more recent update)
- Fire up the Terminal


```bash
cd ~/Downloads/
tar -xzvf proj-4.8.0.tar.gz
cd proj-4.8.0
./configure
make && make test
sudo make install
```

[ should install to /usr/local/lib by default]

3. Download and install rgdal from source
- http://cran.r-project.org/web/packages/rgdal/index.html <- most recent update
- Fire up the Terminal


```bash
cd ~/Downloads/
sudo R CMD INSTALL –configure-args=’–with-proj-include=/usr/local/lib’ rgdal_0.8-16.tar.gz
```


```r
library(rgdal)
```

```
## Loading required package: methods
```

```
## Loading required package: sp
```

```
## rgdal: version: 1.0-4, (SVN revision 548)
##  Geospatial Data Abstraction Library extensions to R successfully loaded
##  Loaded GDAL runtime: GDAL 1.11.2, released 2015/02/10
##  Path to GDAL shared files: /Users/Tips/Rlibs/rgdal/gdal
##  Loaded PROJ.4 runtime: Rel. 4.9.1, 04 March 2015, [PJ_VERSION: 491]
##  Path to PROJ.4 shared files: /Users/Tips/Rlibs/rgdal/proj
##  Linking to sp version: 1.1-1
```



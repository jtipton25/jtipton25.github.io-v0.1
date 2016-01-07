---
title: "Updating R without needing to re-install packages"
author: "John Tipton"
date: "October 15, 2015"
layout: post
---

One annoyance when using R is the need to re-install packages with each new installation of R. This is a method to avoid this (at least on unix-like systems), but make sure you use the R command

```r
update.packages()
```
regularly. The first step is to make a directory where you plan to install the libraries. I choose the home directory `~/` and name my directory `Rlibs`. To do this, open the terminal and type

```bash
mkdir ~/Rlibs
```
Then, go to your home directory (by typing `cd`) and create a new file (`.Renviron`) that R will use to set environment variables using emacs by typing

```bash
emacs .Renviron
```
opening the file using the `emacs` text editor. Then type

```bash
R_LIBS=~/Rlibs
```
to tell R that packages should be installed and loaded from the `~/Rlibs` directory. To save the `.Renviron` file, use the emacs command for save

```bash
ctrl-x ctrl-s
```
where, while holding the `ctrl` key you type `x` then `s`. Then exit emacs using

```bash
ctrl-x ctrl-c
```
If at anytime you are unsure, just hit `esc` a few times to clear out the `emacs` buffer. Make sure to use `update.packages()` often in R to keep the libraries up to date.

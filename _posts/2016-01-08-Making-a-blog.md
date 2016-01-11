---
title: "Making a Github pages Blog with RStudio and Jekyll on a Mac"
author: "John Tipton"
date: "January 8, 2016"
layout: post
---
In this post, I will detail the steps needed to make a website using Rstudio and Jekyll. For this tutorial, we host our website on Github pages, although this method does build a site that you can host on your own. First, we assume that you have a github account. If not, signing up is free for a public account and is a good idea for anyone who actively develops code.

## Github Pages account


This tutorial is based on the github website https://help.github.com/articles/using-jekyll-with-pages/

## Installing Jekyll
### Installing Ruby
First, we have to make sure that Ruby language (version greater than `2.0.0`) is installed. To check, open the Terminal application and type

```bash
ruby --version
```
If Ruby is not installed, follow the directions on https://www.ruby-lang.org/en/downloads/

### Installing Bundler
Bundler is a package manager for Ruby. To install bundler, type in the Terminal

```bash
gem install bundler
```
### Installing Jekyll
First, change to your site's repository directory, mine is `~/jtipton25.github.io`

```bash
cd yourusername.github.io
```
Next, we need to create a file called `Gemfile` using a text editor. I use `emacs`, which is built into any *nix computer. To open the file `Gemfile` and create one if it doesn't already exist, open Terminal and type

```bash
emacs Gemfile
```
Then type into the emacs file 

```bash
source 'https://rubygems.org'
gem 'github-pages'
```
To close and save the file use the emacs command for save

```bash
ctrl-x ctrl-s
```
where, while holding the `ctrl` key you type `x` then `s`. Then exit emacs using

```bash
ctrl-x ctrl-c
```
If at anytime you are unsure, just hit `esc` a few times to clear out the `emacs` buffer. To complete the installation type into the Terminal

```bash
bundle install
```



## Seting up your blog
s## Configure `head.html` to add mathematical equations to the blog
If you have the desire to add $\latex$ style equations to your blog, add the following to the file `head.html` in the `_includes/` folder between the lines `<head>` and `<\head>`.

```bash
  <script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
  <script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    TeX: {
      equationNumbers: {
        autoNumber: "AMS"
      }
    },
    tex2jax: {
      inlineMath: [ ['$','$'], ["\\(","\\)"] ],
      displayMath: [ ['$$','$$'] ],
      processEscapes: true
    }
  });
  </script>
```

# Make this display right
My entire `head.html` looks like

```r
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>{% if page.title %}{{ page.title }}{% else %}{{ site.title }}{% endif %}</title>
  <meta name="description" content="{% if page.excerpt %}{{ page.excerpt | strip_html | strip_newlines | truncate: 160 }}{% else %}{{ site.description }}{% endif %}">

  <link rel="stylesheet" href="{{ "/css/main.css" | prepend: site.baseurl }}">
  <link rel="stylesheet" href="{{ "/css/jekyll-github.css" }}">
  <link rel="canonical" href="{{ page.url | replace:'index.html','' | prepend: site.baseurl | prepend: site.url }}">
  <link rel="alternate" type="application/rss+xml" title="{{ site.title }}" href="{{ "/feed.xml" | prepend: site.baseurl | prepend: site.url }}" />
  <script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
  <script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    TeX: {
      equationNumbers: {
        autoNumber: "AMS"
      }
    },
    tex2jax: {
      inlineMath: [ ['$','$'], ["\\(","\\)"] ],
      displayMath: [ ['$$','$$'] ],
      processEscapes: true 
    }
  });
  </script>
</head>
```

## Configure your `_config.yaml` file.
Use a text editor to edit your `_config.yaml` file. Mine looks like


```bash
# Site settings
title: The posterior
email: jtipton25@gmail.com
description: > # this means to ignore newlines until "baseurl:"
  Here I will post commonly used code examples and statistical problems 
  
baseurl: "" # the subpath of your site, e.g. /blog/
url: "http://jtipton25.github.io" # the base hostname & protocol for your site
github_username:  jtipton25

# Build settings
markdown: redcarpet
highlighter: pygments
```
 
## Customizing the webpage using RMarkdown
## R code

## Equations

You can also include inline equations like $Y = X \beta + \epsilon$ or inset equations using 

```bash
\begin{align} 
Y\_{t} = \phi Y\_{t-1} + \epsilon\_{t} 
\end{align}
```
to get
\begin{align}
Y\_{t} = \phi Y\_{t-1} + \epsilon\_{t}
\end{align}

or by typing 

```bash
$$Y\_{t} = \phi Y\_{t-1} + \epsilon\_{t}$$
```

to get

$$Y\_{t} = \phi Y\_{t-1} + \epsilon\_{t}$$

Note that to get the underscore character `_` to render a subscript properly, you need to use the command `\_` in markdown to use markdown's escape mechanism. This means to get $Y\_{t}$ to render, type `Y\_{t}`.

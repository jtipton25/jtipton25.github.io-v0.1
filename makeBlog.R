library(servr)
# jekyll(input="_drafts/", output="_posts/")
jekyll(dir=".", input="_drafts", output="_posts", command="bundle exec jekyll build")

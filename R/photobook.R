#' Create photobook index
#' 
#' @param photobook_name Name of the book
#' @param photobook_author Names of the creators
#' @param photobook_repo org/repo
#' @param photobook_description Photobook.
#' @export
photobook_index = function(
  photobook_name = "Name of the book",
  photobook_author = "Names of the creators",
  photobook_repo = "org/repo",
  photobook_description = "Photobook."
  ) {
  paste0('--- 
title: "', photobook_name, '"
author: "', photobook_author, '"
date: "`r Sys.Date()`"
site: bookdown::bookdown_site
output: bookdown::gitbook
documentclass: book
# bibliography: [book.bib, packages.bib]
# biblio-style: apalike
link-citations: yes
github-repo: ', photobook_repo, '
description: "', photobook_description, '"
---

```{r, include=FALSE}
knitr::opts_chunk$set(echo = FALSE)

````

# Welcome
'
  )
}
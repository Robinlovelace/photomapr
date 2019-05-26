#' Create photobook index
#' 
#' @param groups Character vector the same length as `nrow(photo)`
#' @param index A character string produced by `photobook_index`
#' @inheritParams photo_group
#' @inheritParams photo_rmd
#' @inheritParams save_icons
#' @export
#' @examples 
#' f = geotagged_photo_paths()
#' 
#' photo = photos_sf(f)
#' photobook(photo)
#' \donttest{
#' # file.edit(file.path(tempdir(), "index.Rmd"))
#' setwd(tempdir())
#' list.files()
#' bookdown::render_book("index.Rmd")
#' browseURL("_book/index.html")
#' }
photobook = function(photo,
                     index = photobook_index(),
                     groups = NULL,
                     n_groups = 3,
                     captions = NULL,
                     dir_out = tempdir()
                     ) {
  if(is.null(groups)) {
    groups = photo_group(photo = photo, n_groups = n_groups)
  }
  unique_groups = unique(groups)
  index_file = file.path(dir_out, "index.Rmd")
  message("Saving index as ", index_file)
  writeLines(index, index_file)
  photo_dir = file.path(dir_out, "images")
  dir.create(photo_dir)
  message("Copying photos to ", dir_out)
  file.copy(photo$SourceFile, dir_out)
  photo_files = list.files(dir_out, pattern = ".jpg")
  
  # todo: convert to lapply if it makes sense
  for(i in seq(length(unique_groups))) {
    j = groups == unique_groups[i]
    rmd_text = photo_rmd(f = photo_files[j],
                         title = unique_groups[i],
                         captions = captions[j])
    rmd_file = file.path(dir_out, paste0(unique_groups[i], ".Rmd"))
    message("Saving group ", unique_groups[i], " as ", rmd_file)
    writeLines(rmd_text, rmd_file)
  }
  
}
#' Create an RMarkdown document from a series of photos
#' @param title The title of the document or chapter
#' @param captions A character vector of captions
#' @inheritParams make_icon
#' @export
#' @examples 
#' f = geotagged_photo_paths()
#' photo = photos_sf(f)
#' rmd_text = photo_rmd(photo$SourceFile)
#' writeLines(rmd_text, file.path(tempdir(), "photo.Rmd"))
#' if(require(rmarkdown)) {
#' rmarkdown::render(file.path(tempdir(), "photo.Rmd"))
#' }
#' # file.edit(file.path(tempdir(), "photo.Rmd"))
#' # browseURL(file.path(tempdir(), "photo.html"))
photo_rmd = function(f, title = "Day 1", captions = NULL) {
  if(is.null(captions)) {
    captions = f
  }
  c(paste0('# ', title), '
  

',
    paste0('
```{r, fig.cap="', captions, '"}
knitr::include_graphics("', f, '")
```

'))
}

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
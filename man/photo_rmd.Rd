% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/photobook.R
\name{photo_rmd}
\alias{photo_rmd}
\title{Create an RMarkdown document from a series of photos}
\usage{
photo_rmd(f, title = "Day 1", captions = NULL)
}
\arguments{
\item{f}{File path to photo(s).}

\item{title}{The title of the document or chapter}

\item{captions}{A character vector of captions}
}
\description{
Create an RMarkdown document from a series of photos
}
\examples{
f = geotagged_photo_paths()
photo = photos_sf(f)
rmd_text = photo_rmd(photo$SourceFile)
writeLines(rmd_text, file.path(tempdir(), "photo.Rmd"))
if(require(rmarkdown)) {
rmarkdown::render(file.path(tempdir(), "photo.Rmd"))
}
# file.edit(file.path(tempdir(), "photo.Rmd"))
# browseURL(file.path(tempdir(), "photo.html"))
}

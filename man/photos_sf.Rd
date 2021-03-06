% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/photos_sf.R
\name{photos_sf}
\alias{photos_sf}
\title{Convert photo filepaths into geographic sf object}
\usage{
photos_sf(f)
}
\arguments{
\item{f}{File path to photo(s).}
}
\description{
Convert photo filepaths into geographic sf object
}
\examples{
photos_geo = photos_sf(geotagged_photo_paths())
plot(photos_geo) 
}

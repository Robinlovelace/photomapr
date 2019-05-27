
<!-- README.md is generated from README.Rmd. Please edit that file -->
photomapr
=========

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/robinlovelace/photomapr.svg?branch=master)](https://travis-ci.org/robinlovelace/photomapr) [![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/robinlovelace/photomapr?branch=master&svg=true)](https://ci.appveyor.com/project/robinlovelace/photomapr) <!-- badges: end -->

The goal of photomapr is to make it easier to create photomaps. A photomap is an interactive map which shows the location of places where photos have been taken. Ideally, photomaps should be able to display the photo of interest when you click on it.

Why create your own photomaps?
------------------------------

Photomaps and photo albums are a great way to share experiences and remember good times. A good example of a photomap is that created by default by [Flickr](https://www.flickr.com/photos/97888609@N02/sets/72157704719583382/map) when an album of geotagged photos has been created. The image below shows a publicly available Flickr photomap, showing photos taken during a cycling holiday from the Knepp Estate rewilding project to Lewes, which ended by passing though [Marble Arch](https://www.independent.co.uk/environment/climate-change-protest-extinction-rebellion-london-oxford-street-waterloo-a8870206.html) in London.

[![](man/flickr-photomap.png)](https://www.flickr.com/photos/97888609@N02/sets/72157704719583382/map)

This approach has limitations, however. You must sign-up to Flickr and other services that create photomaps 'in the cloud', creating a barrier to entry. Furthermore, creating a photomap online often involves sending valuable and sometimes highly personal data to corporations. That can be problematic, as outlined in the [book](https://www.amazon.com/Team-Human-Douglas-Rushkoff/dp/039365169X) and [podcast series Team Human](https://teamhuman.fm/) by Douglas Rushkoff.

This package aims to make it easy to create photomaps locally and, if you want, deploy the results online. An example of photomaps is [bookdown.org/robinlovelace/madrid-santiago-2019](https://bookdown.org/robinlovelace/madrid-santiago-2019/), a photomap developed using an early version of this package, a screenshot of which is shown below (see [here](https://github.com/katyrobin/madrid-santiago-2019) to see how the package was used to create this photobook containing photomaps).

[![](man/figures/photobook-salamanca.png)](https://bookdown.org/robinlovelace/madrid-santiago-2019/)

Installation
------------

Install development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("robinlovelace/photomapr")
```

Usage
-----

The first stage is to decide the photos you want. The package cannot help you with that, but once you do have a number of photo files, represented by `photo_files` below, you can convert them to a geographic data frame with the function `photos_sf()`:

``` r
library(photomapr)

(photo_files = geotagged_photo_paths())
#> [1] "/usr/local/lib/R/site-library/photomapr/photos/IMG_20190523_120605_logo.jpg"
#> [2] "/usr/local/lib/R/site-library/photomapr/photos/IMG_20190523_135034_logo.jpg"
#> [3] "/usr/local/lib/R/site-library/photomapr/photos/IMG_20190524_104545_logo.jpg"
#> [4] "/usr/local/lib/R/site-library/photomapr/photos/IMG_20190524_110720_logo.jpg"
#> [5] "/usr/local/lib/R/site-library/photomapr/photos/IMG_20190524_200945_logo.jpg"
photos_geo = photos_sf(photo_files)
plot(photos_geo["DateTimeOriginal"], key.pos = 1)
```

<img src="man/figures/README-example-1.png" width="100%" />

Let's create a simple photomap, using data shipped in the package:

``` r
photomap(photo_files)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

You can also preview your photos with a slideshow in RStudio:

``` r
slideshow(photo_files) 
```

How it works
------------

The package works bringing together functionality from a number of excellent packages, including:

-   [`leaflet`](https://github.com/rstudio/leaflet) for interactive maps
-   [`magick`](https://github.com/ropensci/magick) which provides powerful tools for image processing
-   [`exifr`](https://github.com/paleolimbot/exifr) for extracting metadata (critically the GPS location) from photos
-   [`sf`](https://github.com/r-spatial/sf) for providing a class system for spatial data

Thanks to the developers of these packages, and to everyone making and using open source software. Without you this project would be impossible.

Next steps
----------

-   Clicking on photos in photomap opens photo
-   Auto-generation of photo albums with maps
-   Deployment of photomaps online?


<!-- README.md is generated from README.Rmd. Please edit that file -->

# photomapr

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/robinlovelace/photomapr.svg?branch=master)](https://travis-ci.org/robinlovelace/photomapr)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/robinlovelace/photomapr?branch=master&svg=true)](https://ci.appveyor.com/project/robinlovelace/photomapr)
<!-- badges: end -->

The goal of photomapr is to make it easier to create photomaps. A
photomap is an interactive map which shows the location of places where
photos have been taken. Ideally, photomaps should be able to display the
photo of interest when you click on it.

## Why create your own photomaps

Photomaps and photo albums are a great way to share experiences and
remember good times. A good example of a photomap is that created by
default by
[Flickr](https://www.flickr.com/photos/97888609@N02/sets/72157704719583382/map)
when an album of geotagged photos has been created. The image below
shows a publicly available Flickr photomap, showing photos taken during
a cycling holiday from the Knepp Estate rewilding project to Lewes,
which ended by passing though [Marble
Arch](https://www.independent.co.uk/environment/climate-change-protest-extinction-rebellion-london-oxford-street-waterloo-a8870206.html)
in
London.

[![](man/flickr-photomap.png)](https://www.flickr.com/photos/97888609@N02/sets/72157704719583382/map)

This approach has limitations, however. You must sign-up to Flickr and
other services that create photomaps ‘in the cloud’, creating a barrier
to entry. Furthermore, creating a photomap online often involves sending
valuable and sometimes highly personal data to corporations. That can be
problematic, as outlined in the
[book](https://www.amazon.com/Team-Human-Douglas-Rushkoff/dp/039365169X)
and [podcast series Team Human](https://teamhuman.fm/) by Douglas
Rushkoff.

This package aims to make it easy to create photomaps locally.
<!-- and, if you want, deploy the results online. -->

## Installation

Install development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("robinlovelace/photomapr")
```

## Usage

The first stage is to decide the photos you want. The package cannot
help you with that, but once you do have a number of photo files,
represented by `photo_files` below, you can convert them to a geographic
data frame with the function `photos_sf()`:

``` r
library(photomapr)

(photo_files = geotagged_photo_paths())
#> [1] "/home/robin/R/x86_64-pc-linux-gnu-library/3.6/photomapr/photos/IMG_20190523_120605_logo.jpg"
#> [2] "/home/robin/R/x86_64-pc-linux-gnu-library/3.6/photomapr/photos/IMG_20190523_135034_logo.jpg"
#> [3] "/home/robin/R/x86_64-pc-linux-gnu-library/3.6/photomapr/photos/IMG_20190524_104545_logo.jpg"
#> [4] "/home/robin/R/x86_64-pc-linux-gnu-library/3.6/photomapr/photos/IMG_20190524_110720_logo.jpg"
#> [5] "/home/robin/R/x86_64-pc-linux-gnu-library/3.6/photomapr/photos/IMG_20190524_200945_logo.jpg"
(photos_geo = photos_sf(photo_files))
#> Simple feature collection with 5 features and 84 fields
#> geometry type:  POINT
#> dimension:      XY
#> bbox:           xmin: -8.115535 ymin: 42.42215 xmax: -7.88984 ymax: 42.66204
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#> # A tibble: 5 x 85
#>   SourceFile ExifToolVersion FileName Directory FileSize FileModifyDate
#>   <chr>                <dbl> <chr>    <chr>        <int> <chr>         
#> 1 /home/rob…            11.4 IMG_201… /home/ro…    32748 2019:05:26 03…
#> 2 /home/rob…            11.4 IMG_201… /home/ro…    57089 2019:05:26 03…
#> 3 /home/rob…            11.4 IMG_201… /home/ro…    34375 2019:05:26 03…
#> 4 /home/rob…            11.4 IMG_201… /home/ro…    42078 2019:05:26 03…
#> 5 /home/rob…            11.4 IMG_201… /home/ro…    51643 2019:05:26 03…
#> # … with 79 more variables: FileAccessDate <chr>,
#> #   FileInodeChangeDate <chr>, FilePermissions <int>, FileType <chr>,
#> #   FileTypeExtension <chr>, MIMEType <chr>, JFIFVersion <chr>,
#> #   ExifByteOrder <chr>, Model <chr>, Software <chr>, Orientation <int>,
#> #   ModifyDate <chr>, YCbCrPositioning <int>, ISO <int>,
#> #   ExposureProgram <int>, FNumber <dbl>, ExposureTime <dbl>,
#> #   SensingMethod <int>, SubSecTimeDigitized <int>,
#> #   SubSecTimeOriginal <int>, SubSecTime <int>, FocalLength <dbl>,
#> #   Flash <int>, MeteringMode <int>, SceneCaptureType <int>,
#> #   InteropIndex <chr>, InteropVersion <chr>,
#> #   FocalLengthIn35mmFormat <int>, CreateDate <chr>,
#> #   ExifImageHeight <int>, WhiteBalance <int>, DateTimeOriginal <chr>,
#> #   BrightnessValue <dbl>, ExifImageWidth <int>, ExposureMode <int>,
#> #   ApertureValue <dbl>, ComponentsConfiguration <chr>, ColorSpace <int>,
#> #   SceneType <int>, ShutterSpeedValue <chr>, ExifVersion <chr>,
#> #   FlashpixVersion <chr>, ResolutionUnit <int>, GPSLatitudeRef <chr>,
#> #   GPSLongitudeRef <chr>, GPSAltitudeRef <int>, GPSTimeStamp <chr>,
#> #   GPSProcessingMethod <chr>, GPSDateStamp <chr>, XResolution <int>,
#> #   YResolution <int>, Make <chr>, ThumbnailOffset <int>,
#> #   ThumbnailLength <int>, Compression <int>, ImageWidth <int>,
#> #   ImageHeight <int>, EncodingProcess <int>, BitsPerSample <int>,
#> #   ColorComponents <int>, YCbCrSubSampling <chr>, Aperture <dbl>,
#> #   GPSAltitude <dbl>, GPSDateTime <chr>, GPSPosition <chr>,
#> #   ImageSize <chr>, Megapixels <dbl>, ScaleFactor35efl <dbl>,
#> #   ShutterSpeed <dbl>, SubSecCreateDate <chr>,
#> #   SubSecDateTimeOriginal <chr>, SubSecModifyDate <chr>,
#> #   ThumbnailImage <chr>, CircleOfConfusion <chr>, FOV <dbl>,
#> #   FocalLength35efl <int>, HyperfocalDistance <dbl>, LightValue <dbl>,
#> #   geometry <POINT [°]>

plot(photos_geo["DateTimeOriginal"], key.pos = 1)
```

<img src="man/figures/README-example-1.png" width="100%" />

Let’s create a simple photomap, using data shipped in the package:

``` r
photomap(photo_files)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

You can also preview your photos with a slideshow in RStudio:

``` r
slideshow(photo_files) 
```

## How it works

The package works bringing together functionality from a number of
excellent packages, including:

  - [`magick`](https://github.com/ropensci/magick), which provides
    powerful tools for image processing
  - [`exifr`](https://github.com/paleolimbot/exifr) for extracting
    metadata (critically the GPS location) from photos
  - [`sf`](https://github.com/r-spatial/sf) for providing a class system
    for spatial data

Thanks to the developers of these packages, and to anyone helping make
open source software a joy to use. Without you this project would be
impossible.

## Next steps

  - Show how to create interactive maps
  - Auto-generation of photo albums with maps

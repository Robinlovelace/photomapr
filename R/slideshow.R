#' Make a slideshow of photos
#' 
#' @param delay Delay in seconds between photos to show
#' @param repeat_show If `TRUE` the photos will repeat in an infinite loop. `FALSE` by default.
#' @inheritParams make_logo
#' @export
#' @example 
#' slideshow(geotagged_photos)
#' slideshow(geotagged_photo_paths())
slideshow = function(f, delay = 1, geometry = "800x600", repeat_show = FALSE) {
  is_files = methods::is(f, "character")
  if(repeat_show) {
    return(make_logo(f))
  } else if(methods::is(f, "list") && methods::is(f[[1]], "magick-image")) {
    for(mini in f) {
      print(mini)
      Sys.sleep(time = delay)
    }
  } else {
    for(i in f) {
      mini = make_logo(i, geometry = geometry)
      print(mini)
      message(i)
      Sys.sleep(time = delay)
    }
  }
}

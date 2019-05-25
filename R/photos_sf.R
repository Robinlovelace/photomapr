#' Convert photo filepaths into geographic sf object
#' @inheritParams make_logo
#' @export
#' @examples 
#' photos_geo = photos_sf(geotagged_photo_paths())
#' plot(photos_geo) 
photos_sf = function(f) {
  photos_info = exifr::read_exif(f)
  sf::st_as_sf(photos_info, coords = c("GPSLongitude", "GPSLatitude"), crs = 4326)
}
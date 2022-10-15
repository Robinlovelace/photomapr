#' Convert photo filepaths into geographic sf object
#' @inheritParams make_icon
#' @export
#' @examples 
#' photos_geo = photos_sf(geotagged_photo_paths())
#' plot(photos_geo) 
photos_sf = function(f) {
  photos_info = exifr::read_exif(f)
  photos_info$date_time = lubridate::ymd_hms(photos_info$DateTimeOriginal)
  photos_no_coords = is.na(photos_info$GPSLongitude)
  if (any(photos_no_coords)) {
    message("Some photos with no coordinates removed:\n")
    message(paste0(f[photos_no_coords], collapse = "\n"))
    photos_info = photos_info[!photos_no_coords, ]
  }
  sf::st_as_sf(
    photos_info,
    coords = c("GPSLongitude", "GPSLatitude"),
    crs = 4326,
    remove = FALSE
  )
}
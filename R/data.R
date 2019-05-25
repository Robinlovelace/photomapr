#' Stats19 schema and variables
#'
#' `geotagged_photos`is a list of `magick-image` objects, representing
#' geotagged photos generated with the following command: 
#' `geotagged_photos = make_logos(geotagged_photo_paths())`.
#' 
#' See the `data-raw` folder in the repo for details.
#'
#' @docType data
#' @keywords datasets
#' @name geotagged_photos
NULL

#' Return file paths of small geotagged photos, shipped with package
#' @export
geotagged_photo_paths = function() {
  list.files(system.file(package = "photomapr", "photos"), full.names = TRUE)
}

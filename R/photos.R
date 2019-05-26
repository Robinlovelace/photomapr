#' Group photos by time and location
#' 
#' This function allows you to group photos, by time or a combination of time and location.
#' If `date_time_cut` values are taken (times in which to break the photos)
#' time alone will be used to break-up the photos.
#' If not, you can simply request a number of breaks with `n_groups`.
#' 
#' @param photo An sf object created by `photos_sf`
#' @param n_groups The number of groups if `date_time_cut` is not provided
#' @param date_time_cut Times provided to break the photos
#' @param cluster_string Text string used to select variables used for clustering
#' @export
#' @examples
#' f = geotagged_photo_paths()
#' photo = photos_sf(f)
#' photo_group(photo, 2)
#' summary(photo$date_time)
#' date_time_cut = lubridate::ymd_hm(c("2019-05-23 00:00", "2019-05-24 11:00", "2019-05-24 24:00"))
#' photo$group = photo_group(photo, date_time_cut = date_time_cut)
#' plot(photo["DateTimeOriginal"], pch = photo$group)
photo_group = function(
  photo,
  n_groups = 3,
  date_time_cut = NULL, 
  cluster_string = "Latitude$|Longitude$|date_time"
  ) {
  stopifnot(methods::is(photo, "sf"))
  if(!is.null(date_time_cut)) {
    g = cut(photo$date_time, date_time_cut, labels = 1:(length(date_time_cut) - 1))
    return(as.character(g))
  }
  v = names(photo)
  vc = v[grepl(cluster_string, v)]
  photo_to_cluster = sf::st_drop_geometry(photo[vc])
  suppressWarnings({dists = stats::dist(photo_to_cluster)})
  hc = stats::hclust(dists)
  as.character(stats::cutree(tree = hc, k = n_groups))
}
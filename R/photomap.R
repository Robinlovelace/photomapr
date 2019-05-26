#' Creates an interactive photomap
#' 
#' @param iconWidth Width of the photo icon, in pixels
#' @param iconHeight Height of the photo icon, in pixels
#' @param icons File paths to icons of photos
#' @inheritParams save_icons
#' @export
#' @examples 
#' f = geotagged_photo_paths()
#' photomap(f)
photomap = function(f, icons = NULL, dir_out = tempdir(), iconWidth = 100, iconHeight = 75) {
  photos_geo = photos_sf(f)
  geometry = paste0(iconWidth, "x", iconHeight)
  if(is.null(icons)) {
    f_icon = save_icons(f = f, geometry = geometry, dir_out = dir_out)
  }
  
  photo_icons = leaflet::makeIcon(iconUrl = f_icon, iconWidth = iconWidth, iconHeight = iconHeight,   iconAnchorX = 22, iconAnchorY = 94)
  leaflet::leaflet(data = photos_geo) %>%
    leaflet::addTiles() %>%
    leaflet::addMarkers(icon = photo_icons, popup = )
}
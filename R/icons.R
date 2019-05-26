#' Make a icons from original photos
#' 
#' @param f File path to photo(s).
#' @param geometry A geometry specification such as `"100x80"`, meaning 100 pixels wide, 80 pixels high.
#' See [magick::geometry()] for details.
#' @export
make_icon = function(f, geometry = "400x300") {
  magick::image_scale(
    image = magick::image_read(f),
    geometry = geometry
  )
}

#' Generate a list of icon images
#' @inheritParams make_icon
#' @export
make_icons = function(f, geometry = "400x300") {
  lapply(f, make_icon, geometry = geometry)
}

#' Save icons of photos
#' @param dir_out Directory where files should be saved, `tempdir()` by default
#' @param format Output format. See [magick::image_write()] for details
#' @param overwrite Should previous files be overwritten? `TRUE` by default
#' @param ... Other arguments to pass to [magick::image_write()] 
#' @inheritParams make_icon
#' @export
save_icons = function(f, geometry = "400x300", dir_out = tempdir(), format = "png", overwrite = TRUE, ...) {
  f_icon = paste0(gsub(pattern = ".jpg", replacement = "", x = f), "_icon.", format)
  i_list = make_icons(f, geometry = geometry)
  purrr::map2(i_list, f_icon, magick::image_write, format = format, ...)
  file.copy(f_icon, dir_out, overwrite = overwrite)
  file.remove(f_icon)
  list.files(dir_out, "icon", full.names = TRUE)
}

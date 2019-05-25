#' Make a logos from original photos
#' 
#' @param f File path to photo(s).
#' @param geometry A geometry specification such as `"100x80"`, meaning 100 pixels wide, 80 pixels high.
#' See [magick::geometry()] for details.
#' @export
make_logo = function(f, geometry = "400x300") {
  magick::image_scale(
    image = magick::image_read(f),
    geometry = geometry
  )
}

#' Generate a list of logo images
#' @inheritParams make_logo
#' @export
make_logos = function(f, geometry = "400x300") {
  lapply(f, make_logo, geometry = geometry)
}

#' Save logos of photos
#' @param dir_out Directory where files should be saved, `tempdir()` by default
#' @param format Output format. See [magick::image_write()] for details
#' @param overwrite Should previous files be overwritten? `TRUE` by default
#' @param ... Other arguments to pass to [magick::image_write()] 
#' @inheritParams make_logo
#' @export
save_logos = function(f, geometry = "400x300", dir_out = tempdir(), format = "png", overwrite = TRUE, ...) {
  f_logo = paste0(gsub(pattern = ".jpg", replacement = "", x = f), "_logo.", format)
  i_list = make_logos(f, geometry = geometry)
  purrr::map2(i_list, f_logo, magick::image_write, format = format, ...)
  file.copy(f_logo, dir_out, overwrite = overwrite)
  file.remove(f_logo)
  list.files(dir_out, "logo", full.names = TRUE)
}

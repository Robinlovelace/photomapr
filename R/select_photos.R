#' Make a slideshow of photos
#' 
#' @inheritParams make_icon
#' @export
#' @examples 
#' if(interactive()) {
#' select_photos(geotagged_photo_paths())
#' }
select_photos = function(f, geometry = "800x600") {
  captions = rep(FALSE, length(f))
  for(i in seq(length(f))) {
    mini = make_icon(f[i], geometry = geometry)
    print(mini)
    # message("Enter caption for photo", i)
    message("Do you want to keep this photo? Default is No.", i)
    captions[i] = utils::menu(choices = c("No", "yes")) == 1
  }
  captions
}
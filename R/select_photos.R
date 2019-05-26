#' Helper function to select photos
#' 
#' @inheritParams make_icon
#' @export
#' @examples 
#' if(interactive()) {
#' select_photos(geotagged_photo_paths())
#' }
photo_select = function(f, geometry = "800x600") {
  captions = rep(FALSE, length(f))
  for(i in seq(length(f))) {
    mini = make_icon(f[i], geometry = geometry)
    print(mini)
    # message("Enter caption for photo", i)
    message("Do you want to keep this photo?", i)
    captions[i] = utils::menu(choices = c("No", "yes")) == 1
  }
  captions
}

#' Add photo captions with preview
#' 
#' @inheritParams make_icon
#' @export
#' @examples 
#' if(interactive()) {
#' photo_add_captions(geotagged_photo_paths())
#' }
photo_add_captions = function(f, geometry = "800x600") {
  captions = rep(NA_character_, length(f))
  for(i in seq(length(f))) {
    mini = make_icon(f[i], geometry = geometry)
    print(mini)
    # message("Enter caption for photo", i)
    message("Add caption for photo ", f[i])
    captions[i] = readline()
  }
  captions
}
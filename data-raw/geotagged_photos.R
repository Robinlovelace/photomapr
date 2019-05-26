## code to prepare `DATASET` dataset goes here

f = list.files(path = "~/Pictures/2019/05/", pattern = "0523|0524", full.names = TRUE, recursive = TRUE)
set.seed(1066)
f = sample(f, size = 5)
f = sort(f)
f[5] = "/home/robin/Pictures/2019/05/24/IMG_20190524_200945.jpg"
slideshow(f) # check the photos are good

f_small = save_icons(f, dir_out = "inst/photos/", format = "jpg", quality = 50)
file.size(f_small) / 1e6

slideshow(f_small) # check the quality

geotagged_photo_paths = function() {
  list.files(system.file(package = "photomapr", "photos"), full.names = TRUE)
}

geotagged_photos = make_icons(geotagged_photo_paths())
usethis::use_data(geotagged_photos)

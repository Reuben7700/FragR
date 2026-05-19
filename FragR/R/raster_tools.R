#' Reclassify Raster Values
#'
#' @param raster_obj A raster object.
#' @param reclass_matrix A matrix defining reclassification rules.
#' @return A raster object with reclassified values.
#' @examples
#' r <- terra::rast(matrix(sample(1:3, 100, replace=TRUE), 10, 10))
#' m <- matrix(c(1, 1, 10, 2, 2, 20, 3, 3, 30), ncol=3, byrow=TRUE)
#' r_new <- reclassify_raster(r, m)
#' plot(r_new, main = "Reclassified Raster")
#' @export
reclassify_raster <- function(raster_obj, reclass_matrix) {
  r_new <- terra::classify(raster_obj, reclass_matrix)
  plot(r_new, main = "Reclassified Raster", col = terrain.colors(20))
  return(r_new)
}

#' Mask Raster by Polygon
#'
#' @param raster_obj A raster object.
#' @param polygon_obj A vector polygon layer.
#' @return A raster object masked to the polygon extent.
#' @examples
#' r <- terra::rast(matrix(runif(100), 10, 10))
#' p <- sf::st_as_sf(sf::st_sfc(sf::st_polygon(list(rbind(c(2,2), c(2,8), c(8,8), c(8,2), c(2,2))))))
#' r_masked <- mask_raster(r, p)
#' plot(r_masked, main = "Masked Raster")
#' @export
mask_raster <- function(raster_obj, polygon_obj) {
  r_masked <- terra::mask(raster_obj, polygon_obj)
  plot(r_masked, main = "Masked Raster", col = rev(terrain.colors(20)))
  return(r_masked)
}

#' Calculate Raster Statistics
#'
#' @param raster_obj A raster object.
#' @return A list of basic statistics (mean, min, max, sd).
#' @examples
#' r <- terra::rast(matrix(runif(100, 0, 1), 10, 10))
#' stats <- raster_stats(r)
#' print(stats)
#' @export
raster_stats <- function(raster_obj) {
  stats <- list(
    mean = terra::global(raster_obj, "mean", na.rm = TRUE)[1,1],
    min  = terra::global(raster_obj, "min", na.rm = TRUE)[1,1],
    max  = terra::global(raster_obj, "max", na.rm = TRUE)[1,1],
    sd   = terra::global(raster_obj, "sd", na.rm = TRUE)[1,1]
  )
  print(stats)
  return(stats)
}

## NDVI Calculation
#' Compute NDVI from Raster Bands
#'
#' @param red_band Raster layer representing the red band.
#' @param nir_band Raster layer representing the near-infrared band.
#' @return A raster object containing NDVI values.
#' @examples
#' ndvi <- calc_ndvi(red_band, nir_band)
#' plot(ndvi)
#' @export
calc_ndvi <- function(red_band, nir_band) {
  ndvi <- (nir_band - red_band) / (nir_band + red_band)
  return(ndvi)
}

## Raster Reclassification
#' Reclassify Raster Values
#'
#' @param raster_obj A raster object.
#' @param reclass_matrix A matrix defining reclassification rules.
#' @return A raster object with reclassified values.
#' @examples
#' r <- terra::rast("landcover.tif")
#' m <- matrix(c(1, 1, 10, 2, 2, 20), ncol=3, byrow=TRUE)
#' r_new <- reclassify_raster(r, m)
#' plot(r_new)
#' @export
reclassify_raster <- function(raster_obj, reclass_matrix) {
  r_new <- terra::classify(raster_obj, reclass_matrix)
  return(r_new)
}

## Raster Masking
#' Mask Raster by Polygon
#'
#' @param raster_obj A raster object.
#' @param polygon_obj A vector polygon layer.
#' @return A raster object masked to the polygon extent.
#' @examples
#' r <- terra::rast("ndvi.tif")
#' p <- sf::st_read("protected_area.shp")
#' r_masked <- mask_raster(r, p)
#' plot(r_masked)
#' @export
mask_raster <- function(raster_obj, polygon_obj) {
  r_masked <- terra::mask(raster_obj, polygon_obj)
  return(r_masked)
}

## Raster Statistics
#' Calculate Raster Statistics
#'
#' @param raster_obj A raster object.
#' @return A list of basic statistics (mean, min, max, sd).
#' @examples
#' r <- terra::rast("ndvi.tif")
#' stats <- raster_stats(r)
#' print(stats)
#' @export
raster_stats <- function(raster_obj) {
  stats <- list(
    mean = terra::global(raster_obj, "mean", na.rm=TRUE)[1,1],
    min  = terra::global(raster_obj, "min", na.rm=TRUE)[1,1],
    max  = terra::global(raster_obj, "max", na.rm=TRUE)[1,1],
    sd   = terra::global(raster_obj, "sd", na.rm=TRUE)[1,1]
  )
  return(stats)
}

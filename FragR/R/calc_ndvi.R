#' Compute NDVI from Raster Bands
#'
#' @param red_band Raster layer representing the red band.
#' @param nir_band Raster layer representing the near-infrared band.
#' @return A raster object containing NDVI values.
#' @examples
#' red <- raster::raster(matrix(runif(100, 0.1, 0.5), 10, 10))
#' nir <- raster::raster(matrix(runif(100, 0.3, 0.8), 10, 10))
#' ndvi <- calc_ndvi(red, nir)
#' plot(ndvi, main = "NDVI Map", col = rev(terrain.colors(20)))
#' @export
calc_ndvi <- function(red_band, nir_band) {
  # Handle raster package
  if (inherits(red_band, "RasterLayer") && inherits(nir_band, "RasterLayer")) {
    ndvi <- (nir_band - red_band) / (nir_band + red_band)
    plot(ndvi, main = "NDVI (raster)", col = rev(terrain.colors(20)))
    return(ndvi)
  }

  # Handle terra package
  if (inherits(red_band, "SpatRaster") && inherits(nir_band, "SpatRaster")) {
    ndvi <- (nir_band - red_band) / (nir_band + red_band)
    plot(ndvi, main = "NDVI (terra)", col = rev(terrain.colors(20)))
    return(ndvi)
  }

  stop("Inputs must be RasterLayer (raster) or SpatRaster (terra).")
}

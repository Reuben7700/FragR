\name{calc_ndvi}
\alias{calc_ndvi}
\title{Compute NDVI from Raster Bands}
\description{
Calculates the Normalized Difference Vegetation Index (NDVI) using red and near-infrared raster bands.
}
\usage{
calc_ndvi(red_band, nir_band)
}
\arguments{
  \item{red_band}{Raster layer representing the red band.}
  \item{nir_band}{Raster layer representing the near-infrared band.}
}
\value{
Returns a raster object containing NDVI values.
}
\examples{
ndvi <- calc_ndvi(red_band, nir_band)
plot(ndvi)
}

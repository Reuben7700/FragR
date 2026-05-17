# FragR

FragR is an R package that provides practical tools for spatial fragmentation analysis and raster data processing. Designed for environmental scientists, GIS practitioners, and researchers, it streamlines common geospatial workflows such as buffering vector layers, calculating vegetation indices, and quantifying landscape fragmentation.

## Key Features
- **Buffer creation**: Generate buffers around vector layers with customizable distances (`buffer_layer()`).
- **Fragmentation metrics**: Compute indices to assess landscape fragmentation (`fragmentation_index()`).
- **Raster utilities**: Calculate NDVI and other raster‑based measures (`calc_ndvi()`).

## Installation
You can install the development version directly from GitHub:
```r
devtools::install_github("ReubenTetteh/FragR")

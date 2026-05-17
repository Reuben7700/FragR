# FragR

FragR is an R package that provides practical tools for spatial fragmentation analysis and raster data processing. Designed for environmental scientists, GIS practitioners, and researchers, it streamlines common geospatial workflows such as buffering vector layers, calculating vegetation indices, and quantifying landscape fragmentation.

## Key Features
- **Buffer creation**: Generate buffers around vector layers with customizable distances (`buffer_layer()`).
- **Fragmentation metrics**: Compute indices to assess landscape fragmentation (`fragmentation_index()`).
- **Raster utilities**: Calculate NDVI and other raster‑based measures (`calc_ndvi()`).

## Dependencies
Make sure you have the following packages installed:
install.packages(c("terra", "sf"))
-sf → required for vector operations like st_read() and st_buffer().
-terra → required for raster operations like NDVI calculation.

## Installation
You can install the development version directly from GitHub:
```r
devtools::install_github("ReubenTetteh/FragR")

##  FragR/LICENSE
YEAR: 2026
COPYRIGHT HOLDER: FragR authors 

## Workflow Overview 
Raw Data (Vector/Raster)
        ↓
   Preprocessing
        ↓
   FragR Functions
   ┌───────────────┐
   │ buffer_layer()│ → Buffers around vector features
   │ frag_index()  │ → Landscape fragmentation metrics
   │ calc_ndvi()   │ → Vegetation index from raster bands
   └───────────────┘
        ↓
 Analysis & Visualization
        ↓
   Environmental Insights

## Usage

After installing FragR, you can load the package and start working with vector and raster data.

```r
library(FragR)

# Example 1: Buffer creation around a vector layer
# Input: Shapefile of roads or rivers
buffered <- buffer_layer("path/to/shapefile.shp", distance_km = 10)
plot(buffered)

# Example 2: Calculate fragmentation index
# Input: Land cover shapefile or raster
frag_index <- fragmentation_index("path/to/landcover.shp")
print(frag_index)

# Example 3: NDVI calculation from raster bands
# Input: Red and Near-Infrared (NIR) raster bands
ndvi <- calc_ndvi(red_band, nir_band)
plot(ndvi)


##  Function Reference
| Function              | Purpose                                                        | Arguments                                                                 | Returns                          | Example                                                                 |
|-----------------------|----------------------------------------------------------------|---------------------------------------------------------------------------|----------------------------------|-------------------------------------------------------------------------|
| `buffer_layer()`      | Creates a buffer around vector features (points, lines, polygons). | - `file_path`: Path to vector file (e.g., shapefile)<br>- `distance_km`: Buffer distance in kilometers | Vector layer with buffered geometries | ```r<br>buffered <- buffer_layer("roads.shp", distance_km = 5)<br>plot(buffered)``` |
| `fragmentation_index()` | Calculates fragmentation metrics for a landscape.              | - `file_path`: Path to land cover vector or raster data                   | Numeric index (or set of indices) | ```r<br>frag_index <- fragmentation_index("landcover.shp")<br>print(frag_index)``` |
| `calc_ndvi()`         | Computes the Normalized Difference Vegetation Index (NDVI) from raster bands. | - `red_band`: Raster layer for red band<br>- `nir_band`: Raster layer for NIR band | Raster object with NDVI values   | ```r<br>ndvi <- calc_ndvi(red_band, nir_band)<br>plot(ndvi)```          |



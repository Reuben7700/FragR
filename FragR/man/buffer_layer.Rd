\name{buffer_layer}
\alias{buffer_layer}
\title{Create Buffer Around Vector Features}
\description{
Generates a buffer around vector features (points, lines, or polygons).
}
\usage{
buffer_layer(file_path, distance_km)
}
\arguments{
  \item{file_path}{Path to the vector file (e.g., shapefile).}
  \item{distance_km}{Buffer distance in kilometers.}
}
\value{
Returns a new vector layer with buffered geometries.
}
\examples{
buffered <- buffer_layer("roads.shp", distance_km = 5)
plot(buffered)
}

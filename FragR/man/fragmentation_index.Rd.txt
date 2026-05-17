\name{fragmentation_index}
\alias{fragmentation_index}
\title{Calculate Landscape Fragmentation Metrics}
\description{
Computes fragmentation indices to assess landscape connectivity and habitat integrity.
}
\usage{
fragmentation_index(file_path)
}
\arguments{
  \item{file_path}{Path to land cover vector or raster data.}
}
\value{
Returns numeric fragmentation metrics.
}
\examples{
frag_index <- fragmentation_index("landcover.shp")
print(frag_index)
}

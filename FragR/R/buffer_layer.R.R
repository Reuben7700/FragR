#' Create Buffer Around Vector Features
#'
#' @param file_path Path to the vector file (e.g., shapefile).
#' @param distance_km Buffer distance in kilometers.
#' @return A new vector layer with buffered geometries.
#' @examples
#' buffered <- buffer_layer("roads.shp", distance_km = 5)
#' plot(buffered)
#' @export
buffer_layer <- function(file_path, distance_km) {
  # Read the vector file
  data <- sf::st_read(file_path, quiet = TRUE)

  # Convert kilometers to meters
  dist_m <- distance_km * 1000

  # Apply buffer
  buffered <- sf::st_buffer(data, dist = dist_m)

  # Return buffered layer
  return(buffered)
}

## if you want to save the buffered ouput in a new file, you can extend it 
buffer_layer <- function(file_path, distance_km, output_file = NULL) {
  data <- sf::st_read(file_path, quiet = TRUE)
  dist_m <- distance_km * 1000
  buffered <- sf::st_buffer(data, dist = dist_m)

  if (!is.null(output_file)) {
    dir.create(dirname(output_file), showWarnings = FALSE, recursive = TRUE)
    sf::st_write(buffered, output_file, delete_dsn = TRUE, quiet = TRUE)
  }

  return(buffered)
}

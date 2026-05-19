#' Compute Fragmentation Index for Binary Land Cover
#'
#' Calculates a fragmentation index based on the coefficient of variation
#' of forest patch sizes in a binary raster.
#'
#' Fragmentation Index = SD(patch sizes) / Mean(patch sizes)
#'
#' Higher values indicate higher landscape fragmentation.
#'
#' @param raster_layer A RasterLayer object (1 = forest, 0 = non-forest).
#' @param directions Connectivity rule (4 or 8). Default is 8.
#' @param plot_result Logical. If TRUE, plots clumped forest patches.
#'
#' @return Numeric value representing fragmentation index.
#'
#' @examples
#' library(raster)
#' lc <- raster(matrix(sample(c(0,1), 100, replace=TRUE), 10, 10))
#' frag <- fragmentation_index(lc)
#' print(frag)
#'
#' @export
fragmentation_index <- function(raster_layer,
                                directions = 8,
                                plot_result = TRUE) {

  # 1. Input Validation
  if (!inherits(raster_layer, "RasterLayer")) {
    stop("Input must be a RasterLayer object.")
  }

  vals <- raster::values(raster_layer)
  unique_vals <- unique(stats::na.omit(vals))

  if (!all(unique_vals %in% c(0, 1))) {
    stop("Raster must be binary (0 = non-forest, 1 = forest).")
  }

  if (!directions %in% c(4, 8)) {
    stop("directions must be either 4 or 8.")
  }

  # 2. Extract Forest Only
  forest <- raster_layer
  forest[forest == 0] <- NA

  # 3. Identify Forest Patches
  clumps <- raster::clump(forest, directions = directions)

  # 4. Calculate Patch Sizes
  patch_table <- table(raster::values(clumps))
  patch_table <- patch_table[names(patch_table) != "NA"]

  if (length(patch_table) == 0) {
    warning("No forest patches detected.")
    return(NA_real_)
  }

  patch_sizes <- as.numeric(patch_table)

  # 5. Fragmentation Index
  frag_index <- stats::sd(patch_sizes) / mean(patch_sizes)

  # 6. Optional Plot-
  if (plot_result) {

    n_patches <- length(unique(stats::na.omit(raster::values(clumps))))

    raster::plot(
      clumps,
      main = paste("Fragmentation Index:", round(frag_index, 3)),
      col = grDevices::rainbow(n_patches)
    )
  }

  return(frag_index)
}

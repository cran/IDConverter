# Copy from sigminer
query_remote_data <- function(x) {
  x_url <- paste0("https://zenodo.org/record/6336671/files/", x)
  dir_dest <- system.file("extdata", package = "IDConverter")
  # if (!dir.exists(dir_dest)) dir.create(dir_dest, recursive = TRUE)
  x_dest <- file.path(dir_dest, x)
  message("Downloading ", x_url, " to ", x_dest)
  tryCatch(
    {
      download.file(
        url = x_url,
        destfile = x_dest
      )
      TRUE
    },
    error = function(e) {
      warning("Failed downloading the data.", immediate. = TRUE)
      FALSE
    }
  )
}

#' Load Data from Local or Remote Zenodo Repository
#'
#' @param x a dataset name.
#'
#' @return typically a `data.frame`, depends on `x`.
#' @importFrom utils download.file
#' @export
#' @examples
#' \donttest{
#' load_data("pcawg_full")
#' load_data("pcawg_simple")
#' load_data("tcga")
#' load_data("icgc")
#' }
load_data <- function(x) {
  load_file <- file.path(
    system.file("extdata", package = "IDConverter"),
    paste0(x, ".rda")
  )
  ok <- TRUE
  if (!file.exists(load_file)) ok <- query_remote_data(basename(load_file))
  if (!ok) {
    return(invisible(NULL))
  }
  # data = new.env(parent = emptyenv())
  # load(load_file, envir = data)
  # get(ls(data), envir = data)
  load(load_file)
  get(setdiff(ls(), c("load_file", "ok", "x")))
}
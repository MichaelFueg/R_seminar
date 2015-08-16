#' @export
run.Example <- function() {
  appDir <- system.file("shiny", package = "MetropolisHastings")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `MetropolisHastings`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}

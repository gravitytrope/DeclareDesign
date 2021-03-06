#' Declare the size and features of the population
#'
#' @inheritParams declare_internal_inherit_params
#' @return A function that returns a data.frame.
#' @export
#' @importFrom fabricatr fabricate
#'
#' @examples
#'
#' # Default handler is fabricatr::fabricate
#'
#' # Declare a single-level population with no covariates
#' my_population <- declare_population(N = 100)
#'
#' # Declare a population from existing data
#' my_population <- declare_population(sleep)
#'
#' # Declare a single-level population with a covariate
#' my_population <- declare_population(
#'   N = 6,
#'   gender = draw_binary(N, prob = 0.5),
#'   height_ft = rnorm(N, mean = 5 + 4/12 + 4/12 * gender, sd = 3/12)
#' )
#' my_population()
#'
#' # Declare a two-level hierarchical population
#' # containing cities within regions and a
#' # pollution variable defined at the city level
#'
#' my_population <- declare_population(
#'   regions = add_level(N = 5),
#'   cities = add_level(N = 10, pollution = rnorm(N, mean = 5))
#' )
#' my_population()
#'
#' # Declare a population using a custom function
#'
#' my_population_function <- function(N) {
#'   data.frame(u = rnorm(N))
#' }
#'
#' my_population_custom <- declare_population(N = 10, handler = my_population_function)
#'
#' my_population_custom()
declare_population <- make_declarations(fabricate, "population", strictDataParam = FALSE)

Inverse.Transformation.Rayleigh <- function(N, sigma) {
 u <- runif(N)
 x_q <- function(sigma, q){
  sigma * sqrt(-2 * log(1-q))
 }
 x <- x_q(sigma=sigma, q=u)
 return(x)
}

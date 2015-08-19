Random.walk.Metropolis.Laplace <-
function(sigma=1, x0=25, N=1000){
	x <- numeric(N)
	x[1] <- x0
	u <- runif(N)	
	f <- function(x) return(0.5*exp(-abs(x))) #Standard laplace distribution	
	k <- 0
	
	for (i in 2:N) {
		y <- rnorm(1, x[i-1], sigma)
		if (u[i] <= f(y) / f(x[i-1])) {
			x[i] <- y
		}
		else{
			x[i] <- x[i-1]
			k <- k + 1
		}
	}
	return(list(simulation=x, events=k))
}

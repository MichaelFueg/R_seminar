Metropolis.Hastings.sampler.Gamma <-
function(sigma=4, N=10000){ 
	x <- numeric(N)
	x[1] <- rgamma(1, shape=1, rate = 1)
	
	f <- function(x, sigma){
            if (any(x <0)) return(0)
            stopifnot(sigma > 0)
            return((x / sigma^2) * exp(-x^2 / (2 * sigma^2)))
        }
	
	u <- runif(N)
	k <- 0
	for (i in 2:N) {
		xt <- x[i-1]
		y <- rgamma(n=1, shape=xt, rate=1)
		num <- f(y, sigma) * dgamma(x=xt, shape=y, rate=1)
		den <- f(xt, sigma) * dgamma(x=y, shape=xt, rate=1)

		if (u[i] <= (num/den)) {
			x[i] <- y
		}
		else{
			x[i] <- xt
			k <- k + 1
		}
	}
	return(list(simulation=x, events=k))
}

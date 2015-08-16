Metropolis.Hastings.sampler <-
function(sigma=4, N=10000){ 
	x <- numeric(N)
	x[1] <- rchisq(1, df=1)
	
	f <- function(x, sigma){
		if (any(x < 0)) return(0)
		stopifnot(sigma > 0)
		return((x / sigma^2) * exp(-x^2 / (2 * sigma^2)))
	}
	
	u <- runif(N)
	k <- 0
	for (i in 2:N) {
		xt <- x[i-1]
		y <- rchisq(n=1, df=xt)
		num <- f(y, sigma) * dchisq(xt, df=y)
		den <- f(xt, sigma) * dchisq(y, df=xt)

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

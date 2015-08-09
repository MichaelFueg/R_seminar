Metropolis.Hastings.sampler <-
function(sigma=4, N=10000){
	x0 <- rchisq(n=1, df=1)
	x <- numeric(N)
	x[1] <- x0
	
	f <- function(x, sigma){
		if (any(x <0)) return(0)
		stopifnot(sigma > 0)
		return((x / sigma^2) * exp(-x^2 / (2 * sigma^2)))
	}
	
	u <- runif(N)
	k <- 0
	for (i in 2:N) {
		xt <- x[i-1]
		y <- rchisq(n=1, df=xt)
		num <- f(y, sigma) * dchisq(x=xt, df=y)
		den <- f(xt, sigma) * dchisq(x=y, df=xt)

		if (u[i] <= (num/den)) {
			x[i] <- y
		}
		else{
			x[i] <- xt
			k <- k + i
		}
	}
	return(list(simulation=x, events=k))
}

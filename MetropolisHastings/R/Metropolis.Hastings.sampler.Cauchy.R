Metropolis.Hastings.sampler.Cauchy <-
function(theta=1, eta=0, N=10000){ 
	options(warn=-1)# Warnings are produced with respect on the accuracy
	x <- numeric(N)
	x[1] <- rt(1, df=1)
	
	f <- function(x, theta, eta){
		stopifnot(theta > 0)
		return(1 / (theta * pi * (1 + ((x - eta) / theta)^2)))
	}
	
	u <- runif(N)
	k <- 0
	for (i in 2:N) {
		xt <- x[i-1]
		y <- rt(n=1, df=1, ncp=xt)
		num <- f(y, theta, eta) * dt(xt, df=1, ncp=y)
		den <- f(xt, theta, eta) * dt(y, df=1, ncp=xt)
		
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

Bayesian.inference <-
function(n, w, win){
	prob <- function(y, win){
		if((y < 0) || (y >= 0.5)) return(0)
		x <- (1 / 3)^win[1] * ((1 - y) / 3)^win[2] * ((1 - 2 * y) / 3)^win[3] * 
		     ((2 * y) / 3)^win[4] * (y / 3)^win[5]
		     return(x)
	}
	
	x <- numeric(n)
	u <- runif(n)
	v <- runif(n, -w, w)
	k <- 0
	x[1] <- .25
	
	for(i in 2:n){
		y <- x[i-1] + v[i]
		if(u[i] <= prob(y, win) / prob(x[i-1], win)){
		x[i] <- y
		}
		else{
			k <- k + 1
			x[i] <- x[i-1]
		}
	}
	return(list(simulation=x, events=k))
}

Genetic.Linkage <- function(n, w, animals, theta){
  #0 < theta < 1
  d <- c(125, 18, 20, 34)
  #sample(1:4, size=animals, replace=TRUE, prob=c(2+theta, 1-theta, 1-theta, theta))

	f <- function(y, d){
		if((y < 0) || (y >= 1)) return(0)
		x <- (1 / 2 + y / 4)^d[1] * ((1 - y) / 4)^d[2] * ((1 - y) / 4)^d[3] *
		     (y / 4)^d[4]
		return(x)
	}

	x <- numeric(n)
	u <- runif(n)
	v <- runif(n, -w, w)
	k <- 0
	x[1] <- w

	for(i in 2:n){
		y <- x[i-1] + v[i]
		if(u[i] <= f(y, d) / f(x[i-1], d)){
		x[i] <- y
		}
		else{
			k <- k + 1
			x[i] <- x[i-1]
		}
	}
	return(list(simulation=x, events=k))
}

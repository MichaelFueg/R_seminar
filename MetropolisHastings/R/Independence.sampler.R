Independence.sampler <-
function(n=30, N=5000, a=1, b=1, mu=c(0,5), sigma=c(1,1), p=0.2){
	i <- sample(1:2, size=n, replace=T, prob=c(p,1-p))
	x <- rnorm(n, mu[i], sigma[i])
	u <- runif(N)
	xt <- numeric(N)
	xt[1] <- 0.5
	y <- rbeta(N, a, b)
	k <- 0
	
	for(i in 2:N){
		fy <- y[i] * dnorm(x, mu[1], sigma[1]) + (1-y[i]) * dnorm(x, mu[2], sigma[2])
		fx <- xt[i-1] * dnorm(x, mu[1], sigma[1]) + (1-xt[i-1]) * dnorm(x, mu[2], sigma[2])
		
		r <- prod(fy / fx) * (xt[i-1]^(a-1)*(1-xt[i-1])^(b-1)) / (y[i]^(a-1)*(1-y[i])^(b-1))
		
		if(u[i]<=r){
			xt[i] <- y[i]
		}
		else{
			k <- k+1
			xt[i] <- xt[i-1]
		}
	}
	return(list(simulation=xt, events=k))
}

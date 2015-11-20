\name{Random.walk.Metropolis.Laplace}
\alias{Random.walk.Metropolis.Laplace}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Metropolis-Hastings Algorithm: Random-walk
}
\description{
This algorithm is a special case of a Metropolis sampler.
}
\usage{
Random.walk.Metropolis.Laplace(sigma, x0, N)
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Input parameters:
\item{sigma }{Variance of prosposal distribution}
\item{x0 }{Initialvalue of algorithm}
\item{N }{Iteration number}

Output parameters:
\item{simulation }{Initialvalue of algorithm}
\item{events  }{Number of rejected points}
}
\references{
Maria L. Rizzo, Statistical Computing with R, chapter 9.2.3
}
\author{
Michael Fueg
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# Use the default values: n=4, sigma=1, x0=25, N=2000
Random.walk.Metropolis()

# Variate the variance
sigma <- c( .05, .5, 2, 16)
res <- list()
for(i in 1:length(sigma)){
	name <- paste("SimulationNr_", i, sep="")
	res[[name]] <- Random.walk.Metropolis.Laplace(sigma=sigma[i])
	}

print(c(res$SimulationNr_1$events,res$SimulationNr_2$events,res$SimulationNr_3$events,res$SimulationNr_4$events))

#Compare with target distribution
a <- c(.05, seq(.1, .9, .1), .95)
g <- function(p) ifelse (p<0, NaN, ifelse(p<=0.5, log(2*p), ifelse(p<1, -log(2-2*p), NaN)))
Q <- g(a)
rw <- cbind(res$SimulationNr_1$simulation, res$SimulationNr_2$simulation,
            res$SimulationNr_3$simulation, res$SimulationNr_4$simulation)
colnames(rw) <- paste("SimulationNr", 1:4, sep="")
Qrw <- apply(rw[501:1000, ], 2, function(x) quantile(x,a))
print(round(cbind(Q, Qrw), 3))
}

\name{Random.walk.Metropolis}
\alias{Random.walk.Metropolis}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Metropolis-Hastings Algorithm: Random-walk
}
\description{
This algorithm is a special case of a Metropolis sampler.
}
\usage{
Random.walk.Metropolis(n, sigma, x0, N)
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Input parameters:
\item{n }{Description of 'comp1'}
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
# Use the default values
Random.walk.Metropolis()

# Variate the variance
sigma <- c( .05, .5, 2, 16)
res <- list()
for(i in 1:length(sigma)){
	name <- paste("SimulationNr_", i, sep="")
	res[[name]] <- Random.walk.Metropolis(sigma=sigma[i])
	}
}

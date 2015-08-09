\name{Metropolis.Hastings.sampler}
\alias{Metropolis.Hastings.sampler}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Metropolis-Hastings Algorithm: sample
}
\description{
This algorithm generates a sample from Rayleigh distribution
}
\usage{
Metropolis.Hastings.sampler(sigma, x0, N)
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Input parameters:
\item{sigma }{Variance of Rayleigh distribution}
\item{N }{Iteration number}

Output parameters:
\item{simulation }{Initialvalue of algorithm}
\item{events  }{Number of rejected points}
}
\references{
Maria L. Rizzo, Statistical Computing with R, chapter 9.2.1
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
# Use the default values sigma=4 and N=10000.
res <- Metropolis.Hastings.sampler()
print(res$events)
index <- 5000:5500
plot(index, res$simulation[index], type="l", main="", ylab="x")

#Comparing with target Rayleigh distribution (sigma=4) in QQplot
a <- ppoints(100)
QR <- 4 * sqrt(-2 * log(1-a)) #Quantiles of Rayleigh
Q <- quantile(res$simulation, a)

par(mfrow=c(2,1))
hist(res$simulation[2001:10000], breaks="scott", main="", xlab="", freq=F)
lines(QR, f(QR,4))
qqplot(QR, Q, main="", xlab="Rayleigh Quantiles", ylab="Sample Quantiles")

#Using reject-function for lines:
f <- function(x, sigma){
		if (any(x <0)) return(0)
		stopifnot(sigma > 0)
		return((x / sigma^2) * exp(-x^2 / (2 * sigma^2)))
	}

dev.off()
}

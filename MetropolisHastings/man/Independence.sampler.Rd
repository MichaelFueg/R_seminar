\name{Independence.sampler}
\alias{Independence.sampler}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Metropolis-Hastings Algorithm: Independence sampler
}
\description{
This algorithm is a special case of a Metropolis sampler.
}
\usage{
Independence.sampler(n, N, a, b, mu, sigma, p)
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Input parameters:
\item{n }{sample size}
\item{N }{Number of iterations}
\item{a }{Parameter of Beta(a,b) prospal distribution}
\item{b }{Parameter of Beta(a,b) prospal distribution}
\item{mu }{Parameter of the normal density}
\item{sigma }{Variance of the normal density}
\item{p }{Mixing parameter}

Output parameters:
\item{simulation }{Simulation set}
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
# Use the default values: n=30, N=5000, a=1, b=1, mu=c(0,5), sigma=c(1,1), p=0.2
res <- Independence.sampler()
hist(res$simulation[101:5000], main="", xlab="p", prob=T)
print(mean(res$simulation[101:5000]))

# Plot simulation with different values of a and b
par(mfrow=c(2,1))
plot(Independence.sampler()$simulation, type="l", ylab="p")
plot(Independence.sampler(a=5, b=2)$simulation, type="l", ylab="p")
dev.off()
}

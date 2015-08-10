\name{Bayesian.inference}
\alias{Bayesian.inference}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Metropolis-Hastings Algorithm: Bayesian inference
}
\description{
This algorithm models a simple investment model.
}
\usage{
Bayesian.inference()
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Input parameters:
\item{n }{Number of iterations}
\item{w }{Width of the uniform support set}
\item{win }{Simulated days of trading days that each of the stocks were the daily winner}

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
#  Create the input win:
b <- 0.2
w <- 0.25
n <- 5000
burn <- 1000
days <- 250
win <- tabulate(sample(1:5, size=days, replace=T, prob=c(1, 1-b, 1-2*b, 2*b,b)))
res <- Bayesian.inference(n, w, win)
print(win)
print(round(win/days, 3))
print(round(c(1, 1-b, 1-2*b, b)/3,3))
print(mean(res$simulation[(burn+1):n]))

#Plot results:
par(mfrow=c(1,2))
plot(res$simulation, type="l")
abline(h=b, v=burn, lty=3)
xb <- res$simulation[- (1:burn)]
hist(xb,prob=T, xlab=bquote(beta), ylab="X", main="")
a <- seq(min(xb), max(xb), length=100)
lines(a, dnorm(a, mean(xb), sd(xb)))
dev.off()
}

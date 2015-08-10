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
Independence.sampler()
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
# Use the default values: n=4, sigma=1, x0=25, N=2000
}

library(shiny)

shinyServer(function(input, output) {
	##### Example 1.1
	source("source/server.Metropolis.Hastings.sampler.R", local=TRUE)

	##### Example 2.1
	source("source/server.Random.walk.Metropolis.R", local=TRUE)
	
	##### Example 2.3
	source("source/server.Bayesian.inference.R", local=TRUE)

	##### Example 4.1
	source("source/server.Independence.sampler.R", local=TRUE)
})

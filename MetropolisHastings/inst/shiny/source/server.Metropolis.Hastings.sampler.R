#------------------------ Example 1.1 ------------------------#
output$"1.1.rangeReactivePlot" <- renderUI({
    sliderInput("1.1.rangePlot", 
        "Data range plot:", 
        min = 1,
        max = input$"1.1.N", 
        value = c(1, input$"1.1.N"))
})

output$"1.1.rangeReactiveAnalysis" <- renderUI({
    sliderInput("1.1.rangeHistogram", 
        "Data range histogram:", 
        min = 1,
        max = input$"1.1.N", 
        value = c(1, input$"1.1.N"))
})
             
dataInput1.1 <- reactive({ 
    Metropolis.Hastings.sampler(sigma=input$"1.1.sigma", N=input$"1.1.N") 
})
	
observeEvent(input$"1.1.rangePlot", ({
    output$"1.1.Plot" <- renderPlot({
        index <- input$"1.1.rangePlot"[1]:input$"1.1.rangePlot"[2]
        viz <- dataInput1.1()$simulation[index]
        plot(x=index, y=viz, xlab="Iteration", ylab="X", type="l", 
            main=paste("Quantity of rejected points: ",dataInput1.1()$events, sep=""))
    })
}))

observeEvent(input$"1.1.rangeHistogram", ({
    output$"1.1.Analysis" <- renderPlot({
     	f.Rayleigh <- function(x, sigma){
	 	    if (any(x <0)) return(0)
	 		stopifnot(sigma > 0)
	 		return((x / sigma^2) * exp(-x^2 / (2 * sigma^2)))
	 	}
	    a <- ppoints(100)
		QR <- 4 * sqrt(-2 * log(1-a)) 
		Q <- quantile(dataInput1.1()$simulation, a)
        viz <- dataInput1.1()$simulation[input$"1.1.rangeHistogram"[1]:input$"1.1.rangeHistogram"[2]]
        par(mfrow=c(1,2))
		    hist(viz, breaks="scott", main="Histogram", xlab="", freq=F)
		    lines(QR, f.Rayleigh(x=QR, sigma=input$"1.1.sigma"))
		    qqplot(QR, Q, xlab="Rayleigh Quantiles", ylab="Sample Quantiles", main="Quantile plot")
    })
}))

#------------------------ Exersice 1.2 ------------------------#
dataInput1.2 <- reactive({
    y <- system.time({
        x <- numeric(input$"1.2.N")
        x[1] <- 0
        for(i in 2:input$"1.2.N"){
            x[i] <- Metropolis.Hastings.sampler(sigma=input$"1.2.sigma", N=i)$events 
        }
    })
    x=list(events = x, systemTime = y)     
})

output$"1.2.print.time" <- renderPrint({ print(dataInput1.2()$systemTime) })

output$"1.2.Plot" <- renderPlot({ 
    plot(dataInput1.2()$events, xlab="Time horizon", ylab="Rejected points", 
        main="Rejected points in Metropolis-Hastings sampler", type="l")
})

#------------------------ Exersice 1.3 ------------------------#
output$"1.3.rangeReactivePlot" <- renderUI({
    sliderInput("1.3.rangePlot", 
        "Data range plot:", 
        min = 1,
        max = input$"1.3.N", 
        value = c(1, input$"1.3.N"))
})

dataInputChisquared1.3 <- reactive({ 
    Metropolis.Hastings.sampler(sigma=input$"1.3.sigma", N=input$"1.3.N") 
})

dataInputGamma1.3 <- reactive({ 
    Metropolis.Hastings.sampler.Gamma(sigma=input$"1.3.sigma", N=input$"1.3.N") 
})

observeEvent(input$"1.3.rangePlot", ({
    output$"1.3.Plot.Chisquared" <- renderPlot({
        index <- input$"1.3.rangePlot"[1]:input$"1.3.rangePlot"[2]
        viz <- dataInputChisquared1.3()$simulation[index]

        f.Rayleigh <- function(x, sigma){
            if (any(x <0)) return(0)
            stopifnot(sigma > 0)
            return((x / sigma^2) * exp(-x^2 / (2 * sigma^2)))
        }
        a <- ppoints(100)
        QR <- 4 * sqrt(-2 * log(1-a)) 

        par(mfrow=c(1,2))
            plot(x=index, y=viz, xlab="Iteration", ylab="X", type="l", 
                main=paste("Quantity of rejected points: ",dataInputChisquared1.3()$events, sep=""))
            hist(viz, breaks="scott", main="Histogram", xlab="", freq=F)
            lines(QR, f.Rayleigh(x=QR, sigma=input$"1.3.sigma"))
    })

    output$"1.3.Plot.Gamma" <- renderPlot({
        index <- input$"1.3.rangePlot"[1]:input$"1.3.rangePlot"[2]
        viz <- dataInputGamma1.3()$simulation[index]

        f.Rayleigh <- function(x, sigma){
            if (any(x <0)) return(0)
            stopifnot(sigma > 0)
            return((x / sigma^2) * exp(-x^2 / (2 * sigma^2)))
        }
        a <- ppoints(100)
        QR <- 4 * sqrt(-2 * log(1-a)) 
        
        par(mfrow=c(1,2))
            plot(x=index, y=viz, xlab="Iteration", ylab="X", type="l", 
                main=paste("Quantity of rejected points: ",dataInputGamma1.3()$events, sep=""))
            hist(viz, breaks="scott", main="Histogram", xlab="", freq=F)
            lines(QR, f.Rayleigh(x=QR, sigma=input$"1.3.sigma"))
    })
}))
#------------------------ Exersice 1.4 ------------------------#
output$"1.4.rangeReactivePlot" <- renderUI({
    sliderInput("1.4.rangePlot", 
        "Data range plot:", 
        min = 1,
        max = input$"1.4.N", 
        value = c(1, input$"1.4.N"))
})

output$"1.4.rangeReactiveAnalysis" <- renderUI({
    sliderInput("1.4.rangeHistogram", 
        "Data range histogram:", 
        min = 1,
        max = input$"1.4.N", 
        value = c(1, input$"1.4.N"))
})
             
dataInput1.4 <- reactive({ 
    Metropolis.Hastings.sampler.Cauchy(theta=input$"1.4.theta", eta=input$"1.4.eta",N=input$"1.4.N") 
})

observeEvent(input$"1.4.rangePlot", ({
    output$"1.4.Plot" <- renderPlot({
        index <- input$"1.4.rangePlot"[1]:input$"1.4.rangePlot"[2]
        viz <- dataInput1.4()$simulation[index]
        plot(x=index, y=viz, xlab="Iteration", ylab="X", type="l", 
            main=paste("Quantity of rejected points: ",dataInput1.4()$events, sep=""))
    })
}))

observeEvent(input$"1.4.rangeHistogram", ({
    output$"1.4.Analysis" <- renderPlot({
        f.Cauchy <- function(x, theta, eta){
            stopifnot(theta > 0)
            return(1 / (theta * pi * (1 + ((x - eta) / theta)^2)))
        }

        a <- ppoints(100)
        QR <- qcauchy(a) 
        Q <- quantile(dataInput1.4()$simulation, a)
        viz <- dataInput1.4()$simulation[input$"1.4.rangeHistogram"[1]:input$"1.4.rangeHistogram"[2]]
        par(mfrow=c(1,2))
            hist(viz, breaks="scott", main="Histogram", xlab="", freq=F)
            lines(QR, f.Cauchy(x=QR, theta=input$"1.4.theta", eta=input$"1.4.eta"))
            qqplot(QR, Q, xlab="Rayleigh Quantiles", ylab="Sample Quantiles", main="Quantile plot")
    })
}))
#------------------------ Example 2.3 ------------------------#
output$"2.3.rangeReactivePlot" <- renderUI({
            sliderInput("2.3.rangePlot",
                "Data range plot:",
                min = 1,
                max = input$"2.3.N",
                value = c(1, input$"2.3.N"))
             })


	dataInput2.3 <- reactive({
    y <- system.time({
		res <- Bayesian.inference(n=input$"2.3.N", w=input$"2.3.w",
		            win=tabulate(sample(1:5, size=input$"2.3.days", replace=T,
			                 prob=c(1, 1-input$"2.3.beta", 1-2*input$"2.3.beta",
                       2*input$"2.3.beta",input$"2.3.beta"))))
    })
    x=list(simulation = res$simulation, events = res$events, systemTime = y)
	})

  output$"2.3.print.time" <- renderPrint({ print(dataInput2.3()$systemTime) })
  output$"2.3.print.summary" <- renderPrint({ print(summary(dataInput2.3()$simulation)) })

    observeEvent(input$"2.3.rangePlot", ({
        output$"2.3.Plot" <- renderPlot({
    			index <- input$"2.3.rangePlot"[1]:input$"2.3.rangePlot"[2]
    			viz <- dataInput2.3()$simulation[index]
    			xb <- dataInput2.3()$simulation[- (1:input$"2.3.burn")]
    		    a <- seq(min(xb), max(xb), length=100)

    		par(mfrow=c(1,2))
    		plot(x=index, y=viz,
    			xlab="Iteration", ylab="X", type="l",
    			main=paste("Quantity of rejected points: ",dataInput2.3()$events, sep=""))
    		abline(h=input$"2.3.beta", v=input$"2.3.burn", lty=3)
		hist(xb,prob=T, xlab=bquote(beta), ylab="X", main="Histogram")
		lines(a, dnorm(a, mean(xb), sd(xb)))
        })
    }))

#------------------------ Example 2.4 ------------------------#

dataInput2.4 <- reactive({
        set.seed(1)
        Bayesian.inference(n=input$"2.4.N", w=input$"2.4.w",
        win=tabulate(sample(1:5, size=250, replace=T,
            prob=c(1, 1-input$"2.4.beta", 1-2*input$"2.4.beta", 2*input$"2.4.beta",input$"2.4.beta"))))
    })

output$"2.4.print.summary" <- renderPrint({ print(summary(dataInput2.4()$simulation)) })

output$"2.4.Plot" <- renderPlot({
    xb <- dataInput2.4()$simulation[- (1:1000)]
    a <- seq(min(xb), max(xb), length=100)

    hist(xb,prob=T, xlab=bquote(beta), ylab="X", main="Histogram")
    lines(a, dnorm(a, mean(xb), sd(xb)))
    })

#------------------------ Example 2.5 ------------------------#
output$"2.5.rangeReactivePlot" <- renderUI({
  sliderInput("2.5.rangePlot",
    "Data range plot:",
    min = 1,
    max = input$"2.5.N",
    value = c(1, input$"2.5.N"))
})

dataInput2.5 <- reactive({
  y <- system.time({
  res <- Genetic.Linkage(n=input$"2.5.N", w=input$"2.5.w", animals=input$"2.5.animals",
                theta=input$"2.5.theta")
  })

  x=list(simulation = res$simulation, events = res$events, systemTime = y)
})

output$"2.5.print.time" <- renderPrint({ print(dataInput2.5()$systemTime) })
output$"2.5.print.summary" <- renderPrint({ print(summary(dataInput2.5()$simulation)) })

observeEvent(input$"2.5.rangePlot", ({
  output$"2.5.Plot" <- renderPlot({
    index <- input$"2.5.rangePlot"[1]:input$"2.5.rangePlot"[2]
    viz <- dataInput2.5()$simulation[index]
    xb <- dataInput2.5()$simulation
    a <- seq(min(xb), max(xb), length=100)

    par(mfrow=c(1,2))
    plot(x=index, y=viz,
        xlab="Index", ylab="X", type="l",
        main=paste("Quantity of rejected points: ",dataInput2.5()$events, sep=""))
    hist(xb,prob=T, xlab=bquote(theta), ylab="X", main="Histogram")
    lines(a, dnorm(a, mean(xb), sd(xb)))
  })
}))

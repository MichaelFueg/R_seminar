#------------------------ Example 2.3 ------------------------#
output$"2.3.rangeReactivePlot" <- renderUI({
            sliderInput("2.3.rangePlot", 
                "Data range plot:", 
                min = 1,
                max = input$"2.3.N", 
                value = c(1, input$"2.3.N"))
             })

             
	dataInput2.3 <- reactive({
		Bayesian.inference(n=input$"2.3.N", w=input$"2.3.w", 
		win=tabulate(sample(1:5, size=input$"2.3.days", replace=T, 
			prob=c(1, 1-input$"2.3.beta", 1-2*input$"2.3.beta", 2*input$"2.3.beta",input$"2.3.beta"))))
	})
	
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
		hist(xb,prob=T, xlab=bquote(beta), ylab="X", main="Histogram full data range")
		lines(a, dnorm(a, mean(xb), sd(xb)))
        })
    }))
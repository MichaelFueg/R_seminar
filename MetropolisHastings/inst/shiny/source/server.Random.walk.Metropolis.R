#------------------------ Example 2.1 ------------------------#
output$"2.1.rangeReactivePlot" <- renderUI({
    sliderInput("2.1.rangePlot", 
        "Data range plot:", 
        min = 1,
        max = input$"2.1.N", 
        value = c(1, input$"2.1.N"))
})

dataInput2.1 <- reactive({
		Random.walk.Metropolis(n=input$"2.1.n", sigma=input$"2.1.sigma", x0=input$"2.1.x0", N=input$"2.1.N")
	})
observeEvent(input$"2.1.rangePlot", ({
	output$"2.1.Plot" <- renderPlot({
		index <- input$"2.1.rangePlot"[1]:input$"2.1.rangePlot"[2]
    	viz <- dataInput2.1()$simulation[index]

    	plot(viz, xlab="Iteration", ylab="X", type="l", 
    		main=paste("Quantity of rejected points: ",dataInput2.1()$events, sep=""))
    	if (input$"2.1.refline.0.025"){abline(h=qt(0.025,df=input$"2.1.n"), lty=3)}
    	if (input$"2.1.refline.0.975"){abline(h=qt(0.975,df=input$"2.1.n"), lty=3)}
    })
}))
#------------------------ Example 2.2 ------------------------#
output$"2.2.rangeReactivePlot" <- renderUI({
    sliderInput("2.2.rangePlot", 
        "Data range plot:", 
        min = 1,
        max = input$"2.2.N", 
        value = c(1, input$"2.2.N"))
})

dataInput2.2 <- reactive({
		Random.walk.Metropolis.Laplace(sigma=input$"2.2.sigma", x0=input$"2.2.x0", N=input$"2.2.N")
	})

observeEvent(input$"2.2.rangePlot", ({
    output$"2.2.Plot" <- renderPlot({
    	qlaplace <- function(p) return(ifelse(p<=0.5,log(2*p),-log(2*(1-p))))
    	index <- input$"2.2.rangePlot"[1]:input$"2.2.rangePlot"[2]
    	viz <- dataInput2.2()$simulation[index]

        plot(viz, xlab="Iteration", ylab="X", type="l", 
    		main=paste("Quantity of rejected points: ",dataInput2.2()$events, sep=""))
    	if (input$"2.2.refline.0.025"){abline(h=qlaplace(0.025), lty=3)}
    	if (input$"2.2.refline.0.975"){abline(h=qlaplace(0.975), lty=3)}
    })
}))
output$"3.1.rangeReactivePlot" <- renderUI({
            sliderInput("3.1.rangePlot", 
                "Data range plot:", 
                min = 1,
                max = input$"3.1.N", 
                value = c(1, input$"3.1.N"))
             })

             
	dataInput3.1 <- reactive({
		Independence.sampler(n=input$"3.1.n", N=input$"3.1.N", a=input$"3.1.a", b=input$"3.1.b", 
		mu=c(input$"3.1.mu1",input$"3.1.mu2"), sigma=c(input$"3.1.sigma1",input$"3.1.sigma2"), 
		p=input$"3.1.p")
	})

observeEvent(input$"3.1.rangePlot", ({	
    output$"3.1.Plot" <- renderPlot({
    			index <- input$"3.1.rangePlot"[1]:input$"3.1.rangePlot"[2]
    			viz <- dataInput3.1()$simulation[index]
    			 		
    		par(mfrow=c(1,2))
    		plot(x=index, y=viz,
    			xlab="Time horizon ", ylab="X", type="l", 
    			main=paste("Quantity of rejected points: ",dataInput3.1()$events, sep=""))
			hist(viz,prob=T, xlab="p", main="Histogram")
    })
}))
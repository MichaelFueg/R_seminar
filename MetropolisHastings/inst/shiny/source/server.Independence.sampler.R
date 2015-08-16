output$"4.1.rangeReactivePlot" <- renderUI({
            sliderInput("4.1.rangePlot", 
                "Data range plot:", 
                min = 1,
                max = input$"4.1.N", 
                value = c(1, input$"4.1.N"))
             })

             
	dataInput4.1 <- reactive({
		Independence.sampler(n=input$"4.1.n", N=input$"4.1.N", a=input$"4.1.a", b=input$"4.1.b", 
		mu=c(input$"4.1.mu1",input$"4.1.mu2"), sigma=c(input$"4.1.sigma1",input$"4.1.sigma1"), 
		p=input$"4.1.p")
	})
	
    output$"4.1.Plot" <- renderPlot({
    			index <- input$"4.1.rangePlot"[1]:input$"4.1.rangePlot"[2]
    			viz <- dataInput4.1()$simulation[index]
    			 		
    		par(mfrow=c(1,2))
    		plot(x=index, y=viz,
    			xlab="Time horizon ", ylab="X", type="l", 
    			main=paste("Quantity of rejected points: ",dataInput4.1()$events, sep=""))
			hist(viz,prob=T, xlab="p", main="Histogram")
    })
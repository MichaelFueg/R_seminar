dataInput2.1 <- reactive({
		Random.walk.Metropolis(n=input$"2.1.n", sigma=input$"2.1.sigma", x0=input$"2.1.x0", N=input$"2.1.N")
	})
	
    output$"2.1.Plot" <- renderPlot({
    plot(dataInput2.1()$simulation, xlab="Iteration", ylab="X", type="l", 
    main=paste("Quantity of rejected points: ",dataInput2.1()$events, sep=""))
    if (input$"2.1.refline.0.025"){abline(h=qt(0.025,df=input$"2.1.n"), lty=3)}
    if (input$"2.1.refline.0.975"){abline(h=qt(0.975,df=input$"2.1.n"), lty=3)}
    })

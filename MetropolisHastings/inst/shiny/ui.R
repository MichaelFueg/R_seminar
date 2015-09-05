shinyUI(fluidPage(
    titlePanel("Seminar Computational Statistics"),
  		navlistPanel(
			"1. Metropolis-Hastings sampler",
    		tabPanel("Example 1.1: Rayleigh distribution", 
    			fluidRow(
  					column(3, 
  						numericInput("1.1.sigma",
    						"Variance of Rayleigh distribution:",
    						min = 0,
    						value = 4)
    				),
    				column(3,		
    					sliderInput("1.1.N", 
                			"Time horizon:", 
                			min = 2,
                			max = 100000, 
                			value = 10000)
                	),
    				column(3,
    				    uiOutput("1.1.rangeReactivePlot")
    				),
    				column(3,
    				    uiOutput("1.1.rangeReactiveAnalysis")
    				)
    	        ),
  				    hr(),
  				    plotOutput("1.1.Plot"),
  				    hr(), 
  				    plotOutput("1.1.Analysis")
			    ),

            tabPanel("Exersice 1.2: Performance and alternatives",
                fluidRow(
                    helpText("Comparing the Metropolis-Hastings sampler method with the inverse transform method to generat Rayleigh samples with sigma = 2"),            
                    column(3,
                        numericInput("1.2.sigma", 
                            "Variance of Rayleigh distribution:", 
                            min = 0,
                            value = 4)
                    ),
                    column(3,
                        sliderInput("1.2.N", 
                            "Time horizon:", 
                            min = 2,
                            max = 1000, 
                            value = 100)
                    )                    
                ),
                hr(),
                fluidRow(
                    column(6,
                        helpText("System performance Metropolis-Hastings sampler:"),
                        verbatimTextOutput("1.2.print.time")
                    ),
                    column(6,
                        helpText("System performance inverse transformation:"),
                        verbatimTextOutput("1.2.print.time.inverse")
                    )
                ),
                hr(),
                fluidRow(
                    column(6,
                        plotOutput("1.2.Plot")
                    ),
                    column(6,
                        plotOutput("1.2.Plot.inverse")
                    )
                )
            ),

            tabPanel("Exersice 1.3: Variation of prosposal distribution",
                fluidRow(
                    helpText("Use as prosposal distribution Y ~ Gamma(X_t, 1) and compare the result with Z ~ X^2(X_t)"),            
                    column(3,
                        numericInput("1.3.sigma",
                            "Variance of Rayleigh distribution:",
                            min = 0,
                            value = 4)
                    ),
                    column(3,
                        sliderInput("1.3.N", 
                            "Time horizon:", 
                            min = 2,
                            max = 100000, 
                            value = 10000)
                    ),
                    column(3,
                        uiOutput("1.3.rangeReactivePlot")
                    )
                ),
                hr(),
                plotOutput("1.3.Plot.Chisquared"),
                plotOutput("1.3.Plot.Gamma")
            ),

			tabPanel("Exersice 1.4: Cauchy distribution",
                fluidRow(
                    column(4,
                        numericInput("1.4.theta",
                            "Parameter theta:",
                            min = 0,
                            value = 1),
                        sliderInput("1.4.N", 
                            "Time horizon:", 
                            min = 1,
                            max = 100000, 
                            value = 10000)
                    ),  
                    column(4,
                        numericInput("1.4.eta",
                            "Parameter eta:",
                            value = 0),
                        uiOutput("1.4.rangeReactivePlot")
                    ),
                    column(4,
                        uiOutput("1.4.rangeReactiveAnalysis")
                    )
                ),
                hr(),
                plotOutput("1.4.Plot"),
                hr(), 
                plotOutput("1.4.Analysis")
            ),
			 
            "2. Random-walk Metropolis",
    		tabPanel("Example 2.1: Student t distribution",
    			fluidRow(
    			    column(4,
                        numericInput("2.1.x0", 
                            "Initial value:", 
                            value = 25),      
  						numericInput("2.1.n",
    						"Degrees of freedom:",
    						min = 1,
    						value = 4),
                        numericInput("2.1.sigma",
                           "Variance prosposal distribution:",
                            min = 0,
                            value = 1)
    				),
    				column(4,
    				    sliderInput("2.1.N", 
                            "Time horizon:", 
                            min = 1,
                            max = 10000, 
                            value = 2000),
    				    uiOutput("2.1.rangeReactivePlot")
                	),
                	column(4,
    					helpText("Add reference lines of the Student t distribution to the current plot:"),
    					checkboxInput("2.1.refline.0.025", 
    						"Add 0.025 quantile", 
    						value = TRUE),
    					checkboxInput("2.1.refline.0.975", 
    						"Add  0.975 quantile", 
    						value = TRUE)
    				)
    			),
    			hr(),
    			plotOutput("2.1.Plot")              
			),

    			tabPanel("Exersice 2.2: Standard Laplace distribution",
                fluidRow(
                    column(4,
                        numericInput("2.2.x0",
                            "Initial value:",
                            value = 25),
                        sliderInput("2.2.N", 
                        "Time horizon:", 
                            min = 1,
                            max = 10000, 
                            value = 5000)
                    ),
                    column(4,
                        numericInput("2.2.sigma",
                            "Variance prosposal distribution:",
                            min = 0,
                            value = 1),
                        uiOutput("2.2.rangeReactivePlot")
                    ),
                    column(4,
                        helpText("Add reference lines of the standard Laplace distribution to the current plot:"),
                        checkboxInput("2.2.refline.0.025", 
                            "Add 0.025 quantile", 
                            value = TRUE),
                        checkboxInput("2.2.refline.0.975", 
                            "Add  0.975 quantile", 
                            value = TRUE)
                    )
                ),
                hr(),
                plotOutput("2.2.Plot")              
                ),                   

    			tabPanel("Example 2.3: Bayesian inference",
    			fluidRow(
    				column(4,
  						numericInput("2.3.w",
    						"Width of uniform support set:",
    						min = 0,
    						max = 1,
    						value = 0.25),
    				    sliderInput("2.3.N", 
                		"Time horizon:", 
                		    min = 1,
                		    max = 10000, 
                		    value = 5000)
    				),
    				column(4,
    				    numericInput("2.3.beta",
    					    "Parameter beta:",
    					    min = 0,
    					    max = 0.5,
    					    value = 0.2),
                	    uiOutput("2.3.rangeReactivePlot")
                	),
    				column(4,
    				    numericInput("2.3.burn",
    					    "burn-in time:",
    					    min = 1,
    					    max = 10000,
    					    value = 1000),
    				    numericInput("2.3.days",
    					    "Days:",
    					    min = 1,
    					    max = 361,
    					    value = 250)                 	
                	)    	    			
                ),
    			hr(),
    			plotOutput("2.3.Plot")
    			),
                tabPanel("Exersice 2.4: Effects of parameter modification",
                helpText("We set the trading days to 250 and the burn-in time to 1000. The random number seed is fixed."),
                fluidRow(
                    column(3,
                        numericInput("2.4.w",
                            "Width uniform support set:",
                            min = 0,
                            max = 1,
                            value = 0.25)
                        ),
                    column(3,
                        numericInput("2.4.beta",
                            "Parameter beta:",
                            min = 0,
                            max = 0.5,
                            value = 0.2)
                    ), 
                    column(6,
                        sliderInput("2.4.N", 
                        "Time horizon:", 
                            min = 1,
                            max = 10000, 
                            value = 5000)
                    )                                  
                ),
                hr(),
                plotOutput("2.4.Plot"),
                plotOutput("2.4.Analysis")
                ),

                tabPanel("Exersice 2.5: Generic linkage animals"),

    			"3. Independence sampler",
    			tabPanel("Example 3.1: Two-component normal mixture",
    			fluidRow(
    				column(4,
  					    numericInput("3.1.n",
    						"Sample size:",
    						min = 0,
    						max = 1000,
    						value = 30),
  					    numericInput("3.1.p",
    						"Mixing parameter:",
    						min = 0,
    						max = 1,
    						value = 0.2),
    				    sliderInput("3.1.N", 
                		    "Time horizon:", 
                		    min = 1,
                		    max = 10000, 
                		    value = 5000)
    				),
    				column(4,
    				    numericInput("3.1.a",
    					    "Parameter a of Beta(a,b):",
    					    min = 0,
    					    max = 100,
    					    value = 1),
    				    numericInput("3.1.b",
    					    "Parameter b of Beta(a,b):",
    					    min = 0,
    					    max = 100,
    					    value = 1),
                	    uiOutput("3.1.rangeReactivePlot")
                	),            	
    				column(4,
    				    numericInput("3.1.sigma1",
    					    "First variance:",
    					    min = 0,
    					    value = 1),
    				    numericInput("3.1.sigma2",
    					    "Second variance:",
    					    min = 0,
    					    value = 1),
    				    numericInput("3.1.mu1",
    					    "First mean:",
    					    value = 0),
    				    numericInput("3.1.mu2",
    					    "Second mean:",
    					    value = 5)               	
                	)    	    			
                ),
    			hr(),
    			plotOutput("3.1.Plot")
    		)
    		)   		
))
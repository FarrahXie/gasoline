library(tidyverse)
library(shiny)
library(shinydashboard)
library(leaflet)
library(DT)
library(plotly)
library(reshape2)
library(viridis)
library(tm) 
library(wordcloud) 
library(syuzhet) 
library(SnowballC)
library(scales)


ui <- dashboardPage(
    dashboardHeader(title = span(strong("Gasoline"),
                                 style = "font-family: 'times'; font-size: 28px")),
    dashboardSidebar(
        sidebarMenu(
            menuItem(
                span("Home", style = "font-size: 18px"),
                tabName = "home",
                icon = icon("home")
            ),
            tags$hr(style = "border-color: white;"),
            menuItem(
                span("Knowledge", style = "font-size: 18px"),
                tabName = "gas_knowledge",
                icon = icon("book")
            ),
            menuItem(
                span("Price", style = "font-size: 18px"),
                tabName = "price",
                icon = icon("usd")
            ),
            menuItem(
                span("Wordcloud", style = "font-size: 18px"),
                tabName = "cloud",
                icon = icon("cloud")
            ),
            menuItem(
                span("Dataset", style = "font-size: 18px"),
                tabName = "data",
                icon = icon("database")
            )
        )
    ),
    dashboardBody(tabItems(
        tabItem(
            tabName = "home",
            h1(
              strong("Our Project About Gasoline", style = "font-family: 'times'; font-size: 28px;"),
              align = "center",
              id = "main"
            ),
            img(src='gas.jpg', align = "center", height="100%", width="100%"),
            br(),
            br(),
            
            fluidRow(
                box(
                    title = span(strong("Contents"), 
                                style = "font-family: 'times'; font-size: 20px"
                    ),
                    solidHeader = TRUE,
                    width = 12,
                    h4(
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        a("Innitiative and Project Description",
                            type="button",
                            href="#Innitiative and Project Description"),
                        ),
                    h4(
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        a("Overview of Our Website",
                            type="button",
                            href="#Overview of Our Website"),
                        ),
                    h4(
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        a("Dataset",
                            type="button",
                            href="#Dataset"),
                        ),
                    h4(
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        a("Methods",
                            type="button",
                            href="#Methods"),
                        ),
                    h4(
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        a("Team Info",
                            type="button",
                            href="#Team Info"),
                        ),
                ),
                box(
                    title = span(strong("Innitiative and Project Description"), 
                                 style = "font-family: 'times'; font-size: 20px", 
                                 id="Innitiative and Project Description"),
                    solidHeader = TRUE,
                    width = 12,
                    p(
                        h4(
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            "Gasoline (gas) price has been skyrocketing since the end of 2021, especially when Russian and Ukraine conflict happened. It topped $5 for the first time in June 2022. President Joe Biden’s administration then has authorized the largest release of oil from global oil reserves in history, gas prices did drop for a while, but the national average price of a gallon of gas is $4.78 on July 6, still $1.65 more than it was last July. A dwindling global oil supply, combined with increased demand, refining costs and harsh weather threats are pushing some analysts to think these high gas prices may be the norm for a while. ",
                            style = "font-family: 'times'"
                        ),
                        style = "margin-bottom: 0px;"
                    ),
                    p(
                        h4(
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            "Increasing gas price is affecting everyone’s daily life. For people who have cars, the increase directly causes more expense on driving. Also, gas is essential in most business, especially for transportation. The increasing cost in transportation stimulates the increase in price of all commodities and is causing further inflation, thus the higher price of gas eventually passed onto all end customers. ",
                            style = "font-family: 'times'"
                        ),
                        style = "margin-bottom: 0px;"
                    ),
                    p(
                        h4(
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            "In our study, we wanted to acquaint users of gasoline related knowledge, visualize US gas price breakdown, as well as the historical changes and regional distribution of gas price, find out possible reasons behind rising gas price, summarize customers’ attitudes towards gas prices and conduct sentimental analysis, provide predictions on future gas price to potentially help customers decide when to add gas.",
                            style = "font-family: 'times'"
                        ),
                        style = "margin-bottom: 0px;"
                    )
                ),
                box(
                    title = span(strong("Overview of Our Website"), 
                                 style = "font-family: 'times'; font-size: 20px",
                                 id="Overview of Our Website"),
                    style = "font-family: 'times'",
                    solidHeader = TRUE,
                    width = 12,
                    p(
                        h4(
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            "Our website consists of 5 pages, each represented by a side bar.",
                            style = "font-family: 'times'"
                        ),
                        style = "margin-bottom: 0px;"
                    ),
                    p(
                        h4(
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            "1.	Home page (this page).",
                            style = "font-family: 'times'"
                        ),
                        style = "margin-bottom: 0px;"
                    ),
                    p(
                        h4(
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            "2.	Gasoline knowledge provides essential gasoline related information.",
                            style = "font-family: 'times'"
                        ),
                        style = "margin-bottom: 0px;"
                    ),
                    p(
                        h4(
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            "3.	Price page is consisted of 3 tab boxes. The first box (Price Breakdown) visualizes the changes in gas price breakdown, which includes crude oil, refining cost, marketing and distribution, and taxes. Users can enter a date to see the gas price breakdown on a particular date. The second box (Price Change) visualizes the changes in gas price from 1990 until now, users can choose to add one or multiple events onto the graph to see effects brought by these events. User can also choose to see gas price for one or multiple types of oil. The third box (Price Distribution) visualizes the regional distribution of gas price in the US. Users can select to see the price in a state in the dropdown box.",
                            style = "font-family: 'times'"
                        ),
                        style = "margin-bottom: 0px;"
                    ),
                    p(
                        h4(
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            "4.	Word cloud provides the most typical words occurred on twitter on a selected date. Users can choose the date and number of words to display.",
                            style = "font-family: 'times'"
                        ),
                        style = "margin-bottom: 0px;"
                    ),
                    p(
                        h4(
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            "5.	Dataset page contains the datasets we used in this project.",
                            style = "font-family: 'times'"
                        ),
                        style = "margin-bottom: 0px;"
                    )
                ),
                box(
                    title = span(strong("Dataset"), 
                                 style = "font-family: 'times'; font-size: 20px",
                                 id="Dataset"),
                    style = "font-family: 'times'",
                    solidHeader = TRUE,
                    width = 12,
                    p(
                        h4(
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            "We found our gas related datasets from U.S. Energy Information Administration (EIA).",
                            style = "font-family: 'times'"
                        ),
                        style = "margin-bottom: 0px;"
                    ),
                    p(
                        h4(
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            "Gasoline price from:",
                            tags$a(
                                em("//www.eia.gov/dnav/pet/PET_PRI_GND_DCUS_NUS_W.htm"),
                                href = "//www.eia.gov/dnav/pet/PET_PRI_GND_DCUS_NUS_W.htm"
                            ),
                            style = "font-family: 'times'"
                        ),
                        style = "margin-bottom: 0px;"
                    ),
                    p(
                        h4(
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            "Gasoline price breakdown from:",
                            tags$a(
                                em(
                                    "//www.energy.ca.gov/data-reports/energy-almanac/transportation-energy/estimated-gasoline-price-breakdown-and-margins"
                                ),
                                href = "//www.energy.ca.gov/data-reports/energy-almanac/transportation-energy/estimated-gasoline-price-breakdown-and-margins"
                            ),
                            style = "font-family: 'times'"
                        ),
                        style = "margin-bottom: 0px;"
                    ),
                    p(
                      h4(
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        "Big events influenced oil market from:",
                        tags$a(
                          em(
                            "//www.eia.gov/finance/markets/crudeoil/spot_prices.php"
                          ),
                          href = "//www.eia.gov/finance/markets/crudeoil/spot_prices.php"
                        ),
                        style = "font-family: 'times'"
                      ),
                      style = "margin-bottom: 0px;"
                    )
                ),
                box(
                    title = span(strong("Methods"), 
                                 style = "font-family: 'times'; font-size: 20px",
                                 id="Methods"),
                    style = "font-family: 'times'",
                    solidHeader = TRUE,
                    width = 12,
                    p(
                        h4(
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            "We used the Shiny package in R to build this interactive web page. See the original repository",
                            tags$a(
                              em(
                                "here."
                              ),
                              href ="//github.com/FarrahXie/gasoline"
                            ),
                            style = "font-family: 'times'"
                        ),
                        style = "margin-bottom: 0px;"
                    ),
                    p(
                        h4(
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            HTML('&nbsp;'),
                            "Methods for word cloud: Since the twitter API server is down, we cannot get the real time data, so our dataset is from Kaggle which inlcudes Twitter users comments in July 2019. We mainly used wordcloud and syuzhet package functions to create the wordcloud with the dataset.",
                            style = "font-family: 'times'"
                        ),
                        style = "margin-bottom: 0px;"
                    )
                ),
                box(
                    title = span(strong("Team Info"), 
                                 style = "font-family: 'times'; font-size: 20px",
                                 id="Team Info"),
                    style = "font-family: 'times'",
                    solidHeader = TRUE,
                    width = 12,
                    height = 200,
                    p(
                      h4(
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        "Farrah Xie: Fall forward. farrahxym@gmail.com",
                        style = "font-family: 'times'"
                      ),
                      style = "margin-bottom: 0px;"
                    ),
                    p(
                      h4(
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        "Yuanrong Liu: ESTJ, Sit-up player. yliu417@jh.edu",
                        style = "font-family: 'times'"
                      ),
                      style = "margin-bottom: 0px;"
                    ),
                    p(
                      h4(
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        "Yifan Tu: ENFP, BARM's graduate, Shanghai-ning, OK. ytu14@jh.edu",
                        style = "font-family: 'times'"
                      ),
                      style = "margin-bottom: 0px;"
                    ),
                    p(
                      h4(
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        HTML('&nbsp;'),
                        "Yifan Wang: ENFJ, BARM's graduate, Dreamer. ywang652@jh.edu",
                        style = "font-family: 'times'"
                      ),
                      style = "margin-bottom: 0px;"
                    ),
                ),
                h4(
                    a("Back to top", type = "button", href = "#main"), 
                    align="center"
                )
            )
        ),
        tabItem(tabName = "gas_knowledge",
                fluidRow(
                    box(
                        title = span(strong("Gasoline is sold and priced by grade"), style = "font-family: 'times'; font-size: 20px"),
                        solidHeader = TRUE,
                        width = 12,
                        p(
                            h4(
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                "Gasoline is sold based on octane levels in three primary grades of gasoline:",
                                style = "font-family: 'times'"
                            ),
                            style = "margin-bottom: 0px;"
                        ),
                        p(
                            h4(
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                "1.	Regular",
                                style = "font-family: 'times'"
                            ),
                            style = "margin-bottom: 0px;"
                        ),
                        p(
                            h4(
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                "2.	Midgrade",
                                style = "font-family: 'times'"
                            ),
                            style = "margin-bottom: 0px;"
                        ),
                        p(
                            h4(
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                "3.	Premium",
                                style = "font-family: 'times'"
                            ),
                            style = "margin-bottom: 0px;"
                        ),
                        p(
                            h4(
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                "The octane level of gasoline refers to its resistance to combustion. Gasoline with a higher octane level is less prone to pre-ignition and detonation, also known as engine knocking. Refiners charge more for higher octane fuel, and premium-grade gasoline is the most expensive. From 1995 through 2006, the price difference among grades of gasoline was typically about 10 cents per gallon. Since 2006, the price difference among gasoline grades has generally increased. In 2021, the national annual average price of midgrade gasoline was about 42 cents per gallon more than regular-grade gasoline, and the average price for premium-grade gasoline was about 68 cents per gallon more than regular grade.",
                                style = "font-family: 'times'"
                            ),
                            style = "margin-bottom: 0px;"
                        )
                    ),
                    box(
                        title = span(strong(
                            "Main components of the retail price of gasoline:"
                        ), style = "font-family: 'times'; font-size: 20px"),
                        solidHeader = TRUE,
                        width = 12,
                        fluidRow(
                            box(
                                title = span(strong("Crude Oil"), style = "font-family: 'times'; font-size: 20px"),
                                solidHeader = TRUE,
                                width = 3,
                                height = 850,
                                p(
                                    h4(
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        "The cost of crude oil is the largest component of the retail price of gasoline, and the cost of crude oil as a share of the retail gasoline price varies over time and across regions of the country. Many factors affect crude oil prices; learn about seven major factors that influence crude oil prices in What Drives Crude Oil Prices? Increases in U.S. oil production in the past several years have helped reduce upward pressure on oil and gasoline prices.",
                                        style = "font-family: 'times'"
                                    ),
                                    style = "margin-bottom: 0px;"
                                )
                            ),
                            box(
                                title = span(strong("Refining Cost"), style = "font-family: 'times'; font-size: 20px"),
                                solidHeader = TRUE,
                                width = 3,
                                height = 850,
                                p(
                                    h4(
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        "Refining costs and profits vary seasonally and by region in the United States, partly because of the different gasoline formulations required to reduce air pollution in different parts of the country. The characteristics of the gasoline produced depend on the type of crude oil that is used and the type of processing technology available at the refinery where it is produced. Gasoline prices are also affected by the cost of other ingredients that may be blended into the gasoline, including fuel ethanol. Gasoline demand usually increases in the summer, which generally results in higher prices.",
                                        style = "font-family: 'times'"
                                    ),
                                    style = "margin-bottom: 0px;"
                                )
                            ),
                            box(
                                title = span(strong("Distribution & Marketing"), style = "font-family: 'times'; font-size: 20px"),
                                solidHeader = TRUE,
                                width = 3,
                                height = 850,
                                p(
                                    h4(
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        "Distribution, marketing, and retail dealer costs and profits are also included in the retail price of gasoline. Most gasoline is shipped from refineries by pipeline to terminals near consuming areas, where it may be blended with other products —such as fuel ethanol—to meet local government and market specifications. Gasoline is delivered by tanker truck to individual gasoline stations.",
                                        style = "font-family: 'times'"
                                    ),
                                    style = "margin-bottom: 0px;"
                                ),
                                p(
                                    h4(
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        "Some retail outlets are owned and operated by refiners, while others are independent businesses that purchase gasoline from refiners and marketers for resale to the public. The price at the pump also reflects local market conditions and factors, such as the fueling location and the marketing strategy of the owner.",
                                        style = "font-family: 'times'"
                                    ),
                                    style = "margin-bottom: 0px;"
                                ),
                                p(
                                    h4(
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        "The cost of doing business by individual gasoline retailers can vary greatly depending on where a gasoline fueling station is located. These costs include wages and salaries, benefits, equipment, lease or rent payments, insurance, overhead, and state and local fees. Even retail stations close to each other can have different traffic patterns, rent, and sources of supply that affect their prices. The number and location of local competitors can also affect prices.",
                                        style = "font-family: 'times'"
                                    ),
                                    style = "margin-bottom: 0px;"
                                )
                            ),
                            box(
                                title = span(strong("Taxes"), style = "font-family: 'times'; font-size: 20px"),
                                solidHeader = TRUE,
                                width = 3,
                                height = 850,
                                p(
                                    h4( 
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        HTML('&nbsp;'),
                                        "Federal, state, and local government taxes also contribute to the retail price of gasoline. The federal tax on motor gasoline is 18.40 cents per gallon, which includes an excise tax of 18.30 cents per gallon and the federal Leaking Underground Storage Tank fee of 0.1 cents per gallon. As of January 1, 2022, total state taxes and fees on gasoline averaged 31.02 cents per gallon. Sales taxes along with taxes applied by local and municipal governments can have a significant impact on the price of gasoline in some locations.",
                                        style = "font-family: 'times'"
                                    ),
                                    style = "margin-bottom: 0px;"
                                )
                            )
                        )
                    ),
                    box(
                        title = span(strong("Why is gas price so high today?"), style = "font-family: 'times'; font-size: 20px"),
                        solidHeader = TRUE,
                        width = 12,
                        p(
                            h4(
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                "High demand for crude oil and low supply are pushing gas prices upward. And though the Federal Reserve has raised interest rates three times so far this year—and is planning on more raises in the near future to eventually nudge prices back down—there are other factors at play internationally.",
                                style = "font-family: 'times'"
                            ),
                            style = "margin-bottom: 0px;"
                        ),
                        p(
                            h4(
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                "Crude oil has seen dramatic changes to its supply throughout the pandemic. When Covid-19 first hit worldwide, and fewer people were on the roads, major oil-producing companies cut back on their oil production.",
                                style = "font-family: 'times'"
                            ),
                            style = "margin-bottom: 0px;"
                        ),
                        p(
                            h4(
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                "In April 2021, the Colonial Pipeline, the nation’s biggest fuel pipeline, was the target of a cyberattack that forced it offline for six days. The shutdown led to gas shortages nationwide, and pushed average prices above $3 before Memorial Day 2021, when they were expected to rise. A breach and spill in a key pipeline that supplies fuel to the southeast occurred on Oct. 1, and repairs were slowed by heavy rain and flooding.",
                                style = "font-family: 'times'"
                            ),
                            style = "margin-bottom: 0px;"
                        ),
                        p(
                            h4(
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                "The war in Ukraine is being cited as a compounding factor in these issues. Russia, which produces about 10% of the world’s oil supply, is being sanctioned due to its invasion of Ukraine. The United States has completely banned Russian oil imports, which also means what remains of the global supply is also being squeezed.",
                                style = "font-family: 'times'"
                            ),
                            style = "margin-bottom: 0px;"
                        ),
                        p(
                            h4(
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                "The Organization of the Petroleum Exporting Countries (OPEC), an alliance of oil-producing countries, vowed to increase production this summer—but has already missed its target. Oil output in June from the organization actually declined from projections due to disruptions in Nigeria and Libya.",
                                style = "font-family: 'times'"
                            ),
                            style = "margin-bottom: 0px;"
                        ),
                        p(
                            h4(
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                "The combined consequences of these scenarios mean states all over the country are seeing sky-high gas prices. For example, California’s average gas price per gallon is $6.22, and Illinois’ price currently sits at $5.27.",
                                style = "font-family: 'times'"
                            ),
                            style = "margin-bottom: 0px;"
                        )
                    ),
                    box(
                        title = span(strong("References"), style = "font-family: 'times'; font-size: 20px"),
                        solidHeader = TRUE,
                        width = 12,
                        p(
                            h4(
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                tags$a(
                                    em(
                                        "https://www.eia.gov/energyexplained/gasoline/factors-affecting-gasoline-prices.php"
                                    ),
                                    href = "https://www.eia.gov/energyexplained/gasoline/factors-affecting-gasoline-prices.php"
                                ),
                                style = "font-family: 'times'"
                            ),
                            style = "margin-bottom: 0px;"
                        ),
                        p(
                            h4(
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                HTML('&nbsp;'),
                                tags$a(
                                    em(
                                        "https://www.forbes.com/advisor/personal-finance/how-to-save-money-on-gas/"
                                    ),
                                    href = "https://www.forbes.com/advisor/personal-finance/how-to-save-money-on-gas/"
                                ),
                                style = "font-family: 'times'"
                            ),
                            style = "margin-bottom: 0px;"
                        )
                    ),
                )),
        tabItem(
            tabName = "price",
            wellPanel(
                h1(
                    strong("Price Visualization"),
                    style = "font-family: 'times'",
                    align = "center"
                ),
                style = "background: white"
            ),
            tabsetPanel(
                tabPanel(
                    h4("Price Breakdown", style = "font-family: 'times'", align = "center"),
                    br(),
                    fluidRow(
                      column(
                        12,
                        plotlyOutput("plot1")
                      ),
                    ),
                    h6("There are negative records on the original data, hence, there will be some points exceed 100% and below 0%. The reason of the appearance of the negative record is that there is profit counted into the mkt category in the raw data.",style = "font-family: 'times'"),
                    tags$hr(style = "border-color: white;"),
                    sliderInput(
                    "breakdown_date",
                    "Choose a Date",
                    min = as.Date("1999/01/04", "%Y/%m/%d"),
                    max = as.Date("2022/06/27", "%Y/%m/%d"),
                    step = 7,
                    value = as.Date("2011/06/06"),
                    timeFormat = "%Y/%m/%d",
                     ),
                    plotOutput("plot2")
                ),
                tabPanel(
                    h4("Price Change", style = "font-family: 'times'", align = "center"),
                    fluidRow(
                        column(
                            6,
                            checkboxInput(
                                "Event",
                                "Check for big events",
                                FALSE
                            )
                        ),
                        column(
                            6,
                            checkboxGroupInput(
                                "category",
                                "Choose one or multiple oil",
                                choices = c("Regular", "Midgrade", "Premium"),selected = c("Regular", "Midgrade", "Premium")
                            )
                        )
                    ),
                    plotlyOutput("plot3") #leaflet
                ),
                tabPanel(
                    h4("Price Distribution", style = "font-family: 'times'", align = "center"),
                    
                    sliderInput(
                      "distribution_date",
                      "Date",
                      min = as.Date("1992/05/11", "%Y/%m/%d"),
                      max = as.Date("2022/06/30", "%Y/%m/%d"),
                      step = 7,
                      value = as.Date("2005/03/01"),
                      timeFormat = "%Y/%m/%d",
                      animate = animationOptions(interval = 50, loop = FALSE)
                    ),
                    
                    plotlyOutput("plot4")
                ),
            )
            
            
            
        ),
        tabItem(
            tabName = "cloud",
            wellPanel(
                h1(strong("Wordcloud"),
                   style = "font-family: 'times'",
                   align = "center"),
                style = "background: white"
            ),
            fluidRow(
                column(8,
                       plotOutput("plot5")),
                column(
                    4,
                    sliderInput(
                        "slider_number",
                        "Number of words",
                        min = 5,
                        max = 40,
                        value = 20
                    ),
                    br(),
                    h5(strong("Orange Color = Positive Sentiment"), style = "color: orange"),
                    h5(strong("Blue Color = Negative Sentiment"), style = "color: blue")
                )
            )
            
        ),
        tabItem(
            tabName = "data",
            tabItem(tabName = "data_reference",
                    wellPanel(
                        h1(strong("Data Tables"), style = "font-family: 'times'", align = "center")
                    ),
                    tabsetPanel(
                        tabPanel(
                            h4("Price Change", style = "font-family: 'times'", align = "center"),
                            dataTableOutput("change_table")
                        ),
                        tabPanel(
                            h4("Price breakdown", style = "font-family: 'times'", align = "center"),
            
                            dataTableOutput("breakdowntable")
                        ),
                        tabPanel(
                          h4("Price Distribution", style = "font-family: 'times'", align = "center"),
                          
                          dataTableOutput("distributiontable")
                        ),
                        tabPanel(
                          h4("Big Events", style = "font-family: 'times'", align = "center"),
                          
                          dataTableOutput("eventable")
                        ),
                        tabPanel(
                          h4("Twitter Data", style = "font-family: 'times'", align = "center"),
                          
                          dataTableOutput("twittertable")
                        )
                       
                    )),
        )
    )),
    strong(tags$head(tags$style(
        HTML('* {font-family: "times"};')
    )))
)


server <- function(input, output, session) {
    ## data cleaning for price breakdown
  
  breakdown = read_csv("Gasoline Price Breakdown and Margins.csv")
  breakdown$Date <- as.Date(breakdown$Date, format="%m/%d/%Y")
  breakdown["Crude_Oil"] <- breakdown[2]/breakdown[7]
  breakdown["State_Storage"] <- breakdown[3]/breakdown[7]
  breakdown["Refining"] <- breakdown[4]/breakdown[7]
  breakdown["Market"] <- breakdown[5]/breakdown[7]
  breakdown["Taxes"] <- breakdown[6]/breakdown[7]
  breakdown<- breakdown[-c(2:7)]
  
  bd<- breakdown %>% pivot_longer(cols = 2:6,names_to = "Type",values_to = "Percentage")
  
    ## data cleaning for price change
    price_change = read_csv("oil price change.csv")
    price_change$Date <- as.Date(price_change$Date, format ="%Y/%m/%d")
  
    event = read_csv("big event.csv")
    event$Date <- as.Date(event$Date, format ="%m/%d/%y")
    names(price_change)[names(price_change) == 'Regular Conventional'] <- 'Regular_Conventional'
    names(price_change)[names(price_change) == 'Midgrade Conventional'] <- 'Midgrade_Conventional'
    names(price_change)[names(price_change) == 'Premium Conventional'] <- 'Premium_Conventional'
    colnames(price_change)[2:4]= c("Regular", "Midgrade",  "Premium")
    price_change_long = price_change %>%
      pivot_longer(cols = 2:4,names_to = "type",values_to = "price")
    price_with_event = left_join(price_change_long,event,by="Date")
    data_subset = price_with_event %>% filter(!is.na(Big_Events.y),type == "Midgrade")
    data_subset = data_subset[-c(3)]
    
    ## data cleaning for price distribution
    df <- read_csv("Regular Conventional.csv")
    
    df <- df[-c(1,2),c(1,4:17)]
    colnames(df) <- c("Date", "NewEngland", "CentralAtlantic", "LowerAtlantic", "Midwest", "GulfCoast", "RockyMountain", "WestCoast", "CO", "FL", "NY", "MN", "OH", "TX", "WA" )
    df$Date <- df$Date %>% as.Date("%b %d, %Y")
    
    # convert PADD to states and get rid of PADD
    df['OR'] <- df$WestCoast
    df['CA'] <- df$WestCoast
    df['NV'] <- df$WestCoast
    df['AZ'] <- df$WestCoast
    df['AK'] <- df$WestCoast
    df['HI'] <- df$WestCoast
    df['MT'] <- df$RockyMountain
    df['ID'] <- df$RockyMountain
    df['UT'] <- df$RockyMountain
    df['WY'] <- df$RockyMountain
    df['NM'] <- df$GulfCoast
    df['AR'] <- df$GulfCoast
    df['LA'] <- df$GulfCoast
    df['MS'] <- df$GulfCoast
    df['AL'] <- df$GulfCoast
    df['ND'] <- df$Midwest
    df['SD'] <- df$Midwest
    df['NE'] <- df$Midwest
    df['KS'] <- df$Midwest
    df['OK'] <- df$Midwest
    df['IA'] <- df$Midwest
    df['MO'] <- df$Midwest
    df['WI'] <- df$Midwest
    df['IL'] <- df$Midwest
    df['MI'] <- df$Midwest
    df['IN'] <- df$Midwest
    df['KY'] <- df$Midwest
    df['TN'] <- df$Midwest
    df['GA'] <- df$LowerAtlantic
    df['SC'] <- df$LowerAtlantic
    df['NC'] <- df$LowerAtlantic
    df['VA'] <- df$LowerAtlantic
    df['WV'] <- df$LowerAtlantic
    df['PA'] <- df$CentralAtlantic
    df['NJ'] <- df$CentralAtlantic
    df['MD'] <- df$CentralAtlantic
    df['DE'] <- df$CentralAtlantic
    df['RI'] <- df$NewEngland
    df['CT'] <- df$NewEngland
    df['MA'] <- df$NewEngland
    df['NH'] <- df$NewEngland
    df['VT'] <- df$NewEngland
    df['ME'] <- df$NewEngland
    df1 <- df[,c(1,9:58)]
    
    #df1[,2:51] <- df1[,order(colnames(df1[2:51]))]
    
    # transpose data
    df_final <- df1 %>%
      pivot_longer(cols=2:51, names_to="State",values_to="Price")
    df_final[,3] <- as.data.frame(apply(df_final[,3], 2, as.numeric))
    
    ## dataset for twitter
    rt_subset <- read_csv("tweets.csv")
    

    
    
    observeEvent(input$intro_content, {
      updateNavbarPage(session, "navbar",
                       selected = "mytab2") 
    })
    
    output$plot1 = renderPlotly({
      ggplot(bd, aes(Date, y=Percentage, group=Type,fill = Type))+ 
        scale_fill_brewer(palette="Set3") + 
        theme_minimal() + 
        labs(y = "Percentage of the Total Price",x="Year", fill = "Compositions in Gasoline Price")+
        ggtitle("The Unstable Distribution of Gasoline Price Margins")+
        scale_y_continuous(labels = percent)+
        geom_area(alpha=0.7 , size=.7)
    })
    
    output$plot2 = renderPlot({
      bd_date <- bd %>% filter(Date==input$breakdown_date)
      ggplot(bd_date,aes(x="", y=Percentage, fill=Type))+ 
        geom_bar(stat="identity", width=1) + coord_polar("y", start=0)+
        scale_fill_brewer(palette="Set3")+
        theme_minimal()+
        ggtitle("Detailed Breakdown for a Specific Date")
    })
    
    output$plot3 = renderPlotly({
    
      if (length(input$category) == 0) {
        return()
      }

        f <- price_with_event %>%
          filter(type %in% input$category) %>%
          ggplot(aes(x = Date, color=type)) +
          geom_line(aes(y = price)) +
          labs(
            title = "Gas Price Increased Over Time",
            color = "Types",
            x = "Year",
            y = "Price (Dollars per Gallon)"
          ) +
          #scale_color_manual(
          #  labels =
           #   "Regular_Conventional",
           # values = "green"
          #) +
          theme_bw() +
          scale_y_continuous(
            labels = function(x)
              format(x, nsmall = 3)) +
          scale_x_date(breaks = seq.Date(from = as.Date("1994-01-01"),
                                         to = as.Date("2022-06-30"), by = "year"),
                       labels = as.character(seq(1994, 2022, 1))) +
          theme(axis.text.x = element_text(angle = 45, hjust = 1))
        
        if(input$Event){
          f = f + geom_point(data= data_subset,
                             aes(x=Date, y=price,text = paste("Event:", Name)),
                             size=10,color="black",alpha = 0.3)
        }

      return(ggplotly(f))
      
    })
    
    output$plot4 = renderPlotly({
      
      df_date <- df_final %>% 
        filter(Date==input$distribution_date)
      
        map <- plot_geo(df_date, 
                        locationmode = "USA-states") %>%
            add_trace(locations = ~State,
                    z = ~Price,
                    color = ~Price,
                    colorscale = "Red") %>% 
            layout(geo = list(scope = "usa"),
                title = "West Coast Gasoline Price is Generally More Expensive")
      
        return(ggplotly(map))
      
    })
    
    output$plot5 = renderPlot({
      # Find the frequency of each word and store it on dataframe d
      v <- rt_subset$text %>% 
        VectorSource %>% 
        Corpus %>% 
        TermDocumentMatrix %>%
        as.matrix %>%
        rowSums  %>%
        sort(decreasing=TRUE)
      d <- data.frame(word = names(v),freq=v, 
                      stringsAsFactors = FALSE)
      
      head(d,20)
      
      ###Visualize dataframe d with wordcloud package
      minFreq=1
      maxWords=input$slider_number
      frequency=d$freq
      frequency=round(sqrt(d$freq),0)
      
      
      ### Let's come back and edit the raw tweets 
      myWords=c("can", "just", 
                "one", "think", 
                "like", "get", 
                "see", "will")
      v <- rt_subset$text %>% 
        VectorSource %>% 
        Corpus %>% 
        # Convert the text to lower case
        tm_map(content_transformer(tolower)) %>%
        # Remove numbers
        tm_map(removeNumbers) %>%
        # Remove english common stopwords
        tm_map(removeWords, stopwords("english")) %>%
        # Remove your own stop word 
        # specify your stopwords as a character vector
        tm_map(removeWords, myWords) %>% 
        # Remove punctuations
        tm_map(removePunctuation) %>% 
        # Eliminate extra white spaces
        tm_map(stripWhitespace) %>%
        # Text stemming
        tm_map(stemDocument) %>%
        TermDocumentMatrix %>%
        as.matrix %>%
        rowSums %>%
        sort(decreasing=TRUE) 
      
      d <- data.frame(word = names(v),freq=v, 
                      stringsAsFactors = FALSE)
      
      
      ### How about coloring each word based the its Sentiment
      sentiments= get_sentiment(d$word)
      NNWords = d %>% 
        mutate(sentRes=sentiments) %>%
        filter(sentRes!=0) %>%
        mutate(color=case_when(sentRes<0~"blue", sentRes>0 ~ "orange"))
      #set.seed(5)
      # wordcloud(words = NNWords$word, freq = NNWords$freq, min.freq = minFreq, max.words=maxWords,random.order=FALSE,
      #           colors=NNWords$color, ordered.colors=TRUE)
      
      ### We can also use transparency to show the level of sentiment
      head(NNWords, n=2)
      for (i in 1:nrow(NNWords)) {
        curRate=NNWords$sentRes[i]
        if(curRate<0){
          NNWords$color[i]=rgb(red = 0/255,
                               green = 94/255,blue = 255/255,alpha = -curRate)
        }
        else{
          NNWords$color[i]=rgb(red = 255/255,
                               green = 160/255,blue = 0/255,alpha = curRate)
        }
      }
      set.seed(5)
      wordcloud(words = NNWords$word, freq = NNWords$freq, 
                scale = c(8,1),
                min.freq = minFreq,
                max.words=maxWords,random.order=FALSE,
                colors=NNWords$color, ordered.colors=TRUE)
    })
    
    output$breakdowntable = renderDataTable({
      return(datatable(breakdown, rownames= FALSE))
    })
    output$change_table = renderDataTable({
      return(datatable(price_change, rownames= FALSE))   
    })
    output$distributiontable = renderDataTable({
      return(datatable(df, rownames= FALSE))   
    })
    output$eventable = renderDataTable({
      return(datatable(event, rownames= FALSE))   
    })
    output$twittertable = renderDataTable({
      return(datatable(rt_subset, rownames= FALSE))   
    })
    
 
}

shinyApp(ui = ui, server = server)

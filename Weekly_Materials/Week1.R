year <- 2012:2015
print(year == c(2012,2013,2014,2015))

print(paste("year[1] is", year[1])) # note the index value

print(year[-1]) # note the negative index value

mydata <- tsibble(
  year = 2012:2016,
  y = c(123,39,78,52,110),
  index = year
)
mydata

z <- tibble(
  Month = c("2019 Jan", "2019 Feb", "2019 Mar", "2019 Apr", "2019 May"),
  Observation = c(50,23,34,30,25)
)

z %>%
  mutate(Month = yearmonth(Month)) %>%
  as_tsibble(index = Month)

prison <- readr::read_csv("Datasets/prison_population.csv")
View(prison)

prison <- readr::read_csv("Datasets/prison_population.csv") %>%
  mutate(Quarter = yearquarter(date))

prison <- readr::read_csv("Datasets/prison_population.csv") %>%
  mutate(Quarter = yearquarter(date)) %>%
  select(-date)

prison <- readr::read_csv("Datasets/prison_population.csv") %>%
  mutate(Quarter = yearquarter(date)) %>%
  select(-date) %>%
  as_tsibble(
    index = Quarter,
    key = c(state, gender, legal, indigenous)
  )

#TSIBBLE OBJECTS
#pre-downloaded data set into the tsibble library
PBS

PBS %>%
  filter(ATC2 == "A10")
#Filter the data set where ATC2 column's value equals to A10(row)

PBS %>%
  filter(ATC2 == "A10") %>%
  select(Month, Concession, Type, Cost) #has been limited to these columns only

# %>% is the symbol of creating pipelines.
# here we add one more layer of filtration below:

PBS %>%
  filter(ATC2 == "A10") %>%
  select(Month, Concession, Type, Cost) %>%
  summarise(total_cost = sum(Cost))

PBS %>%
  filter(ATC2 == "A10") %>%
  select(Month, Concession, Type, Cost) %>%
  summarise(total_cost = sum(Cost)) %>%
  mutate(total_cost = total_cost / 1e6)

PBS %>%
  filter(ATC2 == "A10") %>%
  select(Month, Concession, Type, Cost) %>%
  summarise(total_cost = sum(Cost)) %>%
  mutate(total_cost = total_cost / 1e6) -> a10
a10

#TIMEPLOTS
a10 %>%
  autoplot(total_cost)

ansett %>%
  autoplot(Passengers)

ansett %>%
  filter(Class == "Economy") %>%
  autoplot(Passengers)

ansett %>%
  filter(Airports == "MEL-SYD") %>%
  autoplot(Passengers)


#TIME SERIES PATTERNS

# Trend pattern exists when there is a long-term increase or decrease
# in the data.
# Seasonal pattern exists when a series is influenced by seasonal factors
# (e.g. the quarter of the year, the month, or day of the week).
# Cyclic pattern exists when data exhibit rises and falls that are not of
# fixed period.

aus_production %>%
  filter(year(Quarter) >= 1980) %>%
  autoplot(Electricity) +
  labs(y = "GWh", title = "Australian electricity production")

aus_production %>%
  autoplot(Bricks) +
  labs(y = "million units", title = "Australian clay brick production")

View(aus_production)

aus_production %>%
  filter(year(Quarter) >= 1950) %>%
  autoplot(Tobacco) +
  labs(y= "million units", title = "Australian tobacco production")

View(us_employment)

us_employment %>%
  filter(Title == "Retail Trade", year(Month) >= 1980) %>%
  autoplot(Employed / 1e3) +
  labs(y = "Million people", title = "Retail employment, USA")
  
gafa_stock %>%
  filter(Symbol == "AMZN", year(Date) >= 2018) %>%
  autoplot(Close) +
  labs(y = "$US", title = "Amazon closing stock price")

pelt %>%
  autoplot(Lynx) +
  labs(y="Number trapped", title = "Annual Canadian Lynx Trappings")





#SEASONAL PLOTS

a10 %>% gg_season(total_cost, labels = "both") +
  labs(y = "$ million", title = "Seasonal plot: antidiabetic drug sales")

#Subseries
a10 %>%
  gg_subseries(total_cost) +
  labs(y = "$ million", title = "Subseries plot: antidiabetic drug sales")

# Quarterly

beer <- aus_production %>%
  select(Quarter, Beer) %>%
  filter(year(Quarter) >= 1992)
beer %>% autoplot(Beer)

ls()

beer %>% gg_season(Beer, labels = "right")
beer %>% gg_subseries(Beer)




#SCATTERPLOTS

vic_elec %>%
  filter(year(Time) == 2014) %>%
  autoplot(Demand) +
  labs(y = "GW",
       title = "Half-hourly electricity demand: Victoria")


Temperature Demand
vic_elec %>%
  filter(year(Time) == 2014) %>%
  autoplot(Temperature) +
  labs(
    y = "Degrees Celsius",
    title = "Half-hourly temperatures: Melbourne, Australia"
  )

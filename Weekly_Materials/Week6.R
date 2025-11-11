new_production
library(tsibble)
library(tsibbledata)
View(new_production)
aus_production
View(aus_production)
#Autocorrelation - From time series to ACF plot
aus_production %>% filter(year(Quarter) >= 1992)
new_production <- aus_production %>% filter(year(Quarter) >= 1992)
new_production %>% autoplot()
new_production %>% ACF(Beer, lag_max = 9) 
new_production %>% ACF(Beer, lag_max = 9) %>% autoplot()

data <- tibble(
  time = yearmonth("2020 Jan") + 0:9,
  value = c(3, 7, 5, 9, 12, 11, 8, 6, 4, 10)
  ) %>% as_tsibble(index = time)

data %>% autoplot(value) + 
  labs(title = "A Short Time Series",
       x = "Date", y = "Value")

#Computing the lag-1 autocorrelation

data %>% ACF(value, lag_max = 2)

#Stationary Time Series?

gafa_stock %>%
  filter(Symbol == "GOOG", year(Date) == 2018) %>%
  autoplot(Close) +
  labs(y = "Google closing stock price", x = "Day")

gafa_stock %>%
  filter(Symbol == "GOOG", year(Date) == 2018) %>%
  autoplot(difference(Close)) +
  labs(y = "Google closing stock price", x = "Day")

global_economy %>%
  filter(Country == "Algeria") %>%
  autoplot(difference(Exports)) + 
  labs(y = "% of GDP", title = "Algerian Exports")


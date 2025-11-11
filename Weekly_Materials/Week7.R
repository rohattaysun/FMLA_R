library(forecast)
library(ggplot2)
library(fpp3)

#an example for perfectly flat time series
flat_series <- rep(10,50) #in 50 observations, all results with 10

# A slightly variable time series (adds small random noise)
set.seed(123)

variable_series <- 10 +rnorm(50, mean=0, sd=1)
# mean 10, small variation

par(mfrow = c(2, 1))
plot(flat_series, type = "l", main = "Flat Time Series", ylab = "Value", col = "blue")
plot(variable_series, type = "l", main = "Variable Time Series", ylab = "Value", col = "red")


auto_flat <- auto.arima(flat_series) #ARIMA(0,0,0) - because there is no change 
auto_flat

auto_variable <- auto.arima(variable_series) #ARIMA(2,0,1) - variation
auto_variable

#Visualisation of the fitted model

# Forecast next 10 points
forecast_variable <- forecast(auto_variable, h = 10)

# Plot forecast
autoplot(forecast_variable) +
  ggtitle("ARIMA Model Forecast for Variable Series") +
  ylab("Predicted Value")


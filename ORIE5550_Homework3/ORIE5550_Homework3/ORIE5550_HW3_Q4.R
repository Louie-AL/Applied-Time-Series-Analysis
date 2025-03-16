# import library for auto.arima and forecast functions 
# install.packages("forecast")
library(forecast)

# import library for coeftest function 
#install.packages("lmtest")
library(lmtest)

file_path <- "C:\\Users\\alons\\OneDrive - Cornell University\\Cornell University\\Spring 2024\\ORIE 5550\\ORIE5550_Homework3\\sunspot.txt"

data <- read.table(file_path, header = FALSE, sep = "\t")

sunspotsTS_original = ts(data, frequency = 1)

# 4.a.
# demean series
sunspotsTS <- sunspotsTS_original - mean(sunspotsTS_original)
par(mfrow = c(1,3))
plot.ts(sunspotsTS, main = "Sunspots time series")
acf(sunspotsTS, lag.max=20, ylim=c(-1, 1), main = "Autocorrelation function")
pacf(sunspotsTS, lag.max=20, ylim=c(-1, 1), main = "Partial Autocorrelation function")

# 4.b.
auto.arima(sunspotsTS,max.p=5,max.q=5,ic="aic",allowmean = FALSE) # AIC
auto.arima(sunspotsTS,max.p=5,max.q=5,ic="bic",allowmean = FALSE) # BIC

# 4.c.
arma.model <- arima(sunspotsTS, order=c(2,0,1), include.mean = FALSE, method = "ML")
summary(arma.model) # 
coeftest(arma.model)# get p-values

# 4.d.
par(mfrow = c(1,2))
acf(arma.model$residuals, lag.max=20, ylim=c(-1, 1), main = "Residuals Autocorrelation function")
pacf(arma.model$residuals, lag.max=20, ylim=c(-1, 1), main = "Residuals Partial Autocorrelation function")

# QQ plot
qqnorm(arma.model$residuals, main = "QQ-plot of the regression residuals")
qqline(arma.model$residuals, col = "red", lwd = 2)

# Shapiro-Wilks test. Ho is normality
shapiro.test(arma.model$residuals)

#Box-Ljung test
Box.test(resid(arma.model))

# 4.e
##############
#####Hand#####
##############

# 4.f.
h = 5
arma.forecast <- predict(arma.model, h)
round(arma.forecast$pred, 3)
round(arma.forecast$se, 3)

lower <- arma.forecast$pred - (1.96 * arma.forecast$se) 
upper <- arma.forecast$pred + (1.96 * arma.forecast$se) 

forecasted_periods <- c(101:105)

par(mfrow = c(1,1))
plot(sunspotsTS, xlim=c(1,105), main = "Forecasts for the demeaned time series, horizon = 5")
lines(forecasted_periods, arma.forecast$pred, lwd = 2)
lines(forecasted_periods, lower, lty=2, lwd=2)
lines(forecasted_periods, upper, lty=2, lwd=2)







# Box-Cox test
bc = BoxCox(arma.model$residuals, lambda = seq(-2, 2, 0.1))
# import library for boxcox test 
install.packages("MASS")
library(MASS)
boxcox_result <- boxcox(arma.model)
lambda <- boxcox_result$x[which.max(boxcox_result$y)]

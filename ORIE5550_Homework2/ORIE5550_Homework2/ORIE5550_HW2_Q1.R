install.packages("itsmr")

library(itsmr)
deaths

deathsTS = ts(deaths, frequency=12)

plot.ts(deathsTS)

deathsDecomp <- decompose(deathsTS, "additive")

deathsDecomp

deathsDecompTrendSeasonal <- deathsDecomp$trend + deathsDecomp$seasonal

par(mfrow=c(2,1))
plot.ts(deathsTS,  main = "Deaths")
plot.ts(deathsDecompTrendSeasonal,  main = "Deaths: trend and seasonal components")


par(mfrow=c(2,1))
plot.ts(deathsDecomp$random,  main = "Residuals")
acf(deathsDecomp$random, lag.max = 7, 
    ylim = c(-1,1), main = "Correlogram for residuals",
    na.action = na.pass)

tt <- seq(1,72)
y <- deathsDecompTrendSeasonal

#fit regression model
results <- lm( y ~ poly(tt, 2) +
                 cos(2*tt*pi/12) + sin(2*tt*pi/12) +
                 cos(2*tt*pi/6) + sin(2*tt*pi/6) +
                 cos(2*tt*pi/4) + sin(2*tt*pi/4), data = deathsDecompTrendSeasonal)
# poly trend and sine-cos is seasonal variance, 12 yerly, 6 semester, 4 quarter

#view model summary
summary(results)

par(mfrow=c(2,1))
plot.ts(deathsDecompTrendSeasonal,  main = "Deaths: trend and seasonal components")
plot.ts(results$fitted.values,  main = "Fitted values")

par(mfrow=c(2,1))
plot.ts(deathsDecomp$random,  main = "Residuals")
acf(deathsDecomp$random, lag.max = 7, 
    ylim = c(-1,1), main = "Correlogram for residuals",
    na.action = na.pass)


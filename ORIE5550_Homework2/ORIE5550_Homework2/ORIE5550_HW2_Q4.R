install.packages("fpp3")
library("fpp3")

prices$wheat

wheatTS = ts(prices$wheat, frequency=1)


tt <- length(wheatTS)

par(mfrow=c(2,1))
plot.ts(wheatTS)
acf(wheatTS, lag.max = 30, 
    ylim = c(-1,1), main = "Correlogram for wheat time series",
    na.action = na.pass)

par(mfrow=c(3,1))
plot(y=wheatTS[2:tt], x=wheatTS[1:(tt-1)], ylab = 'Price of Wheat', xlab = '1 Year Ago Price of Wheat')
plot(y=wheatTS[3:tt], x=wheatTS[1:(tt-2)], ylab = 'Price of Wheat', xlab = '2 Years Ago Price of Wheat')
plot(y=wheatTS[4:tt], x=wheatTS[1:(tt-3)], ylab = 'Price of Wheat', xlab = '3 Years Ago Price of Wheat')

####### Q2

bank_calls

sum(bank_calls[1:24,]$Calls)

test <- c()

test <- append(test,sum(bank_calls[1:24,]$Calls))
test <- append(test,sum(bank_calls[254,]$Calls))


df <- as.data.frame(bank_calls) # transform to dataframe

#remove UTC tag
date_as_posix <- strptime(df$DateTime, format="%Y-%m-%d %H:%M:%S", tz="UTC") 
strftime(date_as_posix, format="%Y-%m-%d %H:%M", tz="UTC")

# matrix with 164 rows (days) and 7 cols (intervals)
aggregate <- matrix(0, nrow = 164, ncol = 7)

# start on day 1
day_count = 1

#start looping through the matrix starting in day 1 until day 164 
for (i in seq_along(df$DateTime)) {
  
  # if day changes, sum one to the index pointer
  if (date(df$DateTime[i]) != date(df$DateTime[i-1]) && i > 1) {
    day_count = day_count + 1
  }
  
  # Check under which interval the timestamp falls into and sum the calls
  if (hour(df$DateTime[i]) >= 7 && hour(df$DateTime[i]) < 9 ) {
    aggregate[day_count,1] = aggregate[day_count,1] + df$Calls[i]
  }
  if (hour(df$DateTime[i]) >= 9 && hour(df$DateTime[i]) < 11 ) {
    aggregate[day_count,2] = aggregate[day_count,2] + df$Calls[i]
  }
  if (hour(df$DateTime[i]) >= 11 && hour(df$DateTime[i]) < 13 ) {
    aggregate[day_count,3] = aggregate[day_count,3] + df$Calls[i]
  }
  if (hour(df$DateTime[i]) >= 13 && hour(df$DateTime[i]) < 15 ) {
    aggregate[day_count,4] = aggregate[day_count,4] + df$Calls[i]
  }
  if (hour(df$DateTime[i]) >= 15 && hour(df$DateTime[i]) < 17 ) {
    aggregate[day_count,5] = aggregate[day_count,5] + df$Calls[i]
  }
  if (hour(df$DateTime[i]) >= 17 && hour(df$DateTime[i]) < 19 ) {
    aggregate[day_count,6] = aggregate[day_count,6] + df$Calls[i]
  }
  if (hour(df$DateTime[i]) >= 19 && hour(df$DateTime[i]) <= 21 ) {
    aggregate[day_count,7] = aggregate[day_count,7] + df$Calls[i]
  }
}


print("First 50 days of each interval are plotted below.")

par(mfrow=c(3,4))
plot.ts(aggregate[0:50,1], main = "7am to 9am")
plot.ts(aggregate[0:50,2], main = "9am to 11am")
plot.ts(aggregate[0:50,3], main = "11am to 1pm")
plot.ts(aggregate[0:50,4], main = "1pm to 3pm")
plot.ts(aggregate[0:50,5], main = "3pm to 5pm")
plot.ts(aggregate[0:50,6], main = "5pm to 7pm")
plot.ts(aggregate[0:50,7], main = "7pm to 9:05pm")

print("Correlograms up to lag 40 for each interval are plotted below.")

par(mfrow=c(3,4))
acf(aggregate[,1], lag.max = 40, 
    ylim = c(-1,1), main = "Correlogram for 7am to 9am",
    na.action = na.pass)
acf(aggregate[,2], lag.max = 40, 
    ylim = c(-1,1), main = "Correlogram for 9am to 11am",
    na.action = na.pass)
acf(aggregate[,3], lag.max = 40, 
    ylim = c(-1,1), main = "Correlogram for 11am to 1pm",
    na.action = na.pass)
acf(aggregate[,4], lag.max = 40, 
    ylim = c(-1,1), main = "Correlogram for 1pm to 3pm",
    na.action = na.pass)
acf(aggregate[,5], lag.max = 40, 
    ylim = c(-1,1), main = "Correlogram for 3pm to 5pm",
    na.action = na.pass)
acf(aggregate[,6], lag.max = 40, 
    ylim = c(-1,1), main = "Correlogram for 5pm to 7pm",
    na.action = na.pass)
acf(aggregate[,7], lag.max = 40, 
    ylim = c(-1,1), main = "Correlogram for 7pm to 9:05pm",
    na.action = na.pass)


tt <- length(aggregate[,2])

par(mfrow=c(2,2))
plot(y=aggregate[2:tt,2], x=aggregate[1:(tt-1),2], ylab = 'Current call volume',
     xlab = 'Yesterdays call volume', main = "Scatterplot t and t-1")
plot(y=aggregate[3:tt,2], x=aggregate[1:(tt-2),2], ylab = 'Current call volume',
     xlab = '2 days ago call volume', main = "Scatterplot t and t-2")
plot(y=aggregate[4:tt,2], x=aggregate[1:(tt-3),2], ylab = 'Current call volume',
     xlab = '3 days ago call volume', main = "Scatterplot t and t-3")
plot(y=aggregate[5:tt,2], x=aggregate[1:(tt-4),2], ylab = 'Current call volume',
     xlab = '4 days ago call volume', main = "Scatterplot t and t-4")



#######



canadian_gas


cadgasTS = ts(canadian_gas$Volume, canadian_gas$Month, frequency=12)


tt <- length(cadgasTS)

par(mfrow=c(2,1))
plot.ts(cadgasTS)
acf(cadgasTS, lag.max = 36, 
    ylim = c(-1,1), main = "Correlogram for canadian gas time series",
    na.action = na.pass)


par(mfrow=c(2,2))
plot(y=cadgasTS[2:tt], x=cadgasTS[1:(tt-1)], ylab = 'Current Production', xlab = '1 month ago production')
plot(y=cadgasTS[3:tt], x=cadgasTS[1:(tt-2)], ylab = 'Current Production', xlab = '2 months ago production')
plot(y=cadgasTS[4:tt], x=cadgasTS[1:(tt-3)], ylab = 'Current Production', xlab = '3 months ago production')
plot(y=cadgasTS[5:tt], x=cadgasTS[1:(tt-4)], ylab = 'Current Production', xlab = ' months ago production')



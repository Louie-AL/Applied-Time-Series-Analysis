#Set working directory
setwd("/Users/alons/OneDrive - Cornell University/Cornell University/Spring 2024/ORIE 5550/ORIE5550_Homework1")
#extract data from CSV
data1 <- read.csv("ORIE5550_DataHW1.csv")
data1$Year <- as.Date(data1$Year)
data2 <- read.csv("ORIE5550_Data2HW1.csv")
data2$Date <- as.Date(data2$Date)


#transform data to Time Series
time_series_data1 <- ts(data1$Value, start = min(data1$Year), frequency = 1)
time_series_data2 <- ts(data2$Value, start = min(data2$Date), frequency = 12)

# Output the first 20 values
first_20_values1 <- head(time_series_data1, 20)
print(first_20_values1)
first_20_values2 <- head(time_series_data2, 20)
print(first_20_values2)

par(mfrow=c(2,1))
plot.ts(time_series_data1, ylab='Percentage(%)', xlab='Year', 
        main = "Percentage of female population with complete primary education (World), 1970 - 2020",
        sub = "Source: https://data.worldbank.org/indicator/SE.PRM.CMPT.FE.ZS?locations=1W&start=1973&view=chart")


plot.ts(time_series_data2, ylab='Price', xlab='Date',
        main = "Apple stock price, Jan. 2019 - Dec. 2023", 
        sub = "Source: https://finance.yahoo.com/quote/AAPL/history?period1=1548720000&period2=1706486400&interval=1mo&filter=history&frequency=1mo&includeAdjustedClose=true")


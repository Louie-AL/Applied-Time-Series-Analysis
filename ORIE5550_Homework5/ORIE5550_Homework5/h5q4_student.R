rm(list=ls())
library(fpp3)
library(perARMA)
library(partsm)

data(bank_calls)

# bank_calls$DateTime[1:24]
# bank_calls$DateTime[((7-1)*24+1):(7*24)]
# bank_calls$DateTime[c(7*24+1,7*24+2,7*24+3)]

TT <- length(bank_calls$Calls)
floor(TT/169)
floor(TT/169)*169 - TT

ts <- vector("numeric",169)
for (k in 1:169){
  
  if (k %% 7 == 0){
    ts[k] <- sum(bank_calls$Calls[((k-1)*24+1):(k*24+1)])
  }else{
    ts[k] <- sum(bank_calls$Calls[((k-1)*24+1):(k*24)])
  }
}

# 168 = 24*7
ts168 <- log(ts[1:168])
ts168 <- ts(ts168,start=c(1,1),end=c(24,7),frequency=7)
plot.ts(ts168)

# Hold out the last 7 observations
ts168_train <- ts(ts168[-c(162:168)],start=c(1,1),end=c(23,7),frequency=7)
ts168_test <- ts(ts168[c(162:168)],start=c(24,1),end=c(24,7),frequency=7)

plot.ts(ts168)
lines(ts168_train,col="red")
lines(ts168_test,col="blue")

ts168_test_demean <- ts168_test - mean(ts168_test)



# calculating and removing weekly means


# calculating and removing seasonal/periodic means


# PAR fitting:

# SAR fitting:



# In-sample performance:


# Out-of-sample performance:


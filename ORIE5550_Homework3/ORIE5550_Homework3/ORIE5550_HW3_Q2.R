# 2.b.

# Model
phi1 <- 0.7
phi2 <- -0.7 ** 2
phi3 <- 0.7 ** 3
phi4 <- -0.7 ** 4
phi5 <- 0.7 ** 5
phi6 <- -0.7 ** 6
phi7 <- 0.7 ** 7

ARMAacf(ar=c(phi1,phi2, phi3, phi4, phi5, phi6, phi7))
ar_sims <- arima.sim(list(order = c(7,0,0), ar = c(phi1,phi2, phi3, phi4, phi5, phi6, phi7) ), n = 500)
par(mfrow = c(1, 2))
plot(ar_sims, type="l")
acf(ar_sims, lag.max=20, ylim=c(-1, 1))
lines(seq(0,40),ARMAacf(ar=c(phi1,phi2, phi3, phi4, phi5, phi6, phi7),lag.max=40),lty="dashed",col="red")
lines(seq(0,40),ARMAacf(ma=c(0.7),lag.max=40),lty="dashed",col="green")



# MA(1) Model
ma_sims <- arima.sim(model= list(ma = phi1), n = 500)
par(mfrow = c(1, 2))
plot(ma_sims, type="l")
acf(ma_sims, lag.max=20, ylim=c(-1, 1))
lines(seq(0,40),ARMAacf(ar=c(phi1,phi2, phi3, phi4, phi5, phi6, phi7),lag.max=40),lty="dashed",col="red")
lines(seq(0,40),ARMAacf(ma=c(0.7),lag.max=40),lty="dashed",col="green")


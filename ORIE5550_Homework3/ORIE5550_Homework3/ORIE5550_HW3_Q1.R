# 1.c.

# Model 1
phi1_1 <- -0.2
phi2_1 <- 0.48
ARMAacf(ar=c(phi1_1,phi2_1))
ar2_1 <- arima.sim(list(order = c(2,0,0), ar = c(phi1_1,phi2_1) ), n = 200)
polyroot(c(1, -1 * phi1_1, -1 * phi2_1))
abs(polyroot(c(1, -1 * phi1_1, -1 * phi2_1)))
par(mfrow = c(1, 2))
plot(ar2_1, type="l")
acf(ar2_1, lag.max=40, ylim=c(-1, 1))
lines(seq(0,40),ARMAacf(ar=c(phi1_1,phi2_1),lag.max=40),lty="dashed",col="red")

# Model 2
phi1_2 <- -0.2
phi2_2 <- -0.48
ARMAacf(ar=c(phi1_2,phi2_2))
ar2_2 <- arima.sim(list(order = c(2,0,0), ar = c(phi1_2,phi2_2) ), n = 200)
polyroot(c(1, -1 * phi1_2, -1 * phi2_2))
abs(polyroot(c(1, -1 * phi1_2, -1 * phi2_2)))
par(mfrow = c(1, 2))
plot(ar2_2, type="l")
acf(ar2_2, lag.max=40, ylim=c(-1, 1))
lines(seq(0,40),ARMAacf(ar=c(phi1_2,phi2_2),lag.max=40),lty="dashed",col="red")

# Model 3
phi1_3 <- -1.8
phi2_3 <- -0.81
ARMAacf(ar=c(phi1_3,phi2_3))
ar2_3 <- arima.sim(list(order = c(2,0,0), ar = c(phi1_3,phi2_3) ), n = 200)
polyroot(c(1, -1 * phi1_3, -1 * phi2_3))
abs(polyroot(c(1, -1 * phi1_3, -1 * phi2_3)))
par(mfrow = c(1, 2))
plot(ar2_3, type="l")
acf(ar2_3, lag.max=40, ylim=c(-1, 1))
lines(seq(0,40),ARMAacf(ar=c(phi1_3,phi2_3),lag.max=40),lty="dashed",col="red")



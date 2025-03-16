# Set the length of the time series
length_of_series <- 100

# Create a time series Z_t with elements distributed normally
Z_t <- rnorm(length_of_series, mean = 0, sd = sqrt(2))

# Create the time series X[t] = 2*t + Z[t]
t <- 1:length_of_series
X_t <- 2 * t + Z_t

# Create two realizations of the time series X[t]
realization_X_1 <- 2 * t + rnorm(length_of_series, mean = 0, sd = sqrt(2))
realization_X_2 <- 2 * t + rnorm(length_of_series, mean = 0, sd = sqrt(2))

# Display the generated time series and realizations
print("Time Series X[t]:")
print(X_t)

print("Realization X_1:")
print(realization_X_1)

print("Realization X_2:")
print(realization_X_2)

# Calculate the mean of X_t
mean_X_t_1 <- mean(realization_X_1)
mean_X_t_2 <- mean(realization_X_2)

# Calculate the mean of X_t^2
mean_X_t_squared_1 <- mean(realization_X_1^2)
mean_X_t_squared_2 <- mean(realization_X_2^2)

# Display the results
cat("Mean of X_t:", mean_X_t_1, "\n")
cat("Mean of X_t:", mean_X_t_2, "\n")

cat("Mean of X_t^2:", mean_X_t_squared_1, "\n")
cat("Mean of X_t^2:", mean_X_t_squared_2, "\n")

Y_1 <- numeric(length_of_series)
Y_2 <- numeric(length_of_series)


# Generate the time series
for (t in 2:length_of_series) {
  Y_1[t] <- realization_X_1[t] * realization_X_1[t - 1]
  Y_2[t] <- realization_X_2[t] * realization_X_2[t - 1]
  
}

print("Time Series Y=(X[t]*X[t-1]):")
print(Y_1)
print(Y_2)
# Calculate the mean of Y
mean_Y_1 <- mean(Y_1)
mean_Y_2 <- mean(Y_2)

# Display the results
print(paste("Mean of Y_1:", mean_Y_1))
print(paste("Mean of Y_2:", mean_Y_2))

V_1 <- Y_2[2:length_of_series]
V_2 <- Y_2[1:(length_of_series - 1)]

# Calculate the correlation between V_1 and V_2
correlation_V1_V2 <- cor(V_1, V_2)
# Display the correlation
print(paste("Correlation between V_1 and V_2:", correlation_V1_V2))

# Set the length of the time series
length_of_series <- 100

# Initialize vectors to store the time series values
X_1 <- numeric(length_of_series)
Y_1 <- numeric(length_of_series)
X_2 <- numeric(length_of_series)
Y_2 <- numeric(length_of_series)
Z_1 <- numeric(length_of_series)
Z_2 <- numeric(length_of_series)


# Set the initial value of Z
Z_1[1] <- sample(c(2, -1), size = 1, prob = c(1/3, 2/3)) #realization 1 of Z[1]
Z_2[1] <- sample(c(2, -1), size = 1, prob = c(1/3, 2/3)) #realization 2 of Z[1]

# Generate the time series realizations
for (t in 2:length_of_series) {
  Z_1[t] <- sample(c(2, -1), size = 1, prob = c(1/3, 2/3))
  Z_2[t] <- sample(c(2, -1), size = 1, prob = c(1/3, 2/3))
  
  # Realization 1 of X_t and Y = X_t * X_(t-1)
  X_1[t] <- 2 * Z_1[t] + Z_1[t - 1]
  Y_1[t] <- X_1[t] * X_1[t - 1]
  
  # Realization 2 of X_t and Y = X_t * X_(t-1)
  X_2[t] <- 2 * Z_2[t] + Z_2[t - 1]
  Y_2[t] <- X_2[t] * X_2[t - 1]
  
}

# Calculate the mean of Z
mean_Z_1 <- mean(Z_1) #mean of realization 1
mean_Z_2 <- mean(Z_2) #mean of realization 2

# Calculate the mean of Z^2
mean_Z_1_squared <- mean(Z_1^2) #mean of realization 1 squared
mean_Z_2_squared <- mean(Z_2^2) #mean of realization 2 squared

# Display the results
print(paste("Mean of Z_1:", mean_Z_1))
print(paste("Mean of Z_1^2:", mean_Z_1_squared))
print(paste("Mean of Z_1:", mean_Z_2))
print(paste("Mean of Z_1^2:", mean_Z_2_squared))


# Calculate the mean of Y = X_t * X_(t-1)
mean_Y_1 <- mean(Y_1)
mean_Y_2 <- mean(Y_2)

# Display the results
print(paste("Mean of Y_1:", mean_Y_1))
print(paste("Mean of Y_2:", mean_Y_2))

# Correlations

V_11 <- X_1[2:length_of_series]
V_12 <- X_1[1:(length_of_series - 1)]

V_21 <- X_2[2:length_of_series]
V_22 <- X_2[1:(length_of_series - 1)]

# Calculate the correlation between V_1 and V_2
correlation_V1_V2_1 <- cor(V_11, V_12)
correlation_V1_V2_2 <- cor(V_21, V_22)

# Display the correlation
print(paste("Correlation between V_1 and V_2 realization 1:", correlation_V1_V2_1))
print(paste("Correlation between V_1 and V_2 realization 2:", correlation_V1_V2_2))

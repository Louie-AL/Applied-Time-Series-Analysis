# Set the parameters
mean_value <- 1
variance_value <- 4
TT <- 100
num_simulations <- 10000

# Initialize array to store values at T=100 from Monte Carlo
values_at_T_1 <- numeric(num_simulations)
values_at_T_2 <- numeric(num_simulations)

# Perform simulations
for (sim in 1:num_simulations) {
  # Generate random variable time series Z_t white noise Normal(1,4)
  Z_1_t <- rnorm(TT, mean = mean_value, sd = sqrt(variance_value))
  Z_2_t <- rnorm(TT, mean = mean_value, sd = sqrt(variance_value))
  
  # Initialize X_t with X_0 = 0 for the 2 realizations
  X_1_t <- numeric(TT)
  X_2_t <- numeric(TT)
  X_1_t[1] <- 0
  X_2_t[1] <- 0
  
  # Generate AR(1) model for both realizations
  for (t in 2:TT) {
    X_1_t[t] <- X_1_t[t-1] + Z_1_t[t]
    X_2_t[t] <- X_2_t[t-1] + Z_2_t[t]
    
  }
  
  # Store the last element of X_t in values_at_T for both realizations
  values_at_T_1[sim] <- X_1_t[TT]
  values_at_T_2[sim] <- X_2_t[TT]
  
}

# Calculate the mean of the realizations
mean_1 <- mean(values_at_T_1) #mean of realization 1
mean_2 <- mean(values_at_T_2) #mean of realization 2

# Calculate the mean of Z^2
mean_1_squared <- mean(values_at_T_1^2) #mean of realization 1 squared
mean_2_squared <- mean(values_at_T_2^2) #mean of realization 2 squared

# Display the results
print(paste("Mean of realization 1:", mean_1))
print(paste("Mean of realization 1 squared:", mean_1_squared))
print(paste("Mean of realization 2:", mean_2))
print(paste("Mean of realization 2 squared:", mean_2_squared))




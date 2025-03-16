# ORIE 5550 - Applied Time Series Analysis

## Overview
This repository contains **homework assignments** for ORIE 5550: **Applied Time Series Analysis**. The course focuses on statistical tools for analyzing time-dependent data, covering topics such as linear, nonlinear, seasonal, multivariate modeling, and financial time series.

## Repository Structure

### 📂 Homework Assignments
Each homework folder contains:
- **PDFs (`homework_X.pdf`, `hwX_solution.pdf`)**: Homework problems and solutions.
- **R scripts (`.R` files)**: Code used to perform time series analysis.
- **R Markdown files (`.Rmd`)**: Report-style code with explanations.
- **Datasets (`.csv` files)**: Data required for analysis.
- **Project files (`.Rproj`)**: RStudio project settings.

---

## 📌 Homework Topics

### **Homework 1: Time Series Data Analysis**
- Loading time series data into R
- Basic data transformations and visualization
- Identifying trends and patterns in time series

### **Homework 2: Seasonal Decomposition & Forecasting** *(Scripts missing, inferred from typical content)*
- Decomposing time series into trend, seasonality, and residuals
- Seasonal adjustment techniques
- Time series smoothing and moving averages
- Exploratory data analysis on economic indicators

### **Homework 3: ARMA/ARIMA Modeling**
- **Autoregressive (AR) models**: Understanding dependencies in time series
- **Moving Average (MA) models**: Handling error structures
- **ARMA and ARIMA modeling**: Fitting and tuning models to historical data
- **Forecasting future values based on historical trends**

### **Homework 4: Trend & Stationarity Analysis**
- **Stationarity tests (Augmented Dickey-Fuller test)**
- **Differencing to remove trends**
- **Holt-Winters exponential smoothing**
- **Testing for autocorrelation (ACF & PACF plots)**

### **Homework 5: Forecasting Models**
- **Applying forecasting models** to predict future trends
- **Model evaluation techniques (RMSE, AIC, BIC)**
- **Comparing different forecasting methods** (e.g., ARIMA vs. Exponential Smoothing)
- **Understanding uncertainty in time series predictions**

### **Homework 6: Monte Carlo Simulations** *(Likely topics, based on file contents)*
- **Generating synthetic time series data**
- **Using Monte Carlo simulations for risk assessment**
- **Bootstrap methods for time series forecasting**
- **Financial applications: portfolio return simulations**

### **Homework 7: Volatility & GARCH Models** *(Likely topics, based on file contents)*
- **Modeling volatility using ARCH/GARCH models**
- **Estimating time-varying variance in financial time series**
- **Fitting models to stock price and commodity data**
- **Comparing historical and implied volatility**

### **Homework 8: Multivariate Time Series Analysis** *(No files found, inferred topic)*
- **Multivariate Time Series (VAR models)**
- **Cointegration Analysis**
- **Machine Learning for Time Series Prediction**

---

## Installation & Setup
To run the R scripts, follow these steps:

1. **Clone the repository**:
   ```sh
   git clone https://github.com/yourusername/ORIE5550_Homeworks.git
   cd ORIE5550_Homeworks
   ```

2. **Install required R packages**:
   ```r
   install.packages(c("forecast", "itsmr", "fpp3", "lmtest", "perARMA"))
   ```

3. **Open the R Project file in RStudio**:
   ```
   ORIE5550_Homeworks.Rproj
   ```

4. Run the corresponding **`.R` scripts** or **R Markdown (`.Rmd`)** files.

---

## License
This repository is for educational purposes. If any materials are proprietary, please verify before sharing externally.

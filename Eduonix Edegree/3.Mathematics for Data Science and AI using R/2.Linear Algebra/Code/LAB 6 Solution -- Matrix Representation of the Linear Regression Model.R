# 1. Load data
### Read in data and subset to desired variables
library(tidyverse)
library(rgl)

data.00 <- read.csv("Linear Algebra/Code//Baseball2018.csv", header = TRUE, stringsAsFactors = FALSE)
data.10 <- data.00 %>%
  select(WinPct, Rdiff, ERA)
View(data.10)

# 2. Plot WinPct vs. Rdiff and WinPct vs. ERA. 
#    Of Rdiff and ERA, which appears to be more closely related to WinPct? 
#    Plot WinPct vs. Rdiff and ERA in 3-space.
plot(data.10$Rdiff, data.10$WinPct)
plot(data.10$ERA, data.10$WinPct)

### Which variable looks like the better predictor?
### Answer: Both are strong, but Rdiff is clearly stronger

# Plot all 3 variables together
plot3d(x = data.10$Rdiff, y = data.10$ERA, z = data.10$WinPct, type = 's', col = 'red')






# 3. Create the model matrices and estimate the linear regression model for WinPct 
#    as a function of Rdiff and ERA. 
#    Write the regression equation.
y <- as.matrix(data.10$WinPct)
View(y)

X <- as.matrix(cbind(rep(1,30), data.10[,2:3]))
colnames(X) <- c("x0", "x1", "x2")
View(X)

### Estimate model
B <- solve(t(X) %*% X) %*% t(X) %*% y
View(B)

# Write the linear regression equation
### Answer: y = 0.521 + 0.095*x1 - 0.005*x2 -- OR
###         WinPct = 0.521 + 0.095*Rdiff - 0.005*ERA











# 4. Calculate predicted values for the data. 
#    Plot predicted values against actuals. 
#    How accurate would you say the predictions are?
pred <- data.10 %>%
  mutate(PredictedWinPct = 0.521 + 0.095*Rdiff - 0.005*ERA)
View(pred)

# Plot
plot(pred$WinPct, pred$PredictedWinPct)  # Expect a straight line

plot3d(x = pred$Rdiff, y = pred$ERA, z = pred$WinPct, type = 's', col = 'red')
plot3d(x = pred$Rdiff, y = pred$ERA, z = pred$PredictedWinPct, type = 's', col = 'blue', add = TRUE)





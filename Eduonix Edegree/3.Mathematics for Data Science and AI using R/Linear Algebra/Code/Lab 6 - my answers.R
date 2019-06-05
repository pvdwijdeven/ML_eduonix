# Download the ‘Baseball2018.csv’ data set and load it into R. (Look up the help for the read.csv() function if needed).
library(tidyverse)
Baseball <- read.csv('Linear Algebra/Code/Baseball2018.csv', header = TRUE, sep = ",", dec=".", fill=TRUE, comment.char = "")

# Plot WinPct vs. Rdiff and WinPct vs. ERA. Of Rdiff and ERA, which appears to be more 
# closely related to WinPct? Plot WinPct vs. Rdiff and ERA in 3-space.
plot(Baseball$WinPct, Baseball$Rdiff)

plot(Baseball$WinPct, Baseball$ERA)

library(rgl)
plot3d(x = Baseball$WinPct,
       y = Baseball$Rdiff,
       z = Baseball$ERA,
       type = 's',
       col = 'red',
       xlim = c(min(Baseball$WinPct)-1,max(Baseball$WinPct)+1),
       ylim = c(min(Baseball$Rdiff)-1,max(Baseball$Rdiff)+1),
       zlim = c(min(Baseball$ERA)-1,max(Baseball$ERA)+1),
       xlab = 'WinPct',
       ylab = 'Rdiff',
       zlab = 'ERA')


# Create the model matrices and estimate the linear regression model for WinPct as a 
# function of Rdiff and ERA. Write the regression equation.
y <- as.matrix(Baseball$WinPct)
X <- cbind(rep(1,length(y)),Baseball$Rdiff,Baseball$ERA)
# y = X %*% beta + error
beta <- solve(t(X) %*% X) %*% t(X) %*% y

# Calculate predicted values for the data. Plot predicted values against actuals 
# in 2-space and 3-space. How accurate would you say the prediction is?
prediction = X %*% beta
plot(y,prediction)

library(rgl)
plot3d(x = Baseball$Rdiff, y = Baseball$ERA, z = Baseball$WinPct, type = 's', col = 'red')
plot3d(x = Baseball$Rdiff, y = Baseball$ERA, z = prediction, type = 's', col = 'blue', add = TRUE)

# Download the ‘Baseball2018.csv’ data set and load it into R. 
# (Look up the help for the read.csv() function if needed).
library(tidyverse)
Baseball <- read.csv('Linear Algebra/Code/Baseball2018.csv', header = TRUE, sep = ",", dec=".", fill=TRUE, comment.char = "")

# Plot Runs vs. HomeRun and Runs vs. H9. Of HomeRun and H9, 
# which appears to be more closely related to Runs? Plot Runs vs. HomeRun and H9 in 3-space.
plot(Baseball$Runs,Baseball$HomeRun)
plot(Baseball$Runs,Baseball$H9)

library(rgl)
plot3d(x = Baseball$Runs,
       y = Baseball$HomeRun,
       z = Baseball$H9,
       type = 's',
       col = 'red',
       xlim = c(min(Baseball$Runs)-1,max(Baseball$Runs)+1),
       ylim = c(min(Baseball$HomeRun)-1,max(Baseball$HomeRun)+1),
       zlim = c(min(Baseball$H9)-1,max(Baseball$H9)+1),
       xlab = 'Runs',
       ylab = 'HomeRuns',
       zlab = 'H9')

# Use the lm() function to estimate the linear regression model for Runs 
# as a function of HomeRun and H9. Write the regression equation. 
# Plot fitted values against actuals. How accurate would you say the predictions are?
Baseball.model <- lm(Runs ~ HomeRun + H9, data = Baseball)
summary(Baseball.model)
# equation: Runs = 5.15 +0.00928*HomeRun -0.285824*H9
plot(Baseball.model$model$Runs,Baseball.model$fitted.values)

# Calculate RMSE for the model and offer an interpretation for
# the value in the context of the problem. Does this change your 
# perception of the quality of the model predictions?
error.measures <- as.data.frame(cbind(Baseball.model$model$Runs,Baseball.model$fitted.values))
colnames(error.measures) <- c("Actuals", "Predicted.Values")
error.measures <- error.measures %>%
  mutate(error = Actuals - Predicted.Values,
         squared.error = error^2)
mean.squared.error <- mean(error.measures$squared.error)
boxplot(error.measures$squared.error)

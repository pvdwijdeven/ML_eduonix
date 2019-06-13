# 1.Open the Longley data set from the datasets package
longley.x <- longley[, 1:6]
longley.y <- longley[, "Employed"]


# 2.Plot Employed against each variable and select the 3 variables most correlated to Employed
plot(longley.x$GNP.deflator,longley.y)
plot(longley.x$GNP,longley.y)
plot(longley.x$Unemployed,longley.y)
plot(longley.x$Armed.Forces,longley.y)
plot(longley.x$Population,longley.y)
plot(longley.x$Year,longley.y)

# GNP.deFlator looks linear correlated, with less outliers and goes to the top 3.
# GNP looks linear correlated with less outliers and goes to the top 3.
# Unemployed looks quite scattered, no goed correlation expected.
# Armed.Forceslooks quite scattered, no goed correlation expected.
# Population looks linear correlated but has a bit more outliers than the top 3.
# Year looks linear correlated with less outliers and goes to the top 3.


# 3.For each variable selected in number 2, create a regression model for Employed. Select the best model.
library(tidyverse)

MSE <- function(val1,val2){
error.measures <- as.data.frame(cbind(val1, val2))
colnames(error.measures) <- c("Actuals", "Predicted.Values")
error.measures <- error.measures %>%
  mutate(error = Actuals - Predicted.Values,
         squared.error = error^2)
mean.squared.error <- mean(error.measures$squared.error)
boxplot(error.measures$squared.error)
return (mean.squared.error)
}

calculate_MSE <-function(top3.variable){
  top3.mod <- lm(longley.y ~ top3.variable)
  return (MSE(longley.y,top3.mod$fitted.values))
}

calculate_MSE(longley.x$GNP.deflator)
calculate_MSE(longley.x$GNP)
calculate_MSE(longley.x$Year)
# Both MSE and boxplot show GNP as a winner.

# Plot with prediction looks as follows:
plot(longley.x$GNP,longley.y)
lines(top3.mod1$model$`longley.x$GNP`, top3.mod1$fitted.values, col="blue")

# 4.For the champion model from number 3, create the model matrices
y <- as.matrix(longley.y) ## response
X <- as.matrix(cbind(rep(1,length(longley.y)), longley.x$GNP))

# 5.Recalculate the regression parameters and predicted values from the model matrices.
beta <- solve(t(X) %*% X) %*% t(X) %*% y
ypred <- X %*% beta

# comparing to lm model:
mod.GNP <- lm(longley.y ~ longley.x$GNP)

cat("intercept difference: " , mod.GNP$coefficients[1] - beta[1,1])
cat("altitude difference: " , mod.GNP$coefficients[2] - beta[2,1])

MSE(mod.GNP$fitted.values,ypred)

# coefficents look are really close, MSE is 0, as expected.

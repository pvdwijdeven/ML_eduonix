# ---------------------------------------------
# TOC:
# 1. Deterministic example
# 2. Stochastic example
# 3. Model error
# ---------------------------------------------
library(tidyverse)

# ---------------------------------------------
# 1. Deterministic example
# ---------------------------------------------
# Create hot dog data and plot
hot.dogs <- 0:20 # the number of hot dogs purchased
fries <- 0:20 # number of fries purchased
game.cost <- expand.grid(hot.dogs, fries)
colnames(game.cost) <- c('Hot.Dogs', 'Fries')
game.cost <- game.cost %>%
  mutate(Ticket = 20,
         Total.Cost = Ticket + 3*Hot.Dogs + 2*Fries)


### create a plot
library(rgl)
plot3d(x = game.cost$Hot.Dogs,
       y = game.cost$Fries,
       z = game.cost$Total.Cost,
       type = 'p',
       col = 'green',
       xlim = c(0,20),
       ylim = c(0,20),
       zlim = c(0,120),
       xlab = 'Hot Dogs Purchased',
       ylab = 'French Fries Purchased',
       zlab = 'Total Cost')

# Use lm() function to estimate a linear regression model
hot.dog.model <- lm(Total.Cost ~ Hot.Dogs + Fries, data = game.cost)
summary(hot.dog.model)



# ---------------------------------------------
# 2. Stochastic example
# ---------------------------------------------
View(mtcars)

### Create a plot
plot3d(x = mtcars$wt,
       y = mtcars$qsec,
       z = mtcars$mpg,
       type = 's',
       col = 'green',
       xlim = c(min(mtcars$wt)-1,max(mtcars$wt)+1),
       ylim = c(min(mtcars$qsec)-1,max(mtcars$qsec)+1),
       zlim = c(min(mtcars$mpg)-1,max(mtcars$mpg)+1),
       xlab = 'Wt',
       ylab = 'Qsec',
       zlab = 'MPG')

# Use lm() to fit a linear regression model
mpg.model <- lm(mpg ~ wt + qsec, data = mtcars)
mpg.model



# plot model vs. actuals
plot(mtcars$mpg, mpg.model$fitted.values) # want a line

plot3d(x = mtcars$wt,
       y = mtcars$qsec,
       z = mpg.model$fitted.values,
       type = 's',
       col = 'red',
       xlim = c(min(mtcars$wt)-1,max(mtcars$wt)+1),
       ylim = c(min(mtcars$qsec)-1,max(mtcars$qsec)+1),
       zlim = c(min(mtcars$mpg)-1,max(mtcars$mpg)+1),
       xlab = 'Wt',
       ylab = 'Qsec',
       zlab = 'MPG',
       add = TRUE)

# ---------------------------------------------
# 3. Model error
# ---------------------------------------------
# Different outputs
mpg.model # gives you the 'beta' vector
summary(mpg.model)


# Plot actuals vs predicted values 2D



# Calculate error measures for model
error.measures <- as.data.frame(cbind(mpg.model$model$mpg, mpg.model$fitted.values))
colnames(error.measures) <- c("Actuals", "Predicted.Values")
error.measures <- error.measures %>%
  mutate(error = Actuals - Predicted.Values,
         squared.error = error^2)




# Why square the errors?
sum(error.measures$error) ## is zero
boxplot(error.measures$error)


# mse and rmse
mean.squared.error <- mean(error.measures$squared.error)
boxplot(error.measures$squared.error)





# bring back in proportion
root.mse <- sqrt(mean.squared.error) ## estimate of the total error in the model













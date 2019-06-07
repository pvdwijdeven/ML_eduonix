# From the mtcars data set, define the model matrices for a linear 
# regression model of 𝑚𝑝𝑔 = 𝑤𝑡 + ℎ𝑝. Calculate the 𝛽 vector.
library(tidyverse)
y = as.matrix(mtcars$mpg)
X <- cbind(mtcars$wt,mtcars$hp)
# beta = (X^T * X)^-1 * X^T y

B <- solve(t(X)%*%X) %*% t(X)%*%y




# Validate that 𝛽^𝑇 𝑋^𝑇 𝑦 and 𝑦^𝑇 𝑋𝛽 evaluate to the same scalar.

sol1 <- (t(B) %*% t(X)) %*% y
sol2 <- t(y) %*% X %*% B


# Validate that 𝜕𝐿/𝜕𝛽 |_(𝛽_0, 𝛽_1,…,𝛽_𝑘 )=−2𝑋^𝑇 𝑦+2𝑋^𝑇 𝑋𝛽=0.
-2*t(X) %*% y + 2 * t(X) %*% X %*% B

# What are the dimensions of the resulting vector? Why does this make sense?
# [2] --> there are 2 variables

#   Fit the model using the 𝑙𝑚() function. 
mod1 <- lm(mpg ~ wt + hp, data = mtcars)


# Plot actuals and predicted values, as well as the residuals. 
library(rgl)

plot3d(x = mtcars$wt,
       y = mtcars$hp,
       z = mtcars$mpg,
       xlab = "wt",
       ylab = "hp",
       zlab = "mpg",
       col = 'blue',
       type = 's')
plot3d(x = mtcars$wt,
       y = mtcars$hp,
       z = mod1$fitted.values,
       xlab = "wt",
       ylab = "hp",
       zlab = "mpg",
       col = 'red',
       type = 's',
       add = TRUE)

plot(mod1$residuals)
abline(h = 0, lty = 3)

# Comment on the distribution of the residuals.



# Calculate SSE and RMSE and offer interpretations for each.
fit.stats <- as.data.frame(cbind(mtcars$mpg,mod1$fitted.values)) %>%
  rename(Actuals = V1, Predicted.Values = V2) %>%
  mutate(error = Actuals - Predicted.Values,
         squared.error = error^2)
SSE <- sum(fit.stats$squared.error)


RMSE <- sqrt(mean(fit.stats$squared.error))

# Recall the RMSE for the model 𝑚𝑝𝑔 = 𝑤𝑡 was about 2.95. 
# What does this tell you about using ℎ𝑝 as a predictor for 𝑚𝑝𝑔?


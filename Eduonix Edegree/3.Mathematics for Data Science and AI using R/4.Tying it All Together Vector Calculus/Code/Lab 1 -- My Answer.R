# Create a pair of orthogonal 2-dimensional vectors.
v1 <- c(0,1)
v2 <- c(1,0)
v1 %*% v2

# Create a pair of orthogonal 3-dimensional vectors.
v1 <- c(1,-2,3)
v2 <- c(3,0,-1)
v1 %*% v2


# Load the Baseball2018 data set.
Baseball <- read.csv('2.Linear Algebra/Code/Baseball2018.csv', header = TRUE, sep = ",", dec=".", fill=TRUE, comment.char = "")


# The variable Games is a linear combination of Wins and Losses 
# (Games = Wins + Losses). There is one more variable that is a 
# linear combination of two other variables. Find this linear 
# combination. Express it in the form 𝑣_3=𝑐_1∗𝑣_1+𝑐_2∗𝑣_2.
# Baseball$Rdiff = Baseball$Runs - Baseball$RunsAgainst


# For the variables you found in part a), fit a linear regression model 
# of 𝑊𝑖𝑛𝑃𝑐𝑡 ~ 𝑣_3 and 𝑊𝑖𝑛𝑃𝑐𝑡 ~ 𝑣_1+𝑣_2. Describe the relat
# ionship between the coefficients from each model. 
model.data <- as.data.frame(cbind(Baseball$WinPct,Baseball$Runs,Baseball$RunsAgainst,Baseball$Rdiff))
mod1 <- lm(V1 ~ V2 + V3 , data = model.data)
mod2 <- lm(V1 ~ V4 , data = model.data)
# Compare the fitted values for both models from part b) 
# and comment on the comparison.
summary(mod1)
summary(mod2)



# Assume one predictor variable can be written as a linear 
# combination of other variables. Explain in your own words why 
# it is best practice to use the single variable for modeling rather than the other variables.

# The less variables, the less errors?
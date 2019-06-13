# 1. Open the Baseball2018 data set
baseball <- read.csv('2.Linear Algebra/Code/Baseball2018.csv', header = TRUE, sep = ",", dec=".", fill=TRUE, comment.char = "")

# 2. Using SSE as the error function, run gradient descent to fit a simple linear regression model to predict 'WinPct'.
### Use Rdiff, OPS, HomeRun, and StrikeOut

# Define error function
error <- function(beta) {
  sum((X %*% beta - y)^2) # Sum of squared errors
}
# Define partials for b0 and b1
del.b0 <- function(b0, b1) {
  sum(-y + (b1*x + b0)) * (2 / length(x))
}

del.b1 <- function(b0, b1) {
  sum(x %*% (-y + (b1*x + b0))) * (2 / length(x))
}

### Set variables
y <- baseball$WinPct
x <- baseball$StrikeOut
X <- cbind(1, matrix(x)) # Add vector of 1s for the intercept term

# Initialize parameters for algorithm
b0 <- 0
b1 <- 0
alpha = 0.01
n.iter <- 500
error.history <- numeric(n.iter)
b0.history <- numeric(n.iter)
b1.history <- numeric(n.iter)

for (i in 1:n.iter) {
  b0.gradient <- del.b0(b0, b1)
  b1.gradient <- del.b1(b0, b1)
  
  b0 <- b0 - alpha*b0.gradient
  b1 <- b1 - alpha*b1.gradient
  beta <- as.matrix(c(b0, b1))
  
  error.history[i] <- error(beta)
  b0.history[i] <- b0
  b1.history[i] <- b1
  # i <- i + 1
}

# Collect results  
error.history[n.iter]
b0.history[n.iter]
b1.history[n.iter]
### Rdiff -- SSE: 0.021
### OPS -- SSE: 0.203
### HomeRun -- SSE: NA
### StrikeOut -- SSE: NA

# a) Two of these runs will not converge. 
###  Compare these data to the ones that do converge and offer a hypothesis for the lack of convergence.
# They are much larger in scale so the algorithm will not converge


# 3. Use 2) to determine the best predictor of WinPct.
### ANSWER: Rdiff



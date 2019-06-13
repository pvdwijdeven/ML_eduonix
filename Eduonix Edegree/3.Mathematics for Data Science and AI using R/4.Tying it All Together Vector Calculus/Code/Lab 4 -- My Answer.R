# Open the Baseball2018 data set.
Baseball <- read.csv('2.Linear Algebra/Code/Baseball2018.csv', header = TRUE, sep = ",", dec=".", fill=TRUE, comment.char = "")


# Using SSE as the error function, run gradient descent to fit a 
#simple linear regression model to predict ‘WinPct’. Use Rdiff, 
#OPS, HomeRun, and StrikeOut as potential input variables.
y <- Baseball$WinPct
X1 <- as.matrix(cbind(rep(1,30),Baseball$Rdiff))
X2 <- as.matrix(cbind(rep(1,30),Baseball$OPS))
X3 <- as.matrix(cbind(rep(1,30),Baseball$HomeRun))
X4 <- as.matrix(cbind(rep(1,30),Baseball$StrikeOut))

X <- X1

x <- Baseball$Rdiff
plot(x,y)

error <- function(beta) {
  sum((X %*% beta - y)^2) # Sum of squared errors
}

del.b0 <- function(b0, b1) {
  sum(-y + (b1*x + b0)) * (2 / length(x))
}

del.b1 <- function(b0, b1) {
  sum(x %*% (-y + (b1*x + b0))) * (2 / length(x))
}


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
}
# Two of these runs will not converge. Compare these data to the 
# ones that do converge and offer a hypothesis for the lack of convergence.
beta
plot(x, y)
abline(a = b0, b = b1, col = 'red')

# Convergence towards minimum error
min.error <- round(error.history[n.iter], 3) # min error of 455.455
plot(error.history)
length(which(round(error.history,3) > min.error)) # Converged around iteration 440

# Use 2) to determine the best predictor of WinPct.


#Rdiff has lowest min.error
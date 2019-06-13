# ---------------------------------------------------
# TOC:
#  1. Running the Gradient Descent Algorithm
#  2. Visualizing and Interpreting Results
# ---------------------------------------------------

library(Deriv)
library(rgl)

# ---------------------------------------------------
#  1. Running the Gradient Descent Algorithm
# ---------------------------------------------------
f <- function(x,y) (x-2)^2 + (y+3)^2
plot3d(f, xlim = c(-10,10), ylim = c(-10,10), col = 'green')

# 1. Define del.f
f.x <- Deriv(f, x = 'x') ## partial derivative wrt x
f.y <- Deriv(f, x = 'y') ## partial derivative wrt y

# 2. Intialize a starting point
x <- 0
y <- 0

### Run a loop for repeating section
alpha = 0.01
n.iter <- 500
f.history <- numeric(n.iter)
x.history <- numeric(n.iter)
y.history <- numeric(n.iter)

for (i in 1:n.iter) {
  # 3. Calculate del.f(x,y)
  x.gradient <- f.x(x=x)
  y.gradient <- f.y(y=y)
  
  # 4. Calculate new point as xnew = x - alpha*f_x(x,y) and ynew = y - alpha*f_y(x,y)
  x <- x - alpha*x.gradient
  y <- y - alpha*y.gradient
  
  # 5. Repeat until (x,y) is a critical point
  f.history[i] <- f(x,y)
  x.history[i] <- x
  y.history[i] <- y
}



# ---------------------------------------------------
#  2. Visualizing and Interpreting Results
# ---------------------------------------------------
plot(f.history)
plot(x.history, y.history)

plot3d(f, xlim = c(-5,5), ylim = c(-5,5), col = 'green')
points3d(x.history, y.history, f(x.history,y.history), col = 'red')


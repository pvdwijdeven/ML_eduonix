# Define and plot the function 𝑓(𝑥,𝑦)=𝑥^2+𝑥𝑦+𝑦^2+𝑦 for 𝑥 and 𝑦 between −10 and 10. Plot the function.
library(Deriv)
library(rgl)

f <- function(x,y) x^2 + x*y + y^2 + y
plot3d(f, xlim = c(-10,10), ylim = c(-10,10), col = 'green')

# Run gradient descent on 𝑓 to find its minimum, first using (0,0) as the initial point
#, and second using (5,5).
f.x <- Deriv(f, x = 'x') ## partial derivative wrt x
f.y <- Deriv(f, x = 'y') ## partial derivative wrt y

x <- 5.3
y <- 4.4

### Run a loop for repeating section
alpha = 0.01
n.iter <- 500
f.history <- numeric(n.iter)
x.history <- numeric(n.iter)
y.history <- numeric(n.iter)

for (i in 1:n.iter) {
  # 3. Calculate del.f(x,y)
  x.gradient <- f.x(x=x,y=y)
  y.gradient <- f.y(x=x,y=y)
  
  # 4. Calculate new point as xnew = x - alpha*f_x(x,y) and ynew = y - alpha*f_y(x,y)
  x <- x - alpha*x.gradient
  y <- y - alpha*y.gradient
  
  # 5. Repeat until (x,y) is a critical point
  f.history[i] <- f(x,y)
  x.history[i] <- x
  y.history[i] <- y
}
plot(f.history)
plot(x.history, y.history)

# Compare the number of iterations required for each run before convergence. 
# Does this make sense? What do you think this comparison?
plot3d(f, xlim = c(-5,5), ylim = c(-5,5), col = 'green')
points3d(x.history, y.history, f(x.history,y.history), col = 'red')

#   Plot the path taken by each run.


# Propose starting points that would satisfy the following criteria:
#   Take less iterations to reach convergence than the point (5,5)
# 
# 5.3 / 4.4?

# Take more iterations to reach convergence than the point (5,5)
# 2 / 2


# Take the same number of iterations to reach convergence as the point (5,5)
# -4.67 / -5.67


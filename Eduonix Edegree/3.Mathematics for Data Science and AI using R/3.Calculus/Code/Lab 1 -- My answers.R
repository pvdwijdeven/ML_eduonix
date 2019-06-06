# Define the function 𝑓(𝑥)=𝑥^3 and plot it on an appropriate interval.
f <- function(x) x^3
plot(f, from = -2, to = 2)

# Find the slope of the tangent lines to 𝑓 at 𝑥 = −1, 0, 2.
# What patterns do you notice between the values of 𝑥 and the slopes of the tangent lines?
fd <- function(x) 3*x^2
fd(-1)
fd(0)
fd(2)

#  Repeat 1-2 for 𝑓(𝑥)=𝑥^4.
f <- function(x) x^4
plot(f, from = -2, to = 2)
fd <- function(x) 4*x^3
fd(-1)
fd(0)
fd(2)


# Plot the following functions. For 𝑥 = −1, 0, 2 determine (without plotting)
# if the slopes of the tangent lines will be positive, negative, or zero.
# 𝑓(𝑥)=𝑥^5, 𝑓(𝑥)=lna(𝑥), 𝑓(𝑥)=𝑒^𝑥, 𝑓(𝑥)=1/𝑥

f <- function(x) x^5
plot(f, from = -2, to = 2)
fd <- function(x) 5*x^4
fd(-1)
fd(0)
fd(2)

f <- function(x) log(x)
plot(f, from = -2, to = 2)
fd <- function(x) 1/x
fd(-1)
fd(0)
fd(2)

f <- function(x) exp(x)
plot(f, from = -2, to = 2)
fd <- function(x) 1/x
fd(-1)
fd(0)
fd(2)
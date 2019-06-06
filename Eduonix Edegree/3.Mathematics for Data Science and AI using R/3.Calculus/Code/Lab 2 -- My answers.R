# For each function 𝑓(𝑥)=√𝑥 and 𝑓(𝑥)=𝑥, do the following:
#   Define 𝑓 and find 𝑓’. Write the closed form for 𝑓’.
# Plot 𝑓 and 𝑓’ together.
# Pick 3-5 values of 𝑥, calculate 𝑓’(𝑥), and plot the points.
# What is the slope of the tangent line to 𝑓 at each value of 𝑥 from part c?
library(Deriv)
f <- function(x) sqrt(x)
f.d <- Deriv(f)
f.d
plot(f, xlim = c(0,10), ylim = c(0,3))
plot(f.d, xlim = c(0,10), ylim = c(0,3),add = TRUE)
x=c(-4:4)
y<-c(f.d(x))
points(x = -4:4, y , col = 'red',pch=16)


f <- function(x) x
f.d <- Deriv(f)
f.d
plot(f, xlim = c(0,10), ylim = c(0,10))
abline(h=1)
x=c(0:10)
y=rep(1,11)
points(x, y , col = 'red',pch=16)

#   For 𝑓(𝑥) = 𝑥^3+ 𝑦^3,
# Find 𝑓_𝑥 and 𝑓_𝑦.
# Plot 𝑓, 𝑓_𝑥, and 𝑓_𝑦 together

f <- function(x,y) x^3 + y^3
f.dx <- Deriv(f,x='x')
f.dx
f.dy <- Deriv(f,x='y')
f.dy
library(rgl)
plot3d(f, xlim = c(-10,10), ylim = c(-10,10), col = 'blue')
plot3d(f.dx, xlim = c(-10,10), ylim = c(-10,10), type = 'p', col = 'red', add = TRUE)
plot3d(f.dy, xlim = c(-10,10), ylim = c(-10,10), col = 'green', add = TRUE)

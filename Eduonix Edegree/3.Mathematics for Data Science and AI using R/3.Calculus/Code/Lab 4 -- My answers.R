# Define and plot the function 𝑓(𝑥,𝑦)=𝑥^2+𝑥𝑦+𝑦^2+𝑦 for 𝑥 and 𝑦 between −10 and 10. 
f <- function(x,y) x^2+x*y+y^2+y

library(rgl)
plot3d(f, xlim = c(-10,10), ylim = c(-10,10))

# Find 𝑓_𝑥, 𝑓_𝑦, 𝑓_𝑥𝑥, 𝑓_𝑦𝑦, and 𝑓_𝑥𝑦. Write the closed form expression for each. 
library(Deriv)
f.x = Deriv(f, x='x')
f.x

f.y = Deriv(f, x='y')
f.y

f.xx=Deriv(f.x, x='x')
f.xx

f.yy=Deriv(f.y,x='y')
f.yy

f.xy = Deriv(f.x, x='y')
f.xy


# The critical point is at (1/3,−2/3). Verify analytically that 𝑓_𝑥 and 𝑓_𝑦 both equal 0 at that point. Verify by plotting both partials as well.
plot3d(f.x, xlim = c(-1,1), ylim = c(-1,1))
plot3d(f.y, xlim = c(-1,1), ylim = c(-1,1),add=TRUE)
f.x(1/3,-2/3)
f.y(1/3,-2/3)

library(rootSolve)

func <- function(x) c(f1 = 2*x[1]+x[2], f2 = 2*x[2] +x[1]+1)

multiroot(f = func, start = c(0,0))


# Verify (1/3,−2/3) satisfies the conditions for a local minimum by using the Second Derivative Test.

D <- f.xx(c(1/3,-2/3))*f.yy(c(1/3,-2/3)) - f.xy(c(1/3,-2/3))^2
D
f.xx
## D > 0 and f.xx > 0, so (1,3) is a local min
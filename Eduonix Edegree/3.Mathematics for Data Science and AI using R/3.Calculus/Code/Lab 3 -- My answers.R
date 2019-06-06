# Define the function 𝑓(𝑥)=𝑥^4−2𝑥^2+3 for 𝑥 between −1.5 and 1.5. Plot the function.
f <- function(x) x^4 -(2*x^2) +3
f
plot(f,xlim=c(-1.5,1.5), ylim=c(-10,10))

# From the graph, estimate all extreme values and critical points of 𝑓

# extreme values (x = -1  x=0 x = 1)
f(-1)
f(0)
f(1)
# Find the derivative of 𝑓 and plot. Does 𝑓’=0 at the critical points of 𝑓?
library(Deriv)
f.d <- Deriv(f)
f.d

plot(f.d,xlim=c(-1.5,1.5),add=TRUE)
abline(h=0)
f.d

#   Verify whether each extreme value is a max or a min by using the Second Derivative Test.
f.dd <- Deriv(f.d)
f.dd(-1)
f.dd(0)
f.dd(1)
plot(f.dd,add=TRUE, xlim=c(-1.5,1.5),col='red')

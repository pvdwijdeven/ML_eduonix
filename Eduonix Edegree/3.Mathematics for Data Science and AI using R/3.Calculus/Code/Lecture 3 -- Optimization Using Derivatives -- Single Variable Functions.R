# ---------------------------------------
# TOC:
#  1. Solving for zero
#  2. Second Derivative Test
# ---------------------------------------

# ---------------------------------------
# 1. Solving for zero 
# ---------------------------------------
library(Deriv)

## From the example
f <- function(x) -0.02*x^2 + 0.75*x
f.prime <- Deriv(f)
f.prime

plot(f, xlim = c(0,40), col = 'blue')
abline(h = 0, lty = 3)

# Does f.prime = 0 at the extreme value? YES
curve(f.prime, col = 'red', add = TRUE)


## Use uniroot() to solve for zero
uniroot(f.prime, interval = c(15,25)) # root is 18.75

## find the extreme value by plugging the critical point into f
f(18.75)



# ---------------------------------------
# 2. Second Derivative Test
# ---------------------------------------
f.prime.prime <- Deriv(f.prime)
f.prime.prime

## 2 D.T. says:
### if f'(x*) = 0 and f''(x*) > 0, then f(x*) is local min
### if f'(x*) = 0 and f''(x*) < , then f(x*) is local max
# Here, f.prime.prime = -0.04, which is always < 0, so f(18.75) is a local max




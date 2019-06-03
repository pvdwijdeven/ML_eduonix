# ---------------------------------------------
# TOC:
# 1. Scalar multiplication of matrices
# 2. Matrix addition and subtraction
# 3. Matrix multiplication
# ---------------------------------------------

# ---------------------------------------------
# 1. Scalar multiplication of matrices
# ---------------------------------------------
A <- matrix(c(-1,2,7,0), nrow = 2, ncol = 2, byrow = TRUE)
2 * A

# ---------------------------------------------
# 2. Matrix addition and subtraction
# ---------------------------------------------
A <- matrix(c(0,1,2,3), nrow = 2, byrow = TRUE)
B <- matrix(c(0,-2,-5,12), nrow = 2, byrow = TRUE)
A + B

A2 <- matrix(1:6, nrow = 2, byrow = TRUE)
A + A2

C <- matrix(c(-3,0,1,7,4,-6), nrow = 3, byrow = TRUE)
D <- matrix(c(-3,0,1,7,4,-6), nrow = 3, byrow = TRUE)
C - D


# ---------------------------------------------
# 3. Matrix multiplication
# ---------------------------------------------
A * B # is element-wise multiplication
A %*% B # is matrix multiplication (this is what you want!)

C %*% D

A %*% B
B %*% A

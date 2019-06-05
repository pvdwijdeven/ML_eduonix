# Define matrix A as a square matrix with entries of your choice.
A<-matrix(1:4,2,2,byrow=FALSE)
# Find the transpose of A.
t(A)
# Find the inverse of A, if it exists. If it does not exist, define a new matrix A that is invertible.
solve(A)
# Multiply A by its inverse. Before doing so, what is the expected result?
diag(2)
A%*%solve(A)
  
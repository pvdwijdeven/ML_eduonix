# Define two matrices. Let A be 3 x 4, filled row-wise with the numbers 1-12. Let B be 4 x 2, filled column-wise with the numbers 1-8.
A <- matrix(1:12,3,4, byrow = TRUE)
B <- matrix(1:8,4,2,byrow = FALSE)

# Explain why A and B cannot be added or subtracted.
# You can only add or substract matrices of the same dimensions


# Create a matrix C that can be added to A. Perform the addition.
C <- matrix(12:1,3,4,byrow = TRUE)
A+C

# Find AB. Before multiplying in R, anticipate the dimensions of the product, and multiply by hand.
A %*% B

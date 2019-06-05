# Create a 3 x 4 matrix, 𝐴, and fill it row-wise with the numbers 1-12. What is 𝑎_24?
A <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
A[2,4]

# Create two 1 x 2 vectors, v1 and v2, with numeric entries of your choice. Plot v1 and v2 on the same coordinate plane.
v1=c(1,2)
v2=c(4,0.5)
plot(v1[1], v1[2], type = 'p', col = 'red',
     xlim = c(0,5), ylim = c(0,5),
     xlab = "", ylab = "")
points(v2[1],v2[2], col = 'blue')

# Now add 3 to the second entry in v1 and re-plot. Describe the position of the new vector in 2-space relative to v1.
v1[2]=v1[2]+3
plot(v1[1], v1[2], type = 'p', col = 'red',
     xlim = c(0,5), ylim = c(0,5),
     xlab = "", ylab = "")

# Create a 1 x 3 vector, v3, with numeric entries of your choice. Plot v3 in 3-space.
v3=c(0,2.5,5)
points3D(x=v3[1], y=v3[2], z=v3[3], col = 'red',
         xlim = c(0,5), ylim = c(0,5), zlim = c(0,5),
         phi = 0)


# Fill in the blanks: A ________ is a ________ with only one ________ or ________.
# A vector is a matrix with only one row or column.

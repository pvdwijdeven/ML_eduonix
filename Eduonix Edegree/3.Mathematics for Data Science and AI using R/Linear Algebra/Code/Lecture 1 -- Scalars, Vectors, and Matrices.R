# --------------------------------------------------------------------------------
# TOC:
# 1. Defining a vector [c(), :, seq(), rep()]
# 2. Defining a matrix [matrix(), rbind(), cbind()]
# 3. Plots in 2-D and 3-D
# --------------------------------------------------------------------------------

# ---------------------------------------------
# 1. Defining a vector [c(), :, seq(), rep()]
# ---------------------------------------------
# Using the c() function
v1 <- c(2,3,4,5)
str(v1)

# Using the ':' operator
v2 <- 2:5
str(v2)

# Using the seq() function; a long-form version of the ':' operator
v3 <- seq(from = 2, to = 5, by = 1)

# OR....
v3 <- seq(2, 5, 1)

# Using the rep() function
v4 <- rep(37, 5)


# --------------------------------------------------
# 2. Defining a matrix [matrix(), rbind(), cbind()
# --------------------------------------------------
# A matrix is just a collection of vectors

# Using the matrix() function
m1 <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = TRUE)
str(m1)

# Using rbind()
m2 <- rbind(c(1,2,3), c(4,5,6))

# Using cbind()
m3 <- cbind(c(1,4), c(2,5), c(3,6))

# ---------------------------------------------
# 3. Plots in 2-D and 3-D
# ---------------------------------------------
# Vector in 2-space
u1 <- c(2,4)
plot(u1[1], u1[2], type = 'p', col = 'red',
     xlim = c(0,5), ylim = c(0,5),
     xlab = "", ylab = "")
arrows(x0 = 0, y0 = 0, x1 = u1[1], y1=u1[2], lwd = 2)

# Vector in 3-space
library(plot3D)
u2 <- c(2,3,4)
points3D(x=u2[1], y=u2[2], z=u2[3], col = 'red',
         xlim = c(0,5), ylim = c(0,5), zlim = c(0,5),
         phi = 0)
arrows3D(x0 = 0, y0 = 0, z0 = 0, x1 = u2[1], y1 = u2[2], z1 = u2[3], lwd = 2, add = TRUE)
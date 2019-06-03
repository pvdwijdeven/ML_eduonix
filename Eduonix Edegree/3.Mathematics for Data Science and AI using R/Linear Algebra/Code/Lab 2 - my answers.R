# Multiply vector 𝑣1, where 𝑣1=[3  5] , by -3. What is the result?

v1=c(3,5)
-3*v1

# Add 𝑣2 to 𝑣1, where 𝑣2=[4  2]. What is the result?
v2=c(4,2)
v1+v2

# What is the sum of 𝑣2 and twice 𝑣1?
v2+2*v1

# Plot 𝑣1 and 𝑣2, along with their sum, 𝑣1+𝑣2.
vecplot_2d <- function(vec, xax, yax, color) {
  plot(vec[1], vec[2], type = 'p', col = color,
       xlim = xax, ylim = yax,
       xlab = "", ylab = "")
  arrows(x0 = 0, y0 = 0, x1 = vec[1], y1 = vec[2], lwd = 2, col = color)
  text(x = vec[1], y = vec[2], labels = paste('(', vec[1], ',', vec[2], ')', sep = ""), 
       pos = 3)
}

vecplot_2d(v1+v2,c(0,10),c(0,10),"blue")
arrows(x0=0,y0=0,x1=v1[1],y1=v1[2],lwd=2,col='red')
arrows(x0=v1[1],y0=v1[2],x1=v1[1]+v2[1],y1=v1[2]+v2[2],lwd=2,col='green')
  
# Add 𝑣3=[0  4  3] and 𝑣4=[4  7  5]. What is the result?
v3=c(0,4,3)
v4=c(4,7,5)
v3+v4


# Plot 𝑣3 and 𝑣4, along with their sum, 𝑣3+𝑣4. Change the perspective to get a better view of the vectors.
  
library(plot3D)
vec.add.plot_3d <- function(vec1, vec2, xax, yax, zax, phi, theta) {
  points3D(x = vec1[1], y = vec1[2], z = vec1[3], col = 'red',
           xlim = xax, ylim = yax, zlim = zax,
           xlab = "x", ylab = "y", zlab = "z",
           phi = phi,
           theta = theta)
  text3D(x = vec1[1], y = vec1[2], z = vec1[3]+0.25,
         labels = paste("(",vec1[1],",",vec1[2],",",vec1[3],")", sep=""), add = TRUE)
  arrows3D(x0=0, y0=0, z0=0, x1=vec1[1], y1=vec1[2], z1=vec1[3], lwd = 2, col = 'blue', 
           add = TRUE)
  
  points3D(x = vec1[1]+vec2[1], y = vec1[2]+vec2[2], z = vec1[3]+vec2[3], col = 'green',
           xlim = xax, ylim = yax, zlim = zax,
           xlab = "x", ylab = "y", zlab = "z",
           add = TRUE)
  arrows3D(x0=vec1[1], y0=vec1[2], z0=vec1[3], x1=vec1[1]+vec2[1], y1=vec1[2]+vec2[2], 
           z1=vec1[3]+vec2[3], lwd = 2, col = 'red', add = TRUE)
  
  vec3 <- vec1 + vec2
  points3D(x = vec3[1], y = vec3[2], z = vec3[3], col = 'red',
           xlim = xax, ylim = yax, zlim = zax,
           xlab = "x", ylab = "y", zlab = "z",
           add = TRUE)
  text3D(x = vec3[1], y = vec3[2], z = vec3[3],
         labels = paste("(",vec3[1],",",vec3[2],",",vec3[3],")", sep=""), add = TRUE)
  arrows3D(x0=0, y0=0, z0=0, x1=vec3[1], y1=vec3[2], z1=vec3[3], lwd = 2, col = 'green', 
           add = TRUE)
}
vec.add.plot_3d(vec1=v3, vec2=v4, xax=c(0,15), yax=c(0,15), zax=c(0,15),
                phi = 10, theta = 70)


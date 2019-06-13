# Load the Baseball2018 data set and retain Runs, RunsAgainst, and Rdiff.
Baseball <- read.csv('2.Linear Algebra/Code/Baseball2018.csv', header = TRUE, sep = ",", dec=".", fill=TRUE, comment.char = "")
mod1 <- cbind(Baseball$Runs,Baseball$RunsAgainst,Baseball$Rdiff)


# Create the covariance matrix. Explain what each entry means.
round(cov(mod1), 2)


# Create the eigen decomposition for the data set. 
# How many eigenvectors are needed to account for almost all variation in the data?
eigen(cov(mod1))
#2
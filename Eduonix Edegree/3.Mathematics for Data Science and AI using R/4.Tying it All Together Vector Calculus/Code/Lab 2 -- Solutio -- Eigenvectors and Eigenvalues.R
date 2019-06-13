# 1. Load the Baseball2018 data set and retain Runs, RunsAgainst, and Rdiff.
library(tidyverse)

baseball <- read.csv('2.Linear Algebra/Code/Baseball2018.csv', header = TRUE, sep = ",", dec=".", fill=TRUE, comment.char = "")
baseball <- baseball %>%
  select(Runs, RunsAgainst, Rdiff)


# 2. Create the covariance matrix. Explain what each entry means.
cov.baseball <- cov(baseball)
cov.baseball
### The diagonal entries show the amount of variation in the individual variables.
### The off-diagonal entries show the amount of vartiation between pairs of variables.



# 3. Create the eigen decomposition for the data set. 
###  How many eigenvectors are needed to account for almost all variation in the data?
eigen.baseball <- eigen(cov.baseball)
eigen.baseball
### Two eigenvectors account for almost all variation in the data
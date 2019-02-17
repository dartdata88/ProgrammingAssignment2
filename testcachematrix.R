# testcachematrix.R
#
# D. Arteche 2019
#
# written for R version 3.5.2 (2018-12-20)
#
#
# used Alan E. Berger's example matrices to test this project:
# https://www.coursera.org/learn/r-programming/discussions/weeks/3/threads/ePlO1eMdEeahzg7_4P4Vvg

source("cachematrix.R")

print(" Basic matrices to work with:")
m1 <- matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)
m1
I2 = diag(2)
n1hc <- matrix(c(6,2,8,4), nrow = 2, ncol = 2)
m1 %*% n1hc
n1hc %*% m1
n1 = solve(m1)

print()
print("Testing constructor...")
myMatrix_object <- makeCacheMatrix(m1)
print("Testing inverse calculation")
cacheSolve(myMatrix_object)
print()
print("The next cacheSolve should retrieve from the cache, not calculate:")
cacheSolve(myMatrix_object)
print("Testing set function")
n2 <- matrix(c(5/8, -1/8, -7/8, 3/8), nrow = 2, ncol = 2)
myMatrix_object$set(n2)

print("inverse should be null:")
myMatrix_object$getinverse()

print("Testing inverse calculation")
cacheSolve(myMatrix_object)
print("The next cacheSolve should retrieve from the cache, not calculate:")
cacheSolve(myMatrix_object)


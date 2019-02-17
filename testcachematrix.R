# testcachematrix.R
#
# D. Arteche 2019
#
# written for R version 3.5.2 (2018-12-20)
#
#
# used Alan E. Berger's example matrices to test this project:
# https://www.coursera.org/learn/r-programming/discussions/weeks/3/threads/ePlO1eMdEeahzg7_4P4Vvg
# Thanks, Alan!
source("cachematrix.R")

writeLines("\nTest for cacheMatrix.R\n")
writeLines("Basic matrices to work with:")
m1 <- matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)
m1
I2 = diag(2)
n1hc <- matrix(c(6,2,8,4), nrow = 2, ncol = 2)
n1hc
m1 %*% n1hc
n1hc %*% m1
n1 = solve(m1)

writeLines("\n\nTesting cachematrix.R")
writeLines("Testing constructor...")
myMatrix_object <- makeCacheMatrix(m1)
myMatrix_object$get()
writeLines("Testing inverse calculation")
cacheSolve(myMatrix_object)
writeLines("!!The next cacheSolve should retrieve from the cache, not calculate:")
cacheSolve(myMatrix_object)
writeLines("\nThis should yield an identity matrix")
round(myMatrix_object$get() %*% cacheSolve(myMatrix_object))

writeLines("\nTesting set function with other matrix")
n2 <- matrix(c(5/8, -1/8, -7/8, 3/8), nrow = 2, ncol = 2)
myMatrix_object$set(n2)

writeLines("The inverse should be null:")
myMatrix_object$getinverse()

writeLines("\nTesting inverse calculation")
cacheSolve(myMatrix_object)
writeLines("!!The next cacheSolve should retrieve from the cache, not calculate:")
n2_inverse = cacheSolve(myMatrix_object)
writeLines("\nThis should yield an identity matrix")
round(n2 %*% n2_inverse)

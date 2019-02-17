# cachematrix.R
#
# D. Arteche 2019
#
# written for R version 3.5.2 (2018-12-20)
#
# makeCacheMatrix and cacheSolve are used together to 
# calculate, save, and return a cached matrix inverse.
# These functions are highly-coupled.


# makeCacheMatrix contains get and set functions for a
# numeric matrix and its inverse. It does not execute any
# calculations.
makeCacheMatrix <- function(x = matrix()) {
    # Matrix object for use in the cacheSolve function. Contains
    # get/set functions for the matrix and inverse
    #
    # Args:
    # x: A numeric matrix        
    i <- NULL
    set <- function(y){
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
        
}


# cacheSolve returns  the inverse of a matrix, x. If the inverse  
# has been calculated before, it returns a cached result. If 
# the inverse has not yet been calculated, calculates, caches, 
# and returns the inverse.
cacheSolve <- function(x, ...) {
    # Return a matrix that is the inverse of 'x'
    #
    # Args:
    # x: A numeric matrix    
    i <- x$getinverse()
    if (!is.null(i)){
        message("getting cached data")
        return (i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}

## These two functions work together to pull the cached
## inverse of a matrix, and if such cache does not exist
## calculate and store the inverse in the cache


## The makeCacheMatrix function, is a collection of functions that
## work by assigning and extracting the inverse value outside the
## current environment

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)

}


## The cacheSolve function attempts to retrieve the cached inverse matrix
## and if such cache does not exist, will calculate and set the cache value

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(m)
    inv
}

##This source file contains two functions:
## makeCacheMatrix : To return a list of functions for getting and setting the matrix and inverses
## cacheSolve : Computes and returns the inverse of the matrix if not cached

## The makeCacheMatrix returns a list containing the following functions :
## set : set the value of the Matrix
## get : get the value of the vector
## setinv : set the value of the mean
## getinv : get the value of the mean
## The <<- operator assigns the value for M and xinv 
## in the global environment so it is cached across calls 
makeCacheMatrix <- function(x = matrix()) {	
	xinv <- NULL
	set <- function(M) {
		x <<- M
		xinv <<- NULL
	}
	get <- function() x
	setinv <- function(inverse) xinv <<- inverse
	getinv <- function() xinv
	list( set = set, get = get, setinv = setinv, getinv = getinv)
}


## Takes x(a list returned by makeCacheMatrix function) 
## and computes the inverse for the matrix returned by the x$get()
## if not already computed/cached and returns that inverse
cacheSolve <- function(x, ...) {
        xinv <- x$getinv()
	if(!is.null(xinv)) {
		message("getting cached inverted matrix")
		return(xinv)
	}
	Mat <- x$get()
	xinv <- solve(Mat, ...)
	x$setinv(xinv)
	xinv  
}

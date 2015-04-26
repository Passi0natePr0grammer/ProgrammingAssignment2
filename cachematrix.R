## The following two functions cache the inverse of a matrix.

## Overview:
## Write a "modified" version of "matrix" which includes:
##      setMatrix - sets the value of the matrix 
##      getNatrix - gets the value of the matrix
##      setInvMatrix - set the value of the inverse matrix
##      getInvMatrix - get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {

        # the cached value variable intialized to 'NULL':
        cache <- NULL
        
        # make a new matrix:
        setMatrix <- function(newMatrix) {
                x <<- newMatrix
                # once we set a new value we must empty the cache:
                cache <<- NULL
        }
        
        # dump the stored matrix:
        getMatrix <- function() {
                x
        }
        
        # cache a parameter:
        setInvMatrix <- function(par) {
                cache <<- par
        }
        
        # dump the cached parameter:
        getInvMatrix <- function() {
                cache
        }
        
        # dump a list with each element being one of the previous functions:
        list(
        
                setMatrix = setMatrix,
                getMatrix = getMatrix,
                setInvMatrix = setInvMatrix,
                getInvMatrix = getInvMatrix
        
        )
        
}


## Get the inverse of a "modified matrix" using the previous function:
cacheSolve <- function(x, ...) {
 
        # retrieve the cached value:
        inv <- x $getInvMatrix()
        # first check if 'inv' is not 'NULL';
        # if so, then return its value
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        # if it is 'NULL', retrieve the matrix and find its inverse,
        # storing it in the cache:
        data <- x$getMatrix # buffer for data
        inverse <- par(data)
        x$setInvMatrix(inverse)
        
        inverse # dump the value
        
}

## These functions calculate the inverse of a matrix and store the result
## in cache to reduce the computational workload by allowing the inverse
## to be looked up if it has already been calculated

## This function creates a special "matrix" object that can cache its inverse
        ## Define the function to define the objects of type 'makeCacheMatrix'
        ## Initialize the objects 'x' as a matrix and 'm' as a NULL object 
        ## to be used for storage later in the function
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        ## Define the set function and assign its 
        ## objects to the parent environment
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        ## Define the getter function for the matrix 'x'
        get <- function() x
        ## Define the setter function for the inverse matrix
        ## assign its object to the parent environment
        setInv <- function(solve) m <<- solve
        ## Define the getter function for the inverse matrix
        getInv <- function() m
        ## Define a list that names the setters/getters
        ## and assign the corresponding value to each
        list(set = set, 
             get = get,
             setInv = setInv,
             getInv = getInv)
}


## This function computes the inverse of the special matrix type
## returned by makeCacheMatrix above. If the inverse has already 
## been calculated (and the matrix has not changed), then the 
## cachesolve should retrieve the inverse from the cache.

        ##Define the cacheSolve function and its arguments
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x' using the 
        ## getter defined in the 'makeCacheMatrix' function
        ## if the "m" matrix is populated return from cache 
        m <- x$getInv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        ## if the 'm' matrix is NULL get the matrix to find the inverse
        data <- x$get()
        ## calculate the inverse with the solve function 
        m <- solve(data, ...)
        ## Use the 'setInv" function to record the inverse result in the 'm' matrix
        x$setInv(m)
        ## return 'm'
        m
}

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  # Initialize the inverse property
  
  # Function to set the matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL  # Reset the inverse when the matrix is set
  }
  
  # Function to get the matrix
  get <- function() x
  
  # Function to set the inverse of the matrix
  setInverse <- function(inverse) inv <<- inverse
  
  # Function to get the inverse of the matrix
  getInverse <- function() inv
  
  # Return a list of the functions
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}
cacheSolve <- function(x, ...) {
  inv <- x$getInverse()  # Retrieve the cached inverse
  
  # If the inverse is already cached, return it
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  # Get the matrix from the special "matrix" object
  data <- x$get()
  
  # Compute the inverse of the matrix
  inv <- solve(data, ...)
  
  # Cache the computed inverse
  x$setInverse(inv)
  
  # Return the inverse
  inv
}

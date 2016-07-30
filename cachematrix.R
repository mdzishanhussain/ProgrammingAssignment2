## The first function, makeVector creates a special "vector", which is really a list containing a function to

## set the value of the vector
## get the value of the vector
## set the value of the mean
## get the value of the mean

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set <- function(x)
  {
    x <<- y
    m <<- NULL
  }
  get<- function() x
  setinverse <- function(inverse) m<<-inverse
  getinverse <- function() m
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}

makeCacheMatrix <- function(sample = matrix()) {
      invsample <- NULL
      set <- function(x) {
      Sample <<- x
      invsample <<- NULL
  }
  get <- function() sample
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() invsample
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

cacheSolve <- function(sample, ...) {
      inv <- sample$getInverse()
      if (!is.null(inv)) {
          message("getting cached data")
          return(invsample)
  }
      mat <- sample$get()
      invsample <- solve(mat, ...)
      sample$setInverse(invsample)
      invsample
}
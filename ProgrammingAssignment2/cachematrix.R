# The first function makeCacheMatrix:
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of the inverce
# 4. get the value of the inverce
makeCacheMatrix <- function(x = matrix()) {
t <- NULL # Stores the cached inverse matrix
set<-function(y){ # The function's setter
   x <<- y
   t<<- NULL
}
get<-function() x # The function's getter
sett <-function(inverse) t <<- inverse # Inverse setter
gett <- function() t # Inverse getter
list(set = set, get = get, sett = sett, gett = gett) # Return the matrix
}
cacheSolve <- function(x, ...) { # Computes the inverse of the matrix, or returns the cached inverse.
    t <- x$gett()
    if (!is.null(t)) { # Returns calculated inverse matrix
       message("getting cached data")
       return(t)
}
data <- x$get() # Calculates the inverse
    t <- solve(data, ...)
x$sett(t) # Cache the inverse
t # Return
}

## COURSERA R Programming Assignment 2: Caching the Inverse of a Matrix
## 
## This assignment is composed of two functions: (1) A function that creates
## a special "matrix" object that can cache its inverse, and (2) a function 
## that computes the inverse of the special "matrix". This demonstrate caching 
## as a technique that minimizes repeated computation, thus it can save time.


## Function 1:

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Function 2:

cacheSolve <- function(x, ...) {
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


## These functions test whether lexical scoping worked:

my_matrix <- makeCacheMatrix(matrix(1:4, 2,2))

my_matrix$get()

my_matrix$getInverse()

cacheSolve(my_matrix)

cacheSolve(my_matrix)

my_matrix$getInverse()

## Using alternative solution:

my_matrix$set(matrix(c(1, 2, 3, 4), 2, 2))

my_matrix$get()

my_matrix$getInverse()

cacheSolve(my_matrix)

cacheSolve(my_matrix)

my_matrix$getInverse()


> ## COURSERA R Programming Assignment 2: Caching the Inverse of a Matrix
  > ## 
  > ## This assignment is composed of two functions: (1) A function that creates
  > ## a special "matrix" object that can cache its inverse, and (2) a function 
  > ## that computes the inverse of the special "matrix". This demonstrate caching 
  > ## as a technique that minimizes repeated computation, thus it can save time.
  > 
  > 
  > ## Function 1:
  > 
  > makeCacheMatrix <- function(x = matrix()) {
    +   inv <- NULL
    +   set <- function(y) {
      +     x <<- y
      +     inv <<- NULL
      +   }
    +   get <- function() x
    +   setInverse <- function(inverse) inv <<- inverse
    +   getInverse <- function() inv
    +   list(set = set,
             +        get = get,
             +        setInverse = setInverse,
             +        getInverse = getInverse)
    + }
> 
  > 
  > ## Function 2:
  > 
  > cacheSolve <- function(x, ...) {
    +   inv <- x$getInverse()
    +   if (!is.null(inv)) {
      +     message("getting cached data")
      +     return(inv)
      +   }
    +   mat <- x$get()
    +   inv <- solve(mat, ...)
    +   x$setInverse(inv)
    +   inv
    + }
> 
  > 
  > ## These functions test whether lexical scoping worked:
  > 
  > my_matrix <- makeCacheMatrix(matrix(1:4, 2,2))
> 
  > my_matrix$get()
[,1] [,2]
[1,]    1    3
[2,]    2    4
> 
  > my_matrix$getInverse()
NULL
> 
  > cacheSolve(my_matrix)
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> 
  > cacheSolve(my_matrix)
getting cached data
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> 
  > my_matrix$getInverse()
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> 
  > ## Using alternative solution:
  > 
  > my_matrix$set(matrix(c(1, 2, 3, 4), 2, 2))
> 
  > my_matrix$get()
[,1] [,2]
[1,]    1    3
[2,]    2    4
> 
  > my_matrix$getInverse()
NULL
> 
  > cacheSolve(my_matrix)
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> 
  > cacheSolve(my_matrix)
getting cached data
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> 
  > my_matrix$getInverse()
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

 <!-- -->
 > testMatrix <- matrix(c(0, 1, 4, 1, 0, -3, 2, 3, 8), 3, 3)
 
 > aMatrix <- makeCacheMatrix(testMatrix)
 
 > aMatrix$get()
 
          [,1] [,2] [,3]  
     [1,]    0    1    2
     [2,]    1    0    3
     [3,]    4   -3    8

> aMatrix$getInv()

     NULL

> cacheSolve(aMatrix)

          [,1] [,2] [,3]
     [1,] -4.5    7 -1.5
     [2,] -2.0    4 -1.0
     [3,]  1.5   -2  0.5

> cacheSolve(aMatrix)

     getting cached data

          [,1] [,2] [,3]
     [1,] -4.5    7 -1.5
     [2,] -2.0    4 -1.0
     [3,]  1.5   -2  0.5

> aMatrix$getInv()

          [,1] [,2] [,3]
     [1,] -4.5    7 -1.5
     [2,] -2.0    4 -1.0
     [3,]  1.5   -2  0.5

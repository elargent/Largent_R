# --------------------------------------------------- #
# ------------------- Homework #5 ------------------- #
# --------------------------------------------------- #

# 1) We explore vector declarations in R. The answer to each problem 
# v1 + the letter of the particular problem. The one exception is for 
# 1.d. where the answer is tmp.

v1a <- c(1:20)
v1b <- c(20:1)
v1c <- c(1:20,19:1)
tmp <- c(4,6,3)
v1e <- rep(tmp,10)
v1f <- c(rep(tmp,10),4)
v1g <- rep(tmp,c(10,20,30))

# 2) A vector is created by taking advantage of R's pithy syntax. 
# The answer to 2 is v2. 

v2 <- exp(seq(3,6,.1))*cos(seq(3,6,.1))

# 3) Two vectors are created by taking advantage of Rs pithy syntax. 
# The answer to 3.a. is v3a, and the answer to 3.b is v3b.

v3a <- (rep(.1,34)**c(3:36))*(rep(.2,34)**c(1:34))
v3b <- (rep(2,25)**c(1:25))/c(1:25)

# 4) Two scalars are computed and this is done using for loops. 
# The answer for 4.a. is s4a, and the answer for 4.b. is s4b. 
# Note that these calculations can also be made using only vector 
# operations and the sum function. 

tmp4a <- c(10:100)
for(i in tmp4a) {
  tmp4a[i] = i**3 + 4*i**2
}
s4a = sum(tmp4a)
tmp4b <- c(1:25)
for(i in tmp4b) {
  tmp4b[i] = 2**i/i + 3**i/i**2
}
s4b = sum(tmp4b)

# 5) Two vectors are created using R's paste function. The answer 
# to 5.a. is v5a, and the answer to 5.b. is v5b.

v5a <- paste(rep("label",30),c(1:30),sep=" ")
v5b <- paste(rep("fn",30),c(1:30),sep="")

# 6) This problem has us creating creating vectors by using the xVec 
# and yVec vectors we are given. In this case, the output vectors are 
# not the same length as the input vector. The answers are labeled 
# similar to the other problems. 

set.seed(50)
xVec <- sample(0:999,250,replace=T)
yVec <- sample(0:999,250,replace=T)

v6a <- yVec[2:250] - xVec[1:249]
v6b <- sin(yVec[1:249])/cos(xVec[2:250])
v6c <- xVec[1:248]+2*xVec[2:249]-xVec[3:250]
s6d <- sum(exp(-xVec[2:250])/(xVec[1:249]+10))

# 7) This problem uses the xVec and yVec vectors created in the previous 
# problem. These lines are a bit more complex. In particular, on v7b we 
# create a vector of type boolean that indicates what points in the vector 
# are greater than 600 and then uses this boolean vector to pull values 
# from a vector where each item refers to the number of the entry in the 
# vector. Maybe the code makes more sense...

v7a <- yVec[yVec > 600]
v7b <- c(1:length(yVec))[rank(yVec)>(length(yVec)-length(yVec[yVec > 600]))]
v7c <- xVec[v7b]
v7d <- sqrt(abs(xVec-mean(xVec)))
s7e <- length(yVec[yVec>(max(xVec)-200)])
s7f <- length(yVec[yVec %% 2 == 0])
s7g <- yVec[order(xVec)]
s7h <- yVec[seq(1,250,3)]  

# 8) Creates the sum of cumulative products

s8 <- sum(cumprod(c(1,seq(2,38,2))/seq(1,39,2)))


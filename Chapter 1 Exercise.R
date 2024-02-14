# chapter 1 exercise 1
#1 
2 + 2
#2 
4*3
#3 
12-6
#4
6/3
# chapter 1 rolling a die examples
die <- 1:6
die
die * 2
die * die
die / die
# vector recycling examples
2:4
2:6
die
die + 2:4
die + 2:6
# matrix multiplication examples
die %*% die
die %o% die
# functions examples
round(2.34567)
round(2.34567, digits = 2)
factorial(6)
mean(die)
round(mean(die))
# R sample function examples
sample(x = die, size = 2)
sample(x = die, size = 4)
args(round)
args(factorial)
# sample with replacements example
sample(x = die, size = 3 , replace = TRUE)
dice <- sample (x = die, size = 3, replace = TRUE)      
dice
sum(dice)
# writing functions examples
roll <- function() {
  die <- 1:6
  dice <- sample(x = die, size = 3 , replace = TRUE)
  sum(dice)
} 
# Arguments examples
roll2 <- function(bones) {
  dice <- sample(bones, size = 2, replace = TRUE)
  sum(dice)
}
roll2(bones = 3:6)
 
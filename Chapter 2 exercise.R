# Install packages 
install.packages("ggplot2")
library("ggplot2")
qplot

# creating a scatter plot using the c function
x <- c(-2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2)
x
y <- c(-1.5, -1.1, -0.7, -0.3, 0.1, 0.5, 0.9, 1.3, 1.7)
y
qplot(x, y)

# making a histogram
x <- c(2, 3, 3, 3, 4)
qplot(x, binwidth = 1)
x2 <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4)
qplot(x2, binwidth = 1)

# chapter 2 exercise 1
x3 <- c(0, 1, 1, 2, 2, 2, 3, 3, 4)
qplot(x3, binwidth = 1)

#using histograms to check accuracy
replicate(4, 1+1)
replicate(6, roll())
rolls <- replicate(1000, roll())
qplot(rolls, binwidth = 1)

#change probabilities by adding new arguments
?sample

# exercise using sample
roll <- function(){
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE,
                 prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  sum(dice)
}
 
rolls <-replicate(10000, roll())
qplot(rolls, binwidth = 1)
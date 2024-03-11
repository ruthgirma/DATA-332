library(stringr)
library(readxl)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(skimr)
library(kableExtra)

# download and load the deck.csv file to complete the following exercises
deck <- read.csv('~/Desktop/deck.csv')

# Selecting values

head(deck)
deck[1,1]
deck[2,3]

# Indexing using positive integers

deck[1, c(1, 2, 3)]
deck[c(1, 1), c(1, 2, 3)]
deck[1:2, 1]
deck[1:2, 1, drop = FALSE]

# Indexing using other methods

deck[-(2:52), 1:3]
deck[c(-1, 1), 1] # can't use both negative and positive integers to subset an object in the same index

# Zero, Creates empty object, not very helpful 
deck[0, 0]

# Blank space, Useful to extract every value in a dimension
deck[1, ]  

# Logical values, useful to tell R which values you want to extract and which you don't
deck[1, c(TRUE, TRUE, FALSE)]

# Names
deck[4, c("face", "suit", "value")]
deck[ , "value"]

# Exercise 1, make a function that returns the first row of a df

deal <- function(cards) { cards[1, ]}
deal(deck)

# Shuffling deck, useful to rearrange the order of the cards

deck2 <- deck[1:52, ]
head(deck2)

deck3 <- deck[c(2, 1, 3:52), ]
head(deck3)

random <- sample(1:52, size = 52)
random
deck4 <- deck[random, ]
head(deck4)

# Exercise 2, write a shuffle function which takes a data frame and return a shuffled copy of the data frame

shuffle <- function(cards) {
  random <- sample(1:52, size = 52) 
  cards[random, ]
}
deal(deck)

deck2 <- shuffle(deck)

deal(deck2)

deck3 <- shuffle(deck2)
deal(deck3)

# Dollar signs and double brackets

deck2$value
mean(deck2$value)
median(deck2$value)

lst <- list(numbers = c(1, 2), logical = TRUE, strings = c("a", "b", "c"))
lst
lst$numbers
sum(lst$numbers)
 
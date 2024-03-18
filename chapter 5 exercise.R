library(stringr)
library(readxl)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(skimr)
library(kableExtra)
library(lubridate)
# download and load the deck.csv file to complete the following exercises
deck <- read.csv('~/Desktop/DATA332R /deck.csv')

# make a copy of the original file so we can manipulate it
deck2 <- deck

# changing values in place
vec <- c(0, 1, 2, 3, 4, 5)
vec
vec[1]
vec[2] <- 200
vec
vec[c(1, 3, 5)] <- c(1, 1, 1)
vec

# add new variables to the dataset
deck2$new <- 1:52
head(deck2)
deck2$new <- NULL
deck2[c(13, 26, 39, 52), ]
deck2[c(13, 26, 39, 52), 3]
deck2$value[c(13, 26, 39, 52)] <- c(14, 14, 14, 14)
head(deck2, 13)

shuffle <- function(cards) {
  random <- sample(1:52, size = 52) 
  cards[random, ]
}
deck3 <- shuffle(deck)
head(deck3)

# Logical subsetting
c(1, 2, 3) == c(3, 2, 1)
c(1, 2, 3, 4) %in% c(3, 4, 5)

# Exercise 1, extract the face column of deck2 and test whether each value is equal to ace
deck2$face
deck2$face == "ace"
sum(deck2$face == "ace")
deck3$face == "ace"
deck3$value[deck3$face == "ace"]
deck3$value[deck3$face == "ace"] <- 14
head(deck3)

# Exercise 2, assign a value to 1 of every card in deck4 that has a suit of hearts
deck4 <- deck
deck4$suit == "hearts"
deck4$value[deck4$suit == "hearts"]
deck4$value[deck4$suit == "hearts"] <- 1
deck4$value[deck4$suit == "hearts"]

# Boolean operators 
deck4$face == "queen" & deck4$suit == "spades"
queenOfSpades <- deck4$face == "queen" & deck4$suit == "spades"
deck4[queenOfSpades, ]
deck4$value[queenOfSpades]
deck4$value[queenOfSpades] <- 13
deck4[queenOfSpades, ]

# Exercise 3, convert the sentences into tests written with R
# Is w positive?
w <- c(-1, 0, 1) 
w>0
# Is x greater than 10 and less than 20?
x <- c(5, 15)
10 < x & x < 20
# Is object y the word February?
y <- "February"
y == "February"
# Is every value in z a day of the week?
z <- c("Monday", "Tuesday", "Friday")
all(z %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday",
             "Saturday", "Sunday"))

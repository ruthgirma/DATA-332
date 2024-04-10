library(stringr)
library(readxl)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(skimr)
library(kableExtra)
library(lubridate)
library(devtools)
parenvs(all = TRUE) 

# Chapter 6 

# download and load the deck.csv file to complete the following exercises
deck <- read.csv('~/Desktop/DATA332R /deck.csv')

# To access an object in a specific R environment 
head(globalenv()$deck, 3)

assign("new", "Hello Global", envir = globalenv())
globalenv()$new

# To explore R's runtime environments
show_env <- function(){ list(ran.in = environment(),
        parent = parent.env(environment()),
        objects = ls.str(environment()))
    }
show_env()
environment(show_env)
environment(parenvs)

# Exercise 1: Will R be able to find deck and return an answer when I call the new version of deal, such as deal()?
deal <- function(cards) 
  { cards[1, ]
}
deal(deck)
environment(deal)

DECK <- deck
deck <- deck[-1, ]
head(deck, 3)

deal <- function(){
  card <- deck[1, ]
  deck <- deck[-1, ]
  card
} # This won't work because R will be in a runtime environment when it executes deck

# Exercise 2: Rewrite the deck <- deck[-1, ] line of deal to assign deck[-1, ] to an object named deck 
deal <- function(){
  card <- deck[1, ]
  assign("deck", deck[-1, ], envir = globalenv())
  card
}
deal()

shuffle <- function(cards) {
  random <- sample(1:52, size = 52) 
  cards[random, ]
}
head(deck, 3)
a <- shuffle(deck)
head(deck, 3)
head(a, 3)

# Exercise 3:Rewrite shuffle so that it replaces the copy of deck that lives in the global environment with a shuffled version of DECK
shuffle <- function(){
  random <- sample(1:52, size = 52)
  assign("deck", DECK[random, ], envir = globalenv())
}
shuffle()
deal()

# Chapter 7
# The play function

get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0") 
  sample(wheel, size = 3, replace = TRUE,
    prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}
get_symbols()

# Create the play function
play <- function() { 
  symbols <- get_symbols() 
  print(symbols) 
  score(symbols)
}

# If statement
num <- -2
if (num < 0) { 
  num <- num * -1
}
num

num <- -1
if (num < 0) {
  print("num is negative.") 
  print("Don't worry, I'll fix it.") 
  num <- num * -1
  print("Now num is positive.")
}
num

# Exercise 1: what will this return
x <- 1
if (3 == 3) {
  x <- 2 
}
x

# 2
x <- 1
if (x == 1) {
  x <- 2
  if (x == 1) {
    x <- 3 }
}
x

# If else statement 
dec <- a 
dec
if (dec >= 0.5) {
  a <- trunc(a) + 1
} else {
  a <- trunc(a)
}
a

# Situations with more than two mutually exclusive cases
a <- 1 
b <- 1
if (a > b) { 
  print("A wins!")
} else if (a < b) { 
  print("B wins!")
} else { 
  print("Tie.")
}

# To calculate the score for our play function
# Exercise 3: Turn the preceding statement into a logical test written in R
symbols <- c("7", "7", "7")

symbols
symbols[1] == symbols[2] & symbols[2] == symbols[3]
all(symbols == symbols[1])
same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]

# Exercise 4: Use R’s logical and Boolean operators to write a test that will determine whether a vector named symbols contains only symbols that are a type of bar
symbols[1] == "B" | symbols[1] == "BB" | symbols[1] == "BBB" &
  symbols[2] == "B" | symbols[2] == "BB" | symbols[2] == "BBB" &
  symbols[3] == "B" | symbols[3] == "BB" | symbols[3] == "BBB"
all(symbols %in% c("B", "BB", "BBB"))
same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
bars <- symbols %in% c("B", "BB", "BBB")
if (same) {
  symbol <- symbols[1] 
  if (symbol == "DD") {
    prize <- 800
  } else if (symbol == "7") {
    prize <- 80
  } else if (symbol == "BBB") {
    prize <- 40
  } else if (symbol == "BB") {
    prize <- 5
  } else if (symbol == "B") {
    prize <- 10
  } else if (symbol == "C") {
    prize <- 10
  } else if (symbol == "0") {
    prize <- 0
  }
}
same
